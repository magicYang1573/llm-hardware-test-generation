#include <iostream>
#include <random>
#include <chrono>

#include "RandomGuidance.h"

using namespace std;

RandomGuidance::RandomGuidance(string cov_path, int reset_cycle_num, int iter_cnt_max) {
    reset_cycle_num_ = reset_cycle_num;
    iter_cnt_max_ = iter_cnt_max;
    cov_path_ = cov_path;
    cov_path_total_ = cov_path_ + ".total";

    // get signal informations
    string filePath = "../input-signals.txt";
    std::ifstream inFile(filePath);

    if (!inFile.is_open()) {
        throw std::runtime_error("Could not open file: " + filePath);
    }

    std::string line;
    while (std::getline(inFile, line)) {
        std::istringstream iss(line);
        std::string inputSignal;
        int width;

        if (!(iss >> inputSignal >> width)) {
            throw std::runtime_error("Error parsing line: " + line);
        }

        signal_width_sum_ += width;
    }

}

int RandomGuidance::waitForInput() {
    if(++iter_cnt_ > iter_cnt_max_) {
        return 0;
    }
    else {
        return 1;
    }
}

vector<bool> RandomGuidance::getBitInput() {
    int bit_num = reset_cycle_num_ * signal_width_sum_;

    unsigned seed = std::chrono::system_clock::now().time_since_epoch().count();
    std::default_random_engine generator(seed);

    std::uniform_int_distribution<int> distribution(0, 1);

    std::vector<bool> array(bit_num);

    for (int i = 0; i < bit_num; i++) {
        array[i] = distribution(generator);
    }

    return array;
}

int RandomGuidance::sendCovFeedback() {

    // 1> keep total coverage
    ifstream in_file(cov_path_total_);
    string cmd;
    if (!in_file.is_open()) {
        // The first iteration
        cmd = "verilator_coverage -write " + cov_path_total_ +  " " + cov_path_;
    } else {
        // cmd: verilator_coverage -write coverage.dat.total coverage.dat.total coverage.dat
        // coverage.dat.total = coverage.dat.total + coverage.dat
        cmd = "verilator_coverage -write " + cov_path_total_ + " " + cov_path_total_ + " " + cov_path_;
    }
    system(cmd.c_str());

    // 2> update coverage information
    pair<int,int> cur_cov_pair = getCoverageNum(cov_path_total_);
    int cur_cov_num = cur_cov_pair.first;
    int total_cov_num = cur_cov_pair.second;

    if(cur_cov_num>cur_covered_num_) {
        cur_covered_num_ = cur_cov_num;
    } 

    // print log
    cout<<"Random: Iter = "<< iter_cnt_<<"   Clk Cycle = "<<iter_cnt_*reset_cycle_num_<<endl;
    cout<<"        Cov = "<<(float)cur_cov_num/(float)total_cov_num<<"("<<cur_cov_num<<"/"<<total_cov_num<<")\n";

    if(cur_cov_num==total_cov_num) {
        return 1;
    }
    else return 0;
}

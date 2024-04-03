
#pragma once

#include <vector>
#include <iostream>
#include <fstream>
#include <sstream>
using namespace std;

struct CoverageInfo {
    std::string text;
    int coverageCount;
};

class Guidance {
public:
    Guidance(){};
    ~Guidance(){};

    // If Guidance prepared for a new loop, return true
    // If false, stop the verification loop
    virtual int waitForInput() = 0;

    // Get input from Guidance
    virtual std::vector<bool> getBitInput() = 0;

    // Send hardware simulation coverage as feedback to Guidance
    virtual int sendCovFeedback() = 0;

protected:
    // analyse coverage dat and return coverage
    vector<CoverageInfo> getCoverage(string filename = "logs/coverage.dat") {
        std::ifstream file(filename);
        if (!file.is_open()) {
            throw std::runtime_error("Could not open file " + filename);
        }

        std::vector<CoverageInfo> result;
        std::string line;
        while (std::getline(file, line)) {
            if (line.find("branch") != std::string::npos || line.find("line") != std::string::npos) {
                std::istringstream iss(line);
                std::string dummy, text;
                int count;
                iss >> dummy >> text >> count;
                result.push_back({text, count});
            }
        }

        file.close();
        return result;
    }

    // Get current coverage situation
    // return pair < covered points, total points > 
    pair<int,int> getCoverageNum(string filename = "logs/coverage.dat") {
        ifstream infile(filename);  
        if (!infile.is_open()) {
            return {0, 0};
        }

        string line;
        int covered_points = 0;
        int total_points = 0;

        while (getline(infile, line)) {
            if (line.empty() || line[0] == '#') {
                continue;
            }

            istringstream iss(line);
            string token;
            int hit_count = 0;

            while (iss >> token) {}
            hit_count = stoi(token);

            total_points++;
            if (hit_count > 0) {
                covered_points++;
            }
        }

        infile.close();

        return {covered_points, total_points};
    }
};
#include <vector>
#include "../../src-basic/Guidance.h"
using namespace std;

class RandomGuidance : public Guidance {
public:

    // Launch AFL
    RandomGuidance(string cov_path, int reset_cycle_num, int iter_cnt_max );

    // If Guidance prepared for a new loop, return true
    int waitForInput();

    // Get input from Guidance
    std::vector<bool> getBitInput();

    // Send hardware simulation coverage as feedback to Guidance
    int sendCovFeedback();

private:
    void printLog();

    // reset after some clock cycles
    int reset_cycle_num_;

    // stop after iterations
    int iter_cnt_ = 0;
    int iter_cnt_max_;
    
    // generate input according to signal width
    int signal_width_sum_ = 0;

    // cov info
    int cur_covered_num_ = 0;
    // path that verilator write back coverage result, it is the cov data of one QA iteration
    string cov_path_;
    // path that save the total coverage from test beginning
    string cov_path_total_;
};

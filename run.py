import sys
import os


def main():
    
    # construct DUT target
    dut_list = ['benchmark/dut/m01.sv']
    dut_des_list = ['benchmark/dut-description-gpt/m01.des']
    test_guidance_list = ['benchmark/test-guidance-man/m01.inst']
    cnt = 2

    # make logs dir
    if not os.path.exists('./logs'):
        os.system("mkdir logs")

    # for each DUT
    for i in range(0,len(dut_list)):
        dut = dut_list[i]
        dut_des = dut_des_list[i]
        test_guidance = test_guidance_list[i]

        # make log dir
        dir_name = dut.split('/')[-1].split('.')[0]
        if os.path.exists('./logs/'+dir_name):
            os.system('rm -rf ./logs/'+dir_name)
        os.system('cd ./logs && mkdir ' + dir_name)
        
        for i in range(0, cnt):
            # reset simulation env
            os.system('cd sim && make clean > /dev/null 2>&1')
            os.system('rm -rf sim/top.v')

            # copy DUT to simulation workspace
            os.system('cp {} sim/top.v'.format(dut))
            # copy DUT description and test guidance to workspace
            os.system('cp {} sim/top.v.des'.format(dut_des))
            os.system('cp {} sim/top.v.inst'.format(test_guidance))

            # generate harness for each DUT
            os.system('python3 harness-generator.py -t top sim/top.v > /dev/null 2>&1')
            os.system('rm -rf parser.out parsetab.py')
            # run simulation
            os.system('cd sim && make clean > /dev/null 2>&1 && make > /dev/null 2>&1')
            # copy logs to the log dir
            os.system('cp -dr sim/logs ./logs/' + dir_name + '/log-' + str(i+1))

            print(dut + " : " +  str(i+1) + '/' + str(cnt))


if __name__ == '__main__':
    main()


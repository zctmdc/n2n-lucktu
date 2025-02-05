#!/bin/bash

. init_logger.sh
. get_file_infos.sh

SAVE_FILE_INFOS() {
    result_version=${src_version_b_s_rc}

    # result_str="${src_machine} - ${result_version}"

    # e.g. arm64\naarch64 | mips64
    # arm64
    # aarch64
    # result_str="${src_machine}${src_machine_alias:+\n}${src_machine_alias}"

    result_str="${src_machine}"
    LOG_INFO result_str: ${result_str}

    result_file=${RESULT_DIR}/${result_version}.txt
    LOG_INFO result_file: ${result_file}

    echo -e ${result_str} >>${result_file}
    echo -e ${result_str} >>${RESULT_DIR}/all.txt

    # e.g. ${RESULT_DIR}/v2/2.0.0
    vmv_dir=${RESULT_DIR}/${src_big_version}/${src_small_version}
    mkdir -p ${vmv_dir}
    l_result_file=${vmv_dir}/${result_version}.txt
    echo -e ${result_str} >>${l_result_file}
}

LOG_INFO "init SAVE_FILE_INFOS success - $(caller)"

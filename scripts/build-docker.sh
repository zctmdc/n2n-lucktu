#!/bin/bash

. init_logger.sh

. scan_one_build.sh

if [[ -n "${VERSION_B_S_rC}" ]]; then
    LOG_WARNING use VERSION_B_S_rC
    version_b_s_rc="${VERSION_B_S_rC}"
fi

if [[ -z "${version_b_s_rc}" && -n "${BIG_VERSION}" ]]; then
    LOG_WARNING use BIG_VERSION
    version_b_s_rc="${BIG_VERSION}${SMALL_VERSION:+_}${SMALL_VERSION}${COMMIT:+_r}${COMMIT}"
fi
LOG_WARNING "Try Build: version_b_s_rc - ${version_b_s_rc}"

# if [[ "${version_b_s_rc}" == "v2s" || "${version_b_s_rc}" == "v2" || "${version_b_s_rc}" == "v1" ]]; then
if [[ -n "$(echo ${version_b_s_rc} | grep -E '^v[0-9]s?$')" ]]; then
    LOG_WARNING "BUILD releases VERSION"
    . init_path.sh
    LOG_WARNING "复制 ${PROJECT_ROOT_DIR}/Linux/n2n_${version_b_s_rc}\n  [\n$(ls ${PROJECT_ROOT_DIR}/Linux/n2n_${version_b_s_rc}/)\n  ]\n  $BUILD_SRC"
    cp ${PROJECT_ROOT_DIR}/Linux/n2n_${version_b_s_rc}/* $BUILD_SRC
    exit 0
fi
export VERSION_B_S_rC=${version_b_s_rc}
SCAN_ONE_BUILD ${version_b_s_rc}

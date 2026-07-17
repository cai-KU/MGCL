#!/bin/bash

# =========================== 基础配置 ===========================
# 项目根目录（包含 project_utils, data, models 等）
PROJECT_ROOT="/home/tangqingyuan/un0RselfSupervised/video_CMS"

DATASET="teachers"
EPOCHS=20
BATCH_SIZE=128
NUM_WORKERS=16
LR=0.01
BASE_EXP_ROOT="${PROJECT_ROOT}/log/exp_grid"

mkdir -p $BASE_EXP_ROOT

# 基准参数（与表格默认值一致）
BASE_PARAMS="k=8 temperature=0.25 unsup_con_weight=0.65 sup_con_weight=0.35 pse_con_weight=0.35 alpha=0.2 lr=0.01 pesudo_samples=6 e=5 select_lamda=0.5"

# 实验列表：格式 "实验标识 参数覆盖"
EXPERIMENTS=(
    # unsup_con_weight
    "unsup_w085 unsup_con_weight=0.85"
    "unsup_w055 unsup_con_weight=0.55"
    "unsup_w045 unsup_con_weight=0.45"

    # sup_con_weight
    "sup_w025 sup_con_weight=0.25"
    "sup_w015 sup_con_weight=0.15"
    "sup_w045 sup_con_weight=0.45"
    "sup_w055 sup_con_weight=0.55"

    # pse_con_weight
    "pse_w045 pse_con_weight=0.45"
    "pse_w055 pse_con_weight=0.55"
    "pse_w015 pse_con_weight=0.15"
    "pse_w025 pse_con_weight=0.25"

    # temperature
    "temp_020 temperature=0.20"
    "temp_015 temperature=0.15"
    "temp_030 temperature=0.30"
    "temp_035 temperature=0.35"

    # e
    "e_1 e=1"
    "e_3 e=3"
    "e_7 e=7"

    # pesudo_samples
    "pseudo_4 pesudo_samples=4"
    "pseudo_8 pesudo_samples=8"
    "pseudo_10 pesudo_samples=10"

    # select_lamda
    "lamda_03 select_lamda=0.3"
    "lamda_04 select_lamda=0.4"
    "lamda_06 select_lamda=0.6"
    "lamda_07 select_lamda=0.7"
)

# =========================== 运行所有实验 ===========================
for exp in "${EXPERIMENTS[@]}"; do
    read -r exp_name override_params <<< "$exp"
    
    EXP_DIR="${BASE_EXP_ROOT}/${exp_name}"
    mkdir -p $EXP_DIR
    
    echo "========================================"
    echo "Running experiment: $exp_name"
    echo "Override parameters: $override_params"
    echo "Output dir: $EXP_DIR"
    
    # 切换到项目根目录，确保 Python 能找到 project_utils 等模块
    cd $PROJECT_ROOT || { echo "Failed to cd to $PROJECT_ROOT"; exit 1; }
    
    # 构建命令（使用绝对路径或相对路径，已处于 PROJECT_ROOT）
    CMD="python -m modified_code.contrastive_meanshift_training \
        --dataset_name $DATASET \
        --epochs $EPOCHS \
        --batch_size $BATCH_SIZE \
        --num_workers $NUM_WORKERS \
        --lr $LR \
        --exp_root $BASE_EXP_ROOT \
        --mode_name $exp_name"
    
    # 添加基准参数
    for param in $BASE_PARAMS; do
        CMD="$CMD --$param"
    done
    
    # 添加覆盖参数
    for ovr in $override_params; do
        CMD="$CMD --$ovr"
    done
    
    # 执行命令（不使用 eval，直接运行）
    $CMD
    
    echo "Finished experiment: $exp_name"
    echo "========================================"
    echo ""
done

echo "All experiments completed."
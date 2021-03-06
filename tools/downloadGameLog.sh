#!/bin/sh

# No arguments : creates folder 'robot_logs' in current directory
# Argument 1 : path of directory where 'logs' are downloaded

HOST="rhoban@10.0.0.1"

OUTPUT_DIR="vision_logs"
if [ $# -gt 0 ]
then
    OUTPUT_DIR=$1
fi

# Retrieving robot hostname
ROBOT=$(ssh $HOST hostname)
    
OUTPUT_DIR=$OUTPUT_DIR'/'${ROBOT}
mkdir -p ${OUTPUT_DIR}

LOG_PATH="/home/rhoban/env/${ROBOT}/game_logs"
    
# If the folder exist copy it
if ssh $HOST [ -d $LOG_PATH ]
then
    # copy files in dir
    scp -r ${HOST}:${LOG_PATH}/* ${OUTPUT_DIR}
    # delete files on robot
    ssh ${HOST} "rm -rf ${LOG_PATH}"
else
    echo "${LOG_PATH} not found on ${HOST}"
    exit -1
fi



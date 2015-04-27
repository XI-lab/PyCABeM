#!/bin/sh

PYTHON=`whereis pypy | grep "/"`
echo PYTHON1: $PYTHON
if [ "$PYTHON" ]
then
	PYTHON="pypy"
else 
	PYTHON="python"
fi

TIMEOUT=36
TIMEOUT_UNIT=h
DATASETS=snap
EXECLOG=hichbem.log  # Log for the execution status
EXECERR=hichbem.err  # Log for execution errors

echo 'Starting the benchmark: $ nohup '$PYTHON" hicbem.py -d ${DATASETS} -t$TIMEOUT_UNIT $TIMEOUT  1> ${EXECLOG}  2> ${EXECERR}"' &'
nohup $PYTHON hicbem.py -d ${DATASETS} -t$TIMEOUT_UNIT $TIMEOUT  1> ${EXECLOG} 2> ${EXECERR} &
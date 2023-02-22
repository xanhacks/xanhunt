#!/bin/bash

log() {
    printf '[%(%d/%m/%Y %H:%M:%S)T]' # date format
    echo " ${1}"
}

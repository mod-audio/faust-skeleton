#!/usr/bin/make -f
# Makefile for max-gen-skeleton #
# ----------------------------- #
# Created by falkTX
#

# ---------------------------------------------------------------------------------------------------------------------
# Import plugin information

include .plugin-info

FILES_DSP = FaustGeneratedPlugin.cpp

# ---------------------------------------------------------------------------------------------------------------------
# Build setup

DPF_TARGET_DIR=../bin
include dpf/Makefile.plugins.mk

BUILD_CXX_FLAGS += -I../plugin

all: lv2_sep

# ---------------------------------------------------------------------------------------------------------------------

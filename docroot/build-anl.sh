#!/bin/bash

singularity exec -B `pwd` /vol/patric3/cli/sphinx2.sif make html

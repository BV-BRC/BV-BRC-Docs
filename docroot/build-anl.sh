#!/bin/bash

singularity exec -B `pwd` /vol/patric3/cli/sphinx.sif make html

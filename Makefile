name: C++ Build

on:
  push:
    branches:
      - branchMake
  pull_request:
    branches:
      - branchMake

jobs:
  build:
    runs-on: ubuntu-latest

    steps:
    - name: Checkout code
      uses: actions/checkout@v3

    - name: Install g++
      run: sudo apt-get update && sudo apt-get install -y g++-10

    - name: Build with Makefile
      run: make all CXX=g++-10

    - name: Verify binary file
      run: ls -l bin/program || echo "Binary not found"

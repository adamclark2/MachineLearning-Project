# helloTensorflowPy
A hello-worldy python tensorflow

# Environment Setup
1. Get python v3
1. pip3 install & verify

        pip3 install --user --upgrade tensorflow  # install in $HOME
        python3 -c "import tensorflow as tf; print(tf.__version__)"

# Alternate Env Setup (Mac Os)
Thanks https://www.tensorflow.org/install/pip 

1. Get python v3
1. Run the command

        pip3 install --upgrade pip

1. pip3 install & verify

        pip3 install --user --upgrade https://storage.googleapis.com/tensorflow/mac/cpu/tensorflow-1.11.0-py3-none-any.whl
        python3 -c "import tensorflow as tf; print(tf.__version__)"

1. Extras (Needed by various .py files in src)

        pip3 install -U matplotlib

# Running

        python3 ./src/HelloWorld.py 

# Running `BasicClassification.py`

1. Get your environment setup
1. Run the Command:

        python3 ./src/BasicClassification.py

1. Keep pressing `X` to close the popup window(s),they kinda bug out but keep going.
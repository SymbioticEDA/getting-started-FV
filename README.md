# Getting started with Formal Verification

This short guide aims to get you started with the [Symbiotic EDA](https://www.symbioticeda.com/) Formal Verification tools.

It assumes you are using the Symbiotic Suite. If that is not the case you can learn how to [build and install the tools here](https://symbiyosys.readthedocs.io/en/latest/quickstart.html#installing).

## Install the tools and the license

You will have been sent the license and a link to download the tools. 
For this example we will assume the tool package has been downloaded to ~/Downloads/symbiotic-20190924B-symbiotic.tar.gz
And the license has been downloaded to ~/Downloads/symbiotic-eval.lic

Make sure you change the text below to match your package and license names.

Typically you will install the tools like this:

    cd /opt
    sudo tar -tzf ~/Downloads/symbiotic-20190924B-symbiotic.tar.gz

Then include this new directory in your PATH environment variable:

    export PATH=$PATH:/opt/symbiotic-20190924B-symbiotic/bin

If you want to make this change permanent, add it to your .bashrc file:

    echo 'export PATH=$PATH:/opt/symbiotic-20190924B-symbiotic/bin"' >> ~/.bashrc

Save the license file to a safe place:

    cp ~/Downloads/symbiotic-eval.lic ~/

And create a new environment variable so the tools can find it:

    export SYMBIOTIC_LICENSE="~/symbiotic-eval.lic"

If you want to make this permament, add it to your .bashrc file:

    echo 'export SYMBIOTIC_LICENSE="~/symbiotic-eval.lic"' >> ~/.bashrc

## Check the tools are installed correctly

run this command:

    which yosys

This should return the path where yosys is installed in /opt/symbiotic

    yosys

This will start yosys in shell mode and you should see that your license is verified (press ctrl+D to exit):

    [license] Signature verified.

If not, please contact us to help you resolve the issue.

# Resources

* https://symbiyosys.readthedocs.io/en/latest/
* Dan Gisslequist's blog contains a lot of posts about FV: http://zipcpu.com/

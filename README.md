# Getting started with Formal Verification

This short guide aims to get you started with the [Symbiotic EDA](https://www.symbioticeda.com/) Formal Verification tools.

It assumes you are using the Symbiotic Suite. If that is not the case you can learn how to [build and install the tools here](https://symbiyosys.readthedocs.io/en/latest/quickstart.html#installing).

## Install the tools and the license

You will have been sent the license and a link to download the tools. 
For this example we will assume the tool package has been downloaded to ~/Downloads/symbiotic-20190924B-symbiotic.tar.gz
and the license has been downloaded to ~/Downloads/symbiotic-eval.lic

Make sure you change the text below to match your package and license names.

Typically you will install the tools like this:

    cd /opt
    sudo tar -xzf ~/Downloads/symbiotic-20190924B-symbiotic.tar.gz

Then include this new directory in your PATH environment variable:

    export PATH=/opt/symbiotic-20190924B-symbiotic/bin:$PATH

If you want to make this change permanent, add it to your .bashrc file:

    echo 'export PATH=/opt/symbiotic-20190924B-symbiotic/bin:$PATH' >> ~/.bashrc

Save the license file to a safe place:

    cp ~/Downloads/symbiotic-eval.lic ~/

And create a new environment variable so the tools can find it:

    export SYMBIOTIC_LICENSE="$HOME/symbiotic-eval.lic"

If you want to make this permament, add it to your .bashrc file:

    echo 'export SYMBIOTIC_LICENSE="$HOME/symbiotic-eval.lic"' >> ~/.bashrc

## Check the tools are installed correctly

run this command:

    which yosys

This should return the path where yosys is installed in /opt/symbiotic

    yosys

This will start yosys in shell mode and you should see that your license is verified (press ctrl+D to exit):

    [license] Signature verified.

If not, please contact us to help you resolve the issue.

## Formally Verify a simple Verilog example

Take a look at the example: [counter.v](counter.v). We have one formal property, an assertion that the counter will always be less than `MAX_AMOUNT`.
[counter.sby](counter.sby) is the [configuration file](https://symbiyosys.readthedocs.io/en/latest/reference.html).

Run this command to Formally Verify the counter example:

    sby -f counter.sby

The `-f` switch removes previous test results. You will see some log output from the tool and the last line shows the result: FAIL.
When the tools find a way to break an assertion they generate a trace file. 

* If the test failed bounded model checking (BMC), the trace will be written to counter/engine_0/trace.vcd. 
* If the test failed induction, the trace will be written to counter/engine_0/trace_induct.vcd.

The BMC failed because the solver was able to set the initial value of the count register to a value greater than `MAX_AMOUNT`. 
Fix this by setting a default value for the register and then run the verification again. 

To learn more about Formal Verification, see the [resources section below](#Resources)

## Formally Verify a simple VHDL example

The tools currently don't support VHDL formal properties. The work-around is to write the formal properties with System Verilog Assertions and then bind
that to the module under test.

Take a look at the example: [counter.vhd](counter.vhd). 
To define the a formal properties, we created [counter_vhd.sv](counter_vhd.sv). In this file we make an assertion that the counter will always be less than `MAX_AMOUNT`.

[counter_vhd.sby](counter_vhd.sby) is the [configuration file](https://symbiyosys.readthedocs.io/en/latest/reference.html).

Run this command to Formally Verify the counter example:

    sby -f counter_vhd.sby

The `-f` switch removes previous test results. You will see some log output from the tool and the last line shows the result: FAIL.
When the tools find a way to break an assertion they generate a trace file. 

* If the test failed bounded model checking (BMC), the trace will be written to counter_vhd/engine_0/trace.vcd. 
* If the test failed induction, the trace will be written to counter_vhd/engine_0/trace_induct.vcd.

The BMC failed because the solver was able to set the initial value of the count register to a value greater than `MAX_AMOUNT`. 
Fix this by setting a default value for the register and then run the verification again. 

To learn more about Formal Verification, see the [resources section below](#Resources)

# Resources

* Symbiyosys docs https://symbiyosys.readthedocs.io/en/latest/
* Dan Gisslequist's blog contains a lot of posts about FV: http://zipcpu.com/
* Videos and Presentations on Formal Verification: https://www.youtube.com/c/SymbioticEDA
* You can also request a demo or book a training course by contacting us at https://www.symbioticeda.com/

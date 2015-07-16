
function gbe_readout_ctrl_config(this_block)

  % Revision History:
  %
  %   01-Oct-2014  (19:52 hours):
  %     Original code was machine generated by Xilinx's System Generator after parsing
  %     /home/jack/work/ami_correlator/ami/ami_correlator/verilog/gbe_readout_ctrl.v
  %
  %

  this_block.setTopLevelLanguage('Verilog');

  this_block.setEntityName('gbe_readout_ctrl');

  % System Generator has to assume that your entity  has a combinational feed through; 
  %   if it  doesn't, then comment out the following line:
  this_block.tagAsCombinational;

  this_block.addSimulinkInport('gbe_empty');
  this_block.addSimulinkInport('lb_empty');

  this_block.addSimulinkOutport('gbe_re');
  this_block.addSimulinkOutport('lb_re');

  gbe_re_port = this_block.port('gbe_re');
  gbe_re_port.setType('Bool');
  gbe_re_port.useHDLVector(false);
  lb_re_port = this_block.port('lb_re');
  lb_re_port.setType('Bool');
  lb_re_port.useHDLVector(false);

  % -----------------------------
  if (this_block.inputTypesKnown)
    % do input type checking, dynamic output type and generic setup in this code block.

    if (this_block.port('gbe_empty').width ~= 1);
      this_block.setError('Input data type for port "gbe_empty" must have width=1.');
    end

    this_block.port('gbe_empty').useHDLVector(false);

    if (this_block.port('lb_empty').width ~= 1);
      this_block.setError('Input data type for port "lb_empty" must have width=1.');
    end

    this_block.port('lb_empty').useHDLVector(false);

  end  % if(inputTypesKnown)
  % -----------------------------

  % -----------------------------
   if (this_block.inputRatesKnown)
     setup_as_single_rate(this_block,'clk','ce')
   end  % if(inputRatesKnown)
  % -----------------------------

    % (!) Set the inout port rate to be the same as the first input 
    %     rate. Change the following code if this is untrue.
    uniqueInputRates = unique(this_block.getInputRates);

  % (!) Custimize the following generic settings as appropriate. If any settings depend
  %      on input types, make the settings in the "inputTypesKnown" code block.
  %      The addGeneric function takes  3 parameters, generic name, type and constant value.
  %      Supported types are boolean, real, integer and string.
  this_block.addGeneric('WORDS_PER_PACKET','integer','7');
  this_block.addGeneric('WORDS_PER_PACKET_BITS','integer','3');

  % Add addtional source files as needed.
  %  |-------------
  %  | Add files in the order in which they should be compiled.
  %  | If two files "a.vhd" and "b.vhd" contain the entities
  %  | entity_a and entity_b, and entity_a contains a
  %  | component of type entity_b, the correct sequence of
  %  | addFile() calls would be:
  %  |    this_block.addFile('b.vhd');
  %  |    this_block.addFile('a.vhd');
  %  |-------------

  %    this_block.addFile('');
  %    this_block.addFile('');
  this_block.addFile('verilog/gbe_readout_ctrl.v');

return;


% ------------------------------------------------------------

function setup_as_single_rate(block,clkname,cename) 
  inputRates = block.inputRates; 
  uniqueInputRates = unique(inputRates); 
  if (length(uniqueInputRates)==1 & uniqueInputRates(1)==Inf) 
    block.addError('The inputs to this block cannot all be constant.'); 
    return; 
  end 
  if (uniqueInputRates(end) == Inf) 
     hasConstantInput = true; 
     uniqueInputRates = uniqueInputRates(1:end-1); 
  end 
  if (length(uniqueInputRates) ~= 1) 
    block.addError('The inputs to this block must run at a single rate.'); 
    return; 
  end 
  theInputRate = uniqueInputRates(1); 
  for i = 1:block.numSimulinkOutports 
     block.outport(i).setRate(theInputRate); 
  end 
  block.addClkCEPair(clkname,cename,theInputRate); 
  return; 

% ------------------------------------------------------------


function tge_rx_out_8a_core_config(this_block)

  % Revision History:
  %
  %   06-Jan-2015  (18:11 hours):
  %     Original code was machine generated by Xilinx's System Generator after parsing
  %     /home/jack/work/ami_correlator/ami/ami_correlator/tge_rx_out_8a_core.vhd
  %
  %

  this_block.setTopLevelLanguage('VHDL');

  this_block.setEntityName('tge_rx_out_8a_core');

  % System Generator has to assume that your entity  has a combinational feed through; 
  %   if it  doesn't, then comment out the following line:
  this_block.tagAsCombinational;

  this_block.addSimulinkInport('max_buf');
  this_block.addSimulinkOutport('link_cnt');
  this_block.addSimulinkOutport('rd_addr');
  this_block.addSimulinkOutport('rd_en0');
  this_block.addSimulinkOutport('rd_en1');
  this_block.addSimulinkOutport('rd_en2');
  this_block.addSimulinkOutport('rd_en3');

  link_cnt_port = this_block.port('link_cnt');
  link_cnt_port.setType('UFix_2_0');
  rd_addr_port = this_block.port('rd_addr');
  rd_addr_port.setType('UFix_12_0');
  rd_en0_port = this_block.port('rd_en0');
  rd_en0_port.setType('Bool');
  rd_en0_port.useHDLVector(false);
  rd_en1_port = this_block.port('rd_en1');
  rd_en1_port.setType('Bool');
  rd_en1_port.useHDLVector(false);
  rd_en2_port = this_block.port('rd_en2');
  rd_en2_port.setType('Bool');
  rd_en2_port.useHDLVector(false);
  rd_en3_port = this_block.port('rd_en3');
  rd_en3_port.setType('Bool');
  rd_en3_port.useHDLVector(false);

  % -----------------------------
  if (this_block.inputTypesKnown)
    % do input type checking, dynamic output type and generic setup in this code block.

    if (this_block.port('max_buf').width ~= 7);
      this_block.setError('Input data type for port "max_buf" must have width=7.');
    end


  end  % if(inputTypesKnown)
  % -----------------------------

  % -----------------------------
   if (this_block.inputRatesKnown)
     setup_as_single_rate(this_block,'clk_1','ce_1')
   end  % if(inputRatesKnown)
  % -----------------------------

    % (!) Set the inout port rate to be the same as the first input 
    %     rate. Change the following code if this is untrue.
    uniqueInputRates = unique(this_block.getInputRates);


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
  this_block.addFile('tge_rx_out_8a_core.vhd');

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


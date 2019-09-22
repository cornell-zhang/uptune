//-----------------------------------------------------------------------------
// Systolic_Array_8x8
//-----------------------------------------------------------------------------
// PyMTL: dump_vcd = False
// PyMTL: spmm.Systolic_Array_Para {"nbits": 32, "nports": 8}
// PyMTL: verilator_xinit = zeros
`default_nettype none
module Systolic_Array_8x8
(
  input  wire [  63:0] a_feeder_in$000_msg,
  output wire [   0:0] a_feeder_in$000_rdy,
  input  wire [   0:0] a_feeder_in$000_val,
  input  wire [  63:0] a_feeder_in$001_msg,
  output wire [   0:0] a_feeder_in$001_rdy,
  input  wire [   0:0] a_feeder_in$001_val,
  input  wire [  63:0] a_feeder_in$002_msg,
  output wire [   0:0] a_feeder_in$002_rdy,
  input  wire [   0:0] a_feeder_in$002_val,
  input  wire [  63:0] a_feeder_in$003_msg,
  output wire [   0:0] a_feeder_in$003_rdy,
  input  wire [   0:0] a_feeder_in$003_val,
  input  wire [  63:0] a_feeder_in$004_msg,
  output wire [   0:0] a_feeder_in$004_rdy,
  input  wire [   0:0] a_feeder_in$004_val,
  input  wire [  63:0] a_feeder_in$005_msg,
  output wire [   0:0] a_feeder_in$005_rdy,
  input  wire [   0:0] a_feeder_in$005_val,
  input  wire [  63:0] a_feeder_in$006_msg,
  output wire [   0:0] a_feeder_in$006_rdy,
  input  wire [   0:0] a_feeder_in$006_val,
  input  wire [  63:0] a_feeder_in$007_msg,
  output wire [   0:0] a_feeder_in$007_rdy,
  input  wire [   0:0] a_feeder_in$007_val,
  output wire [  63:0] a_feeder_out$000_msg,
  input  wire [   0:0] a_feeder_out$000_rdy,
  output wire [   0:0] a_feeder_out$000_val,
  output wire [  63:0] a_feeder_out$001_msg,
  input  wire [   0:0] a_feeder_out$001_rdy,
  output wire [   0:0] a_feeder_out$001_val,
  output wire [  63:0] a_feeder_out$002_msg,
  input  wire [   0:0] a_feeder_out$002_rdy,
  output wire [   0:0] a_feeder_out$002_val,
  output wire [  63:0] a_feeder_out$003_msg,
  input  wire [   0:0] a_feeder_out$003_rdy,
  output wire [   0:0] a_feeder_out$003_val,
  output wire [  63:0] a_feeder_out$004_msg,
  input  wire [   0:0] a_feeder_out$004_rdy,
  output wire [   0:0] a_feeder_out$004_val,
  output wire [  63:0] a_feeder_out$005_msg,
  input  wire [   0:0] a_feeder_out$005_rdy,
  output wire [   0:0] a_feeder_out$005_val,
  output wire [  63:0] a_feeder_out$006_msg,
  input  wire [   0:0] a_feeder_out$006_rdy,
  output wire [   0:0] a_feeder_out$006_val,
  output wire [  63:0] a_feeder_out$007_msg,
  input  wire [   0:0] a_feeder_out$007_rdy,
  output wire [   0:0] a_feeder_out$007_val,
  input  wire [  31:0] blkdone_ack$000_msg,
  output wire [   0:0] blkdone_ack$000_rdy,
  input  wire [   0:0] blkdone_ack$000_val,
  input  wire [  31:0] blkdone_ack$010_msg,
  output wire [   0:0] blkdone_ack$010_rdy,
  input  wire [   0:0] blkdone_ack$010_val,
  input  wire [  31:0] blkdone_ack$011_msg,
  output wire [   0:0] blkdone_ack$011_rdy,
  input  wire [   0:0] blkdone_ack$011_val,
  input  wire [  31:0] blkdone_ack$012_msg,
  output wire [   0:0] blkdone_ack$012_rdy,
  input  wire [   0:0] blkdone_ack$012_val,
  input  wire [  31:0] blkdone_ack$013_msg,
  output wire [   0:0] blkdone_ack$013_rdy,
  input  wire [   0:0] blkdone_ack$013_val,
  input  wire [  31:0] blkdone_ack$014_msg,
  output wire [   0:0] blkdone_ack$014_rdy,
  input  wire [   0:0] blkdone_ack$014_val,
  input  wire [  31:0] blkdone_ack$015_msg,
  output wire [   0:0] blkdone_ack$015_rdy,
  input  wire [   0:0] blkdone_ack$015_val,
  input  wire [  31:0] blkdone_ack$016_msg,
  output wire [   0:0] blkdone_ack$016_rdy,
  input  wire [   0:0] blkdone_ack$016_val,
  input  wire [  31:0] blkdone_ack$017_msg,
  output wire [   0:0] blkdone_ack$017_rdy,
  input  wire [   0:0] blkdone_ack$017_val,
  input  wire [  31:0] blkdone_ack$018_msg,
  output wire [   0:0] blkdone_ack$018_rdy,
  input  wire [   0:0] blkdone_ack$018_val,
  input  wire [  31:0] blkdone_ack$019_msg,
  output wire [   0:0] blkdone_ack$019_rdy,
  input  wire [   0:0] blkdone_ack$019_val,
  input  wire [  31:0] blkdone_ack$001_msg,
  output wire [   0:0] blkdone_ack$001_rdy,
  input  wire [   0:0] blkdone_ack$001_val,
  input  wire [  31:0] blkdone_ack$020_msg,
  output wire [   0:0] blkdone_ack$020_rdy,
  input  wire [   0:0] blkdone_ack$020_val,
  input  wire [  31:0] blkdone_ack$021_msg,
  output wire [   0:0] blkdone_ack$021_rdy,
  input  wire [   0:0] blkdone_ack$021_val,
  input  wire [  31:0] blkdone_ack$022_msg,
  output wire [   0:0] blkdone_ack$022_rdy,
  input  wire [   0:0] blkdone_ack$022_val,
  input  wire [  31:0] blkdone_ack$023_msg,
  output wire [   0:0] blkdone_ack$023_rdy,
  input  wire [   0:0] blkdone_ack$023_val,
  input  wire [  31:0] blkdone_ack$024_msg,
  output wire [   0:0] blkdone_ack$024_rdy,
  input  wire [   0:0] blkdone_ack$024_val,
  input  wire [  31:0] blkdone_ack$025_msg,
  output wire [   0:0] blkdone_ack$025_rdy,
  input  wire [   0:0] blkdone_ack$025_val,
  input  wire [  31:0] blkdone_ack$026_msg,
  output wire [   0:0] blkdone_ack$026_rdy,
  input  wire [   0:0] blkdone_ack$026_val,
  input  wire [  31:0] blkdone_ack$027_msg,
  output wire [   0:0] blkdone_ack$027_rdy,
  input  wire [   0:0] blkdone_ack$027_val,
  input  wire [  31:0] blkdone_ack$028_msg,
  output wire [   0:0] blkdone_ack$028_rdy,
  input  wire [   0:0] blkdone_ack$028_val,
  input  wire [  31:0] blkdone_ack$029_msg,
  output wire [   0:0] blkdone_ack$029_rdy,
  input  wire [   0:0] blkdone_ack$029_val,
  input  wire [  31:0] blkdone_ack$002_msg,
  output wire [   0:0] blkdone_ack$002_rdy,
  input  wire [   0:0] blkdone_ack$002_val,
  input  wire [  31:0] blkdone_ack$030_msg,
  output wire [   0:0] blkdone_ack$030_rdy,
  input  wire [   0:0] blkdone_ack$030_val,
  input  wire [  31:0] blkdone_ack$031_msg,
  output wire [   0:0] blkdone_ack$031_rdy,
  input  wire [   0:0] blkdone_ack$031_val,
  input  wire [  31:0] blkdone_ack$032_msg,
  output wire [   0:0] blkdone_ack$032_rdy,
  input  wire [   0:0] blkdone_ack$032_val,
  input  wire [  31:0] blkdone_ack$033_msg,
  output wire [   0:0] blkdone_ack$033_rdy,
  input  wire [   0:0] blkdone_ack$033_val,
  input  wire [  31:0] blkdone_ack$034_msg,
  output wire [   0:0] blkdone_ack$034_rdy,
  input  wire [   0:0] blkdone_ack$034_val,
  input  wire [  31:0] blkdone_ack$035_msg,
  output wire [   0:0] blkdone_ack$035_rdy,
  input  wire [   0:0] blkdone_ack$035_val,
  input  wire [  31:0] blkdone_ack$036_msg,
  output wire [   0:0] blkdone_ack$036_rdy,
  input  wire [   0:0] blkdone_ack$036_val,
  input  wire [  31:0] blkdone_ack$037_msg,
  output wire [   0:0] blkdone_ack$037_rdy,
  input  wire [   0:0] blkdone_ack$037_val,
  input  wire [  31:0] blkdone_ack$038_msg,
  output wire [   0:0] blkdone_ack$038_rdy,
  input  wire [   0:0] blkdone_ack$038_val,
  input  wire [  31:0] blkdone_ack$039_msg,
  output wire [   0:0] blkdone_ack$039_rdy,
  input  wire [   0:0] blkdone_ack$039_val,
  input  wire [  31:0] blkdone_ack$003_msg,
  output wire [   0:0] blkdone_ack$003_rdy,
  input  wire [   0:0] blkdone_ack$003_val,
  input  wire [  31:0] blkdone_ack$040_msg,
  output wire [   0:0] blkdone_ack$040_rdy,
  input  wire [   0:0] blkdone_ack$040_val,
  input  wire [  31:0] blkdone_ack$041_msg,
  output wire [   0:0] blkdone_ack$041_rdy,
  input  wire [   0:0] blkdone_ack$041_val,
  input  wire [  31:0] blkdone_ack$042_msg,
  output wire [   0:0] blkdone_ack$042_rdy,
  input  wire [   0:0] blkdone_ack$042_val,
  input  wire [  31:0] blkdone_ack$043_msg,
  output wire [   0:0] blkdone_ack$043_rdy,
  input  wire [   0:0] blkdone_ack$043_val,
  input  wire [  31:0] blkdone_ack$044_msg,
  output wire [   0:0] blkdone_ack$044_rdy,
  input  wire [   0:0] blkdone_ack$044_val,
  input  wire [  31:0] blkdone_ack$045_msg,
  output wire [   0:0] blkdone_ack$045_rdy,
  input  wire [   0:0] blkdone_ack$045_val,
  input  wire [  31:0] blkdone_ack$046_msg,
  output wire [   0:0] blkdone_ack$046_rdy,
  input  wire [   0:0] blkdone_ack$046_val,
  input  wire [  31:0] blkdone_ack$047_msg,
  output wire [   0:0] blkdone_ack$047_rdy,
  input  wire [   0:0] blkdone_ack$047_val,
  input  wire [  31:0] blkdone_ack$048_msg,
  output wire [   0:0] blkdone_ack$048_rdy,
  input  wire [   0:0] blkdone_ack$048_val,
  input  wire [  31:0] blkdone_ack$049_msg,
  output wire [   0:0] blkdone_ack$049_rdy,
  input  wire [   0:0] blkdone_ack$049_val,
  input  wire [  31:0] blkdone_ack$004_msg,
  output wire [   0:0] blkdone_ack$004_rdy,
  input  wire [   0:0] blkdone_ack$004_val,
  input  wire [  31:0] blkdone_ack$050_msg,
  output wire [   0:0] blkdone_ack$050_rdy,
  input  wire [   0:0] blkdone_ack$050_val,
  input  wire [  31:0] blkdone_ack$051_msg,
  output wire [   0:0] blkdone_ack$051_rdy,
  input  wire [   0:0] blkdone_ack$051_val,
  input  wire [  31:0] blkdone_ack$052_msg,
  output wire [   0:0] blkdone_ack$052_rdy,
  input  wire [   0:0] blkdone_ack$052_val,
  input  wire [  31:0] blkdone_ack$053_msg,
  output wire [   0:0] blkdone_ack$053_rdy,
  input  wire [   0:0] blkdone_ack$053_val,
  input  wire [  31:0] blkdone_ack$054_msg,
  output wire [   0:0] blkdone_ack$054_rdy,
  input  wire [   0:0] blkdone_ack$054_val,
  input  wire [  31:0] blkdone_ack$055_msg,
  output wire [   0:0] blkdone_ack$055_rdy,
  input  wire [   0:0] blkdone_ack$055_val,
  input  wire [  31:0] blkdone_ack$056_msg,
  output wire [   0:0] blkdone_ack$056_rdy,
  input  wire [   0:0] blkdone_ack$056_val,
  input  wire [  31:0] blkdone_ack$057_msg,
  output wire [   0:0] blkdone_ack$057_rdy,
  input  wire [   0:0] blkdone_ack$057_val,
  input  wire [  31:0] blkdone_ack$058_msg,
  output wire [   0:0] blkdone_ack$058_rdy,
  input  wire [   0:0] blkdone_ack$058_val,
  input  wire [  31:0] blkdone_ack$059_msg,
  output wire [   0:0] blkdone_ack$059_rdy,
  input  wire [   0:0] blkdone_ack$059_val,
  input  wire [  31:0] blkdone_ack$005_msg,
  output wire [   0:0] blkdone_ack$005_rdy,
  input  wire [   0:0] blkdone_ack$005_val,
  input  wire [  31:0] blkdone_ack$060_msg,
  output wire [   0:0] blkdone_ack$060_rdy,
  input  wire [   0:0] blkdone_ack$060_val,
  input  wire [  31:0] blkdone_ack$061_msg,
  output wire [   0:0] blkdone_ack$061_rdy,
  input  wire [   0:0] blkdone_ack$061_val,
  input  wire [  31:0] blkdone_ack$062_msg,
  output wire [   0:0] blkdone_ack$062_rdy,
  input  wire [   0:0] blkdone_ack$062_val,
  input  wire [  31:0] blkdone_ack$063_msg,
  output wire [   0:0] blkdone_ack$063_rdy,
  input  wire [   0:0] blkdone_ack$063_val,
  input  wire [  31:0] blkdone_ack$006_msg,
  output wire [   0:0] blkdone_ack$006_rdy,
  input  wire [   0:0] blkdone_ack$006_val,
  input  wire [  31:0] blkdone_ack$007_msg,
  output wire [   0:0] blkdone_ack$007_rdy,
  input  wire [   0:0] blkdone_ack$007_val,
  input  wire [  31:0] blkdone_ack$008_msg,
  output wire [   0:0] blkdone_ack$008_rdy,
  input  wire [   0:0] blkdone_ack$008_val,
  input  wire [  31:0] blkdone_ack$009_msg,
  output wire [   0:0] blkdone_ack$009_rdy,
  input  wire [   0:0] blkdone_ack$009_val,
  output wire [  31:0] blkdone_sig$000_msg,
  input  wire [   0:0] blkdone_sig$000_rdy,
  output wire [   0:0] blkdone_sig$000_val,
  output wire [  31:0] blkdone_sig$010_msg,
  input  wire [   0:0] blkdone_sig$010_rdy,
  output wire [   0:0] blkdone_sig$010_val,
  output wire [  31:0] blkdone_sig$011_msg,
  input  wire [   0:0] blkdone_sig$011_rdy,
  output wire [   0:0] blkdone_sig$011_val,
  output wire [  31:0] blkdone_sig$012_msg,
  input  wire [   0:0] blkdone_sig$012_rdy,
  output wire [   0:0] blkdone_sig$012_val,
  output wire [  31:0] blkdone_sig$013_msg,
  input  wire [   0:0] blkdone_sig$013_rdy,
  output wire [   0:0] blkdone_sig$013_val,
  output wire [  31:0] blkdone_sig$014_msg,
  input  wire [   0:0] blkdone_sig$014_rdy,
  output wire [   0:0] blkdone_sig$014_val,
  output wire [  31:0] blkdone_sig$015_msg,
  input  wire [   0:0] blkdone_sig$015_rdy,
  output wire [   0:0] blkdone_sig$015_val,
  output wire [  31:0] blkdone_sig$016_msg,
  input  wire [   0:0] blkdone_sig$016_rdy,
  output wire [   0:0] blkdone_sig$016_val,
  output wire [  31:0] blkdone_sig$017_msg,
  input  wire [   0:0] blkdone_sig$017_rdy,
  output wire [   0:0] blkdone_sig$017_val,
  output wire [  31:0] blkdone_sig$018_msg,
  input  wire [   0:0] blkdone_sig$018_rdy,
  output wire [   0:0] blkdone_sig$018_val,
  output wire [  31:0] blkdone_sig$019_msg,
  input  wire [   0:0] blkdone_sig$019_rdy,
  output wire [   0:0] blkdone_sig$019_val,
  output wire [  31:0] blkdone_sig$001_msg,
  input  wire [   0:0] blkdone_sig$001_rdy,
  output wire [   0:0] blkdone_sig$001_val,
  output wire [  31:0] blkdone_sig$020_msg,
  input  wire [   0:0] blkdone_sig$020_rdy,
  output wire [   0:0] blkdone_sig$020_val,
  output wire [  31:0] blkdone_sig$021_msg,
  input  wire [   0:0] blkdone_sig$021_rdy,
  output wire [   0:0] blkdone_sig$021_val,
  output wire [  31:0] blkdone_sig$022_msg,
  input  wire [   0:0] blkdone_sig$022_rdy,
  output wire [   0:0] blkdone_sig$022_val,
  output wire [  31:0] blkdone_sig$023_msg,
  input  wire [   0:0] blkdone_sig$023_rdy,
  output wire [   0:0] blkdone_sig$023_val,
  output wire [  31:0] blkdone_sig$024_msg,
  input  wire [   0:0] blkdone_sig$024_rdy,
  output wire [   0:0] blkdone_sig$024_val,
  output wire [  31:0] blkdone_sig$025_msg,
  input  wire [   0:0] blkdone_sig$025_rdy,
  output wire [   0:0] blkdone_sig$025_val,
  output wire [  31:0] blkdone_sig$026_msg,
  input  wire [   0:0] blkdone_sig$026_rdy,
  output wire [   0:0] blkdone_sig$026_val,
  output wire [  31:0] blkdone_sig$027_msg,
  input  wire [   0:0] blkdone_sig$027_rdy,
  output wire [   0:0] blkdone_sig$027_val,
  output wire [  31:0] blkdone_sig$028_msg,
  input  wire [   0:0] blkdone_sig$028_rdy,
  output wire [   0:0] blkdone_sig$028_val,
  output wire [  31:0] blkdone_sig$029_msg,
  input  wire [   0:0] blkdone_sig$029_rdy,
  output wire [   0:0] blkdone_sig$029_val,
  output wire [  31:0] blkdone_sig$002_msg,
  input  wire [   0:0] blkdone_sig$002_rdy,
  output wire [   0:0] blkdone_sig$002_val,
  output wire [  31:0] blkdone_sig$030_msg,
  input  wire [   0:0] blkdone_sig$030_rdy,
  output wire [   0:0] blkdone_sig$030_val,
  output wire [  31:0] blkdone_sig$031_msg,
  input  wire [   0:0] blkdone_sig$031_rdy,
  output wire [   0:0] blkdone_sig$031_val,
  output wire [  31:0] blkdone_sig$032_msg,
  input  wire [   0:0] blkdone_sig$032_rdy,
  output wire [   0:0] blkdone_sig$032_val,
  output wire [  31:0] blkdone_sig$033_msg,
  input  wire [   0:0] blkdone_sig$033_rdy,
  output wire [   0:0] blkdone_sig$033_val,
  output wire [  31:0] blkdone_sig$034_msg,
  input  wire [   0:0] blkdone_sig$034_rdy,
  output wire [   0:0] blkdone_sig$034_val,
  output wire [  31:0] blkdone_sig$035_msg,
  input  wire [   0:0] blkdone_sig$035_rdy,
  output wire [   0:0] blkdone_sig$035_val,
  output wire [  31:0] blkdone_sig$036_msg,
  input  wire [   0:0] blkdone_sig$036_rdy,
  output wire [   0:0] blkdone_sig$036_val,
  output wire [  31:0] blkdone_sig$037_msg,
  input  wire [   0:0] blkdone_sig$037_rdy,
  output wire [   0:0] blkdone_sig$037_val,
  output wire [  31:0] blkdone_sig$038_msg,
  input  wire [   0:0] blkdone_sig$038_rdy,
  output wire [   0:0] blkdone_sig$038_val,
  output wire [  31:0] blkdone_sig$039_msg,
  input  wire [   0:0] blkdone_sig$039_rdy,
  output wire [   0:0] blkdone_sig$039_val,
  output wire [  31:0] blkdone_sig$003_msg,
  input  wire [   0:0] blkdone_sig$003_rdy,
  output wire [   0:0] blkdone_sig$003_val,
  output wire [  31:0] blkdone_sig$040_msg,
  input  wire [   0:0] blkdone_sig$040_rdy,
  output wire [   0:0] blkdone_sig$040_val,
  output wire [  31:0] blkdone_sig$041_msg,
  input  wire [   0:0] blkdone_sig$041_rdy,
  output wire [   0:0] blkdone_sig$041_val,
  output wire [  31:0] blkdone_sig$042_msg,
  input  wire [   0:0] blkdone_sig$042_rdy,
  output wire [   0:0] blkdone_sig$042_val,
  output wire [  31:0] blkdone_sig$043_msg,
  input  wire [   0:0] blkdone_sig$043_rdy,
  output wire [   0:0] blkdone_sig$043_val,
  output wire [  31:0] blkdone_sig$044_msg,
  input  wire [   0:0] blkdone_sig$044_rdy,
  output wire [   0:0] blkdone_sig$044_val,
  output wire [  31:0] blkdone_sig$045_msg,
  input  wire [   0:0] blkdone_sig$045_rdy,
  output wire [   0:0] blkdone_sig$045_val,
  output wire [  31:0] blkdone_sig$046_msg,
  input  wire [   0:0] blkdone_sig$046_rdy,
  output wire [   0:0] blkdone_sig$046_val,
  output wire [  31:0] blkdone_sig$047_msg,
  input  wire [   0:0] blkdone_sig$047_rdy,
  output wire [   0:0] blkdone_sig$047_val,
  output wire [  31:0] blkdone_sig$048_msg,
  input  wire [   0:0] blkdone_sig$048_rdy,
  output wire [   0:0] blkdone_sig$048_val,
  output wire [  31:0] blkdone_sig$049_msg,
  input  wire [   0:0] blkdone_sig$049_rdy,
  output wire [   0:0] blkdone_sig$049_val,
  output wire [  31:0] blkdone_sig$004_msg,
  input  wire [   0:0] blkdone_sig$004_rdy,
  output wire [   0:0] blkdone_sig$004_val,
  output wire [  31:0] blkdone_sig$050_msg,
  input  wire [   0:0] blkdone_sig$050_rdy,
  output wire [   0:0] blkdone_sig$050_val,
  output wire [  31:0] blkdone_sig$051_msg,
  input  wire [   0:0] blkdone_sig$051_rdy,
  output wire [   0:0] blkdone_sig$051_val,
  output wire [  31:0] blkdone_sig$052_msg,
  input  wire [   0:0] blkdone_sig$052_rdy,
  output wire [   0:0] blkdone_sig$052_val,
  output wire [  31:0] blkdone_sig$053_msg,
  input  wire [   0:0] blkdone_sig$053_rdy,
  output wire [   0:0] blkdone_sig$053_val,
  output wire [  31:0] blkdone_sig$054_msg,
  input  wire [   0:0] blkdone_sig$054_rdy,
  output wire [   0:0] blkdone_sig$054_val,
  output wire [  31:0] blkdone_sig$055_msg,
  input  wire [   0:0] blkdone_sig$055_rdy,
  output wire [   0:0] blkdone_sig$055_val,
  output wire [  31:0] blkdone_sig$056_msg,
  input  wire [   0:0] blkdone_sig$056_rdy,
  output wire [   0:0] blkdone_sig$056_val,
  output wire [  31:0] blkdone_sig$057_msg,
  input  wire [   0:0] blkdone_sig$057_rdy,
  output wire [   0:0] blkdone_sig$057_val,
  output wire [  31:0] blkdone_sig$058_msg,
  input  wire [   0:0] blkdone_sig$058_rdy,
  output wire [   0:0] blkdone_sig$058_val,
  output wire [  31:0] blkdone_sig$059_msg,
  input  wire [   0:0] blkdone_sig$059_rdy,
  output wire [   0:0] blkdone_sig$059_val,
  output wire [  31:0] blkdone_sig$005_msg,
  input  wire [   0:0] blkdone_sig$005_rdy,
  output wire [   0:0] blkdone_sig$005_val,
  output wire [  31:0] blkdone_sig$060_msg,
  input  wire [   0:0] blkdone_sig$060_rdy,
  output wire [   0:0] blkdone_sig$060_val,
  output wire [  31:0] blkdone_sig$061_msg,
  input  wire [   0:0] blkdone_sig$061_rdy,
  output wire [   0:0] blkdone_sig$061_val,
  output wire [  31:0] blkdone_sig$062_msg,
  input  wire [   0:0] blkdone_sig$062_rdy,
  output wire [   0:0] blkdone_sig$062_val,
  output wire [  31:0] blkdone_sig$063_msg,
  input  wire [   0:0] blkdone_sig$063_rdy,
  output wire [   0:0] blkdone_sig$063_val,
  output wire [  31:0] blkdone_sig$006_msg,
  input  wire [   0:0] blkdone_sig$006_rdy,
  output wire [   0:0] blkdone_sig$006_val,
  output wire [  31:0] blkdone_sig$007_msg,
  input  wire [   0:0] blkdone_sig$007_rdy,
  output wire [   0:0] blkdone_sig$007_val,
  output wire [  31:0] blkdone_sig$008_msg,
  input  wire [   0:0] blkdone_sig$008_rdy,
  output wire [   0:0] blkdone_sig$008_val,
  output wire [  31:0] blkdone_sig$009_msg,
  input  wire [   0:0] blkdone_sig$009_rdy,
  output wire [   0:0] blkdone_sig$009_val,
  input  wire [   0:0] clk,
  input  wire [   0:0] cm_msg,
  output reg  [   0:0] cm_rdy,
  input  wire [   0:0] cm_val,
  input  wire [  63:0] pe_id$000_msg,
  output wire [   0:0] pe_id$000_rdy,
  input  wire [   0:0] pe_id$000_val,
  input  wire [  63:0] pe_id$010_msg,
  output wire [   0:0] pe_id$010_rdy,
  input  wire [   0:0] pe_id$010_val,
  input  wire [  63:0] pe_id$011_msg,
  output wire [   0:0] pe_id$011_rdy,
  input  wire [   0:0] pe_id$011_val,
  input  wire [  63:0] pe_id$012_msg,
  output wire [   0:0] pe_id$012_rdy,
  input  wire [   0:0] pe_id$012_val,
  input  wire [  63:0] pe_id$013_msg,
  output wire [   0:0] pe_id$013_rdy,
  input  wire [   0:0] pe_id$013_val,
  input  wire [  63:0] pe_id$014_msg,
  output wire [   0:0] pe_id$014_rdy,
  input  wire [   0:0] pe_id$014_val,
  input  wire [  63:0] pe_id$015_msg,
  output wire [   0:0] pe_id$015_rdy,
  input  wire [   0:0] pe_id$015_val,
  input  wire [  63:0] pe_id$016_msg,
  output wire [   0:0] pe_id$016_rdy,
  input  wire [   0:0] pe_id$016_val,
  input  wire [  63:0] pe_id$017_msg,
  output wire [   0:0] pe_id$017_rdy,
  input  wire [   0:0] pe_id$017_val,
  input  wire [  63:0] pe_id$018_msg,
  output wire [   0:0] pe_id$018_rdy,
  input  wire [   0:0] pe_id$018_val,
  input  wire [  63:0] pe_id$019_msg,
  output wire [   0:0] pe_id$019_rdy,
  input  wire [   0:0] pe_id$019_val,
  input  wire [  63:0] pe_id$001_msg,
  output wire [   0:0] pe_id$001_rdy,
  input  wire [   0:0] pe_id$001_val,
  input  wire [  63:0] pe_id$020_msg,
  output wire [   0:0] pe_id$020_rdy,
  input  wire [   0:0] pe_id$020_val,
  input  wire [  63:0] pe_id$021_msg,
  output wire [   0:0] pe_id$021_rdy,
  input  wire [   0:0] pe_id$021_val,
  input  wire [  63:0] pe_id$022_msg,
  output wire [   0:0] pe_id$022_rdy,
  input  wire [   0:0] pe_id$022_val,
  input  wire [  63:0] pe_id$023_msg,
  output wire [   0:0] pe_id$023_rdy,
  input  wire [   0:0] pe_id$023_val,
  input  wire [  63:0] pe_id$024_msg,
  output wire [   0:0] pe_id$024_rdy,
  input  wire [   0:0] pe_id$024_val,
  input  wire [  63:0] pe_id$025_msg,
  output wire [   0:0] pe_id$025_rdy,
  input  wire [   0:0] pe_id$025_val,
  input  wire [  63:0] pe_id$026_msg,
  output wire [   0:0] pe_id$026_rdy,
  input  wire [   0:0] pe_id$026_val,
  input  wire [  63:0] pe_id$027_msg,
  output wire [   0:0] pe_id$027_rdy,
  input  wire [   0:0] pe_id$027_val,
  input  wire [  63:0] pe_id$028_msg,
  output wire [   0:0] pe_id$028_rdy,
  input  wire [   0:0] pe_id$028_val,
  input  wire [  63:0] pe_id$029_msg,
  output wire [   0:0] pe_id$029_rdy,
  input  wire [   0:0] pe_id$029_val,
  input  wire [  63:0] pe_id$002_msg,
  output wire [   0:0] pe_id$002_rdy,
  input  wire [   0:0] pe_id$002_val,
  input  wire [  63:0] pe_id$030_msg,
  output wire [   0:0] pe_id$030_rdy,
  input  wire [   0:0] pe_id$030_val,
  input  wire [  63:0] pe_id$031_msg,
  output wire [   0:0] pe_id$031_rdy,
  input  wire [   0:0] pe_id$031_val,
  input  wire [  63:0] pe_id$032_msg,
  output wire [   0:0] pe_id$032_rdy,
  input  wire [   0:0] pe_id$032_val,
  input  wire [  63:0] pe_id$033_msg,
  output wire [   0:0] pe_id$033_rdy,
  input  wire [   0:0] pe_id$033_val,
  input  wire [  63:0] pe_id$034_msg,
  output wire [   0:0] pe_id$034_rdy,
  input  wire [   0:0] pe_id$034_val,
  input  wire [  63:0] pe_id$035_msg,
  output wire [   0:0] pe_id$035_rdy,
  input  wire [   0:0] pe_id$035_val,
  input  wire [  63:0] pe_id$036_msg,
  output wire [   0:0] pe_id$036_rdy,
  input  wire [   0:0] pe_id$036_val,
  input  wire [  63:0] pe_id$037_msg,
  output wire [   0:0] pe_id$037_rdy,
  input  wire [   0:0] pe_id$037_val,
  input  wire [  63:0] pe_id$038_msg,
  output wire [   0:0] pe_id$038_rdy,
  input  wire [   0:0] pe_id$038_val,
  input  wire [  63:0] pe_id$039_msg,
  output wire [   0:0] pe_id$039_rdy,
  input  wire [   0:0] pe_id$039_val,
  input  wire [  63:0] pe_id$003_msg,
  output wire [   0:0] pe_id$003_rdy,
  input  wire [   0:0] pe_id$003_val,
  input  wire [  63:0] pe_id$040_msg,
  output wire [   0:0] pe_id$040_rdy,
  input  wire [   0:0] pe_id$040_val,
  input  wire [  63:0] pe_id$041_msg,
  output wire [   0:0] pe_id$041_rdy,
  input  wire [   0:0] pe_id$041_val,
  input  wire [  63:0] pe_id$042_msg,
  output wire [   0:0] pe_id$042_rdy,
  input  wire [   0:0] pe_id$042_val,
  input  wire [  63:0] pe_id$043_msg,
  output wire [   0:0] pe_id$043_rdy,
  input  wire [   0:0] pe_id$043_val,
  input  wire [  63:0] pe_id$044_msg,
  output wire [   0:0] pe_id$044_rdy,
  input  wire [   0:0] pe_id$044_val,
  input  wire [  63:0] pe_id$045_msg,
  output wire [   0:0] pe_id$045_rdy,
  input  wire [   0:0] pe_id$045_val,
  input  wire [  63:0] pe_id$046_msg,
  output wire [   0:0] pe_id$046_rdy,
  input  wire [   0:0] pe_id$046_val,
  input  wire [  63:0] pe_id$047_msg,
  output wire [   0:0] pe_id$047_rdy,
  input  wire [   0:0] pe_id$047_val,
  input  wire [  63:0] pe_id$048_msg,
  output wire [   0:0] pe_id$048_rdy,
  input  wire [   0:0] pe_id$048_val,
  input  wire [  63:0] pe_id$049_msg,
  output wire [   0:0] pe_id$049_rdy,
  input  wire [   0:0] pe_id$049_val,
  input  wire [  63:0] pe_id$004_msg,
  output wire [   0:0] pe_id$004_rdy,
  input  wire [   0:0] pe_id$004_val,
  input  wire [  63:0] pe_id$050_msg,
  output wire [   0:0] pe_id$050_rdy,
  input  wire [   0:0] pe_id$050_val,
  input  wire [  63:0] pe_id$051_msg,
  output wire [   0:0] pe_id$051_rdy,
  input  wire [   0:0] pe_id$051_val,
  input  wire [  63:0] pe_id$052_msg,
  output wire [   0:0] pe_id$052_rdy,
  input  wire [   0:0] pe_id$052_val,
  input  wire [  63:0] pe_id$053_msg,
  output wire [   0:0] pe_id$053_rdy,
  input  wire [   0:0] pe_id$053_val,
  input  wire [  63:0] pe_id$054_msg,
  output wire [   0:0] pe_id$054_rdy,
  input  wire [   0:0] pe_id$054_val,
  input  wire [  63:0] pe_id$055_msg,
  output wire [   0:0] pe_id$055_rdy,
  input  wire [   0:0] pe_id$055_val,
  input  wire [  63:0] pe_id$056_msg,
  output wire [   0:0] pe_id$056_rdy,
  input  wire [   0:0] pe_id$056_val,
  input  wire [  63:0] pe_id$057_msg,
  output wire [   0:0] pe_id$057_rdy,
  input  wire [   0:0] pe_id$057_val,
  input  wire [  63:0] pe_id$058_msg,
  output wire [   0:0] pe_id$058_rdy,
  input  wire [   0:0] pe_id$058_val,
  input  wire [  63:0] pe_id$059_msg,
  output wire [   0:0] pe_id$059_rdy,
  input  wire [   0:0] pe_id$059_val,
  input  wire [  63:0] pe_id$005_msg,
  output wire [   0:0] pe_id$005_rdy,
  input  wire [   0:0] pe_id$005_val,
  input  wire [  63:0] pe_id$060_msg,
  output wire [   0:0] pe_id$060_rdy,
  input  wire [   0:0] pe_id$060_val,
  input  wire [  63:0] pe_id$061_msg,
  output wire [   0:0] pe_id$061_rdy,
  input  wire [   0:0] pe_id$061_val,
  input  wire [  63:0] pe_id$062_msg,
  output wire [   0:0] pe_id$062_rdy,
  input  wire [   0:0] pe_id$062_val,
  input  wire [  63:0] pe_id$063_msg,
  output wire [   0:0] pe_id$063_rdy,
  input  wire [   0:0] pe_id$063_val,
  input  wire [  63:0] pe_id$006_msg,
  output wire [   0:0] pe_id$006_rdy,
  input  wire [   0:0] pe_id$006_val,
  input  wire [  63:0] pe_id$007_msg,
  output wire [   0:0] pe_id$007_rdy,
  input  wire [   0:0] pe_id$007_val,
  input  wire [  63:0] pe_id$008_msg,
  output wire [   0:0] pe_id$008_rdy,
  input  wire [   0:0] pe_id$008_val,
  input  wire [  63:0] pe_id$009_msg,
  output wire [   0:0] pe_id$009_rdy,
  input  wire [   0:0] pe_id$009_val,
  input  wire [   0:0] reset,
  output wire [  31:0] xbar_bank_req$000_msg,
  input  wire [   0:0] xbar_bank_req$000_rdy,
  output wire [   0:0] xbar_bank_req$000_val,
  output wire [  31:0] xbar_bank_req$010_msg,
  input  wire [   0:0] xbar_bank_req$010_rdy,
  output wire [   0:0] xbar_bank_req$010_val,
  output wire [  31:0] xbar_bank_req$011_msg,
  input  wire [   0:0] xbar_bank_req$011_rdy,
  output wire [   0:0] xbar_bank_req$011_val,
  output wire [  31:0] xbar_bank_req$012_msg,
  input  wire [   0:0] xbar_bank_req$012_rdy,
  output wire [   0:0] xbar_bank_req$012_val,
  output wire [  31:0] xbar_bank_req$013_msg,
  input  wire [   0:0] xbar_bank_req$013_rdy,
  output wire [   0:0] xbar_bank_req$013_val,
  output wire [  31:0] xbar_bank_req$014_msg,
  input  wire [   0:0] xbar_bank_req$014_rdy,
  output wire [   0:0] xbar_bank_req$014_val,
  output wire [  31:0] xbar_bank_req$015_msg,
  input  wire [   0:0] xbar_bank_req$015_rdy,
  output wire [   0:0] xbar_bank_req$015_val,
  output wire [  31:0] xbar_bank_req$016_msg,
  input  wire [   0:0] xbar_bank_req$016_rdy,
  output wire [   0:0] xbar_bank_req$016_val,
  output wire [  31:0] xbar_bank_req$017_msg,
  input  wire [   0:0] xbar_bank_req$017_rdy,
  output wire [   0:0] xbar_bank_req$017_val,
  output wire [  31:0] xbar_bank_req$018_msg,
  input  wire [   0:0] xbar_bank_req$018_rdy,
  output wire [   0:0] xbar_bank_req$018_val,
  output wire [  31:0] xbar_bank_req$019_msg,
  input  wire [   0:0] xbar_bank_req$019_rdy,
  output wire [   0:0] xbar_bank_req$019_val,
  output wire [  31:0] xbar_bank_req$001_msg,
  input  wire [   0:0] xbar_bank_req$001_rdy,
  output wire [   0:0] xbar_bank_req$001_val,
  output wire [  31:0] xbar_bank_req$020_msg,
  input  wire [   0:0] xbar_bank_req$020_rdy,
  output wire [   0:0] xbar_bank_req$020_val,
  output wire [  31:0] xbar_bank_req$021_msg,
  input  wire [   0:0] xbar_bank_req$021_rdy,
  output wire [   0:0] xbar_bank_req$021_val,
  output wire [  31:0] xbar_bank_req$022_msg,
  input  wire [   0:0] xbar_bank_req$022_rdy,
  output wire [   0:0] xbar_bank_req$022_val,
  output wire [  31:0] xbar_bank_req$023_msg,
  input  wire [   0:0] xbar_bank_req$023_rdy,
  output wire [   0:0] xbar_bank_req$023_val,
  output wire [  31:0] xbar_bank_req$024_msg,
  input  wire [   0:0] xbar_bank_req$024_rdy,
  output wire [   0:0] xbar_bank_req$024_val,
  output wire [  31:0] xbar_bank_req$025_msg,
  input  wire [   0:0] xbar_bank_req$025_rdy,
  output wire [   0:0] xbar_bank_req$025_val,
  output wire [  31:0] xbar_bank_req$026_msg,
  input  wire [   0:0] xbar_bank_req$026_rdy,
  output wire [   0:0] xbar_bank_req$026_val,
  output wire [  31:0] xbar_bank_req$027_msg,
  input  wire [   0:0] xbar_bank_req$027_rdy,
  output wire [   0:0] xbar_bank_req$027_val,
  output wire [  31:0] xbar_bank_req$028_msg,
  input  wire [   0:0] xbar_bank_req$028_rdy,
  output wire [   0:0] xbar_bank_req$028_val,
  output wire [  31:0] xbar_bank_req$029_msg,
  input  wire [   0:0] xbar_bank_req$029_rdy,
  output wire [   0:0] xbar_bank_req$029_val,
  output wire [  31:0] xbar_bank_req$002_msg,
  input  wire [   0:0] xbar_bank_req$002_rdy,
  output wire [   0:0] xbar_bank_req$002_val,
  output wire [  31:0] xbar_bank_req$030_msg,
  input  wire [   0:0] xbar_bank_req$030_rdy,
  output wire [   0:0] xbar_bank_req$030_val,
  output wire [  31:0] xbar_bank_req$031_msg,
  input  wire [   0:0] xbar_bank_req$031_rdy,
  output wire [   0:0] xbar_bank_req$031_val,
  output wire [  31:0] xbar_bank_req$032_msg,
  input  wire [   0:0] xbar_bank_req$032_rdy,
  output wire [   0:0] xbar_bank_req$032_val,
  output wire [  31:0] xbar_bank_req$033_msg,
  input  wire [   0:0] xbar_bank_req$033_rdy,
  output wire [   0:0] xbar_bank_req$033_val,
  output wire [  31:0] xbar_bank_req$034_msg,
  input  wire [   0:0] xbar_bank_req$034_rdy,
  output wire [   0:0] xbar_bank_req$034_val,
  output wire [  31:0] xbar_bank_req$035_msg,
  input  wire [   0:0] xbar_bank_req$035_rdy,
  output wire [   0:0] xbar_bank_req$035_val,
  output wire [  31:0] xbar_bank_req$036_msg,
  input  wire [   0:0] xbar_bank_req$036_rdy,
  output wire [   0:0] xbar_bank_req$036_val,
  output wire [  31:0] xbar_bank_req$037_msg,
  input  wire [   0:0] xbar_bank_req$037_rdy,
  output wire [   0:0] xbar_bank_req$037_val,
  output wire [  31:0] xbar_bank_req$038_msg,
  input  wire [   0:0] xbar_bank_req$038_rdy,
  output wire [   0:0] xbar_bank_req$038_val,
  output wire [  31:0] xbar_bank_req$039_msg,
  input  wire [   0:0] xbar_bank_req$039_rdy,
  output wire [   0:0] xbar_bank_req$039_val,
  output wire [  31:0] xbar_bank_req$003_msg,
  input  wire [   0:0] xbar_bank_req$003_rdy,
  output wire [   0:0] xbar_bank_req$003_val,
  output wire [  31:0] xbar_bank_req$040_msg,
  input  wire [   0:0] xbar_bank_req$040_rdy,
  output wire [   0:0] xbar_bank_req$040_val,
  output wire [  31:0] xbar_bank_req$041_msg,
  input  wire [   0:0] xbar_bank_req$041_rdy,
  output wire [   0:0] xbar_bank_req$041_val,
  output wire [  31:0] xbar_bank_req$042_msg,
  input  wire [   0:0] xbar_bank_req$042_rdy,
  output wire [   0:0] xbar_bank_req$042_val,
  output wire [  31:0] xbar_bank_req$043_msg,
  input  wire [   0:0] xbar_bank_req$043_rdy,
  output wire [   0:0] xbar_bank_req$043_val,
  output wire [  31:0] xbar_bank_req$044_msg,
  input  wire [   0:0] xbar_bank_req$044_rdy,
  output wire [   0:0] xbar_bank_req$044_val,
  output wire [  31:0] xbar_bank_req$045_msg,
  input  wire [   0:0] xbar_bank_req$045_rdy,
  output wire [   0:0] xbar_bank_req$045_val,
  output wire [  31:0] xbar_bank_req$046_msg,
  input  wire [   0:0] xbar_bank_req$046_rdy,
  output wire [   0:0] xbar_bank_req$046_val,
  output wire [  31:0] xbar_bank_req$047_msg,
  input  wire [   0:0] xbar_bank_req$047_rdy,
  output wire [   0:0] xbar_bank_req$047_val,
  output wire [  31:0] xbar_bank_req$048_msg,
  input  wire [   0:0] xbar_bank_req$048_rdy,
  output wire [   0:0] xbar_bank_req$048_val,
  output wire [  31:0] xbar_bank_req$049_msg,
  input  wire [   0:0] xbar_bank_req$049_rdy,
  output wire [   0:0] xbar_bank_req$049_val,
  output wire [  31:0] xbar_bank_req$004_msg,
  input  wire [   0:0] xbar_bank_req$004_rdy,
  output wire [   0:0] xbar_bank_req$004_val,
  output wire [  31:0] xbar_bank_req$050_msg,
  input  wire [   0:0] xbar_bank_req$050_rdy,
  output wire [   0:0] xbar_bank_req$050_val,
  output wire [  31:0] xbar_bank_req$051_msg,
  input  wire [   0:0] xbar_bank_req$051_rdy,
  output wire [   0:0] xbar_bank_req$051_val,
  output wire [  31:0] xbar_bank_req$052_msg,
  input  wire [   0:0] xbar_bank_req$052_rdy,
  output wire [   0:0] xbar_bank_req$052_val,
  output wire [  31:0] xbar_bank_req$053_msg,
  input  wire [   0:0] xbar_bank_req$053_rdy,
  output wire [   0:0] xbar_bank_req$053_val,
  output wire [  31:0] xbar_bank_req$054_msg,
  input  wire [   0:0] xbar_bank_req$054_rdy,
  output wire [   0:0] xbar_bank_req$054_val,
  output wire [  31:0] xbar_bank_req$055_msg,
  input  wire [   0:0] xbar_bank_req$055_rdy,
  output wire [   0:0] xbar_bank_req$055_val,
  output wire [  31:0] xbar_bank_req$056_msg,
  input  wire [   0:0] xbar_bank_req$056_rdy,
  output wire [   0:0] xbar_bank_req$056_val,
  output wire [  31:0] xbar_bank_req$057_msg,
  input  wire [   0:0] xbar_bank_req$057_rdy,
  output wire [   0:0] xbar_bank_req$057_val,
  output wire [  31:0] xbar_bank_req$058_msg,
  input  wire [   0:0] xbar_bank_req$058_rdy,
  output wire [   0:0] xbar_bank_req$058_val,
  output wire [  31:0] xbar_bank_req$059_msg,
  input  wire [   0:0] xbar_bank_req$059_rdy,
  output wire [   0:0] xbar_bank_req$059_val,
  output wire [  31:0] xbar_bank_req$005_msg,
  input  wire [   0:0] xbar_bank_req$005_rdy,
  output wire [   0:0] xbar_bank_req$005_val,
  output wire [  31:0] xbar_bank_req$060_msg,
  input  wire [   0:0] xbar_bank_req$060_rdy,
  output wire [   0:0] xbar_bank_req$060_val,
  output wire [  31:0] xbar_bank_req$061_msg,
  input  wire [   0:0] xbar_bank_req$061_rdy,
  output wire [   0:0] xbar_bank_req$061_val,
  output wire [  31:0] xbar_bank_req$062_msg,
  input  wire [   0:0] xbar_bank_req$062_rdy,
  output wire [   0:0] xbar_bank_req$062_val,
  output wire [  31:0] xbar_bank_req$063_msg,
  input  wire [   0:0] xbar_bank_req$063_rdy,
  output wire [   0:0] xbar_bank_req$063_val,
  output wire [  31:0] xbar_bank_req$006_msg,
  input  wire [   0:0] xbar_bank_req$006_rdy,
  output wire [   0:0] xbar_bank_req$006_val,
  output wire [  31:0] xbar_bank_req$007_msg,
  input  wire [   0:0] xbar_bank_req$007_rdy,
  output wire [   0:0] xbar_bank_req$007_val,
  output wire [  31:0] xbar_bank_req$008_msg,
  input  wire [   0:0] xbar_bank_req$008_rdy,
  output wire [   0:0] xbar_bank_req$008_val,
  output wire [  31:0] xbar_bank_req$009_msg,
  input  wire [   0:0] xbar_bank_req$009_rdy,
  output wire [   0:0] xbar_bank_req$009_val,
  input  wire [  63:0] xbar_bank_resp$000_msg,
  output wire [   0:0] xbar_bank_resp$000_rdy,
  input  wire [   0:0] xbar_bank_resp$000_val,
  input  wire [  63:0] xbar_bank_resp$010_msg,
  output wire [   0:0] xbar_bank_resp$010_rdy,
  input  wire [   0:0] xbar_bank_resp$010_val,
  input  wire [  63:0] xbar_bank_resp$011_msg,
  output wire [   0:0] xbar_bank_resp$011_rdy,
  input  wire [   0:0] xbar_bank_resp$011_val,
  input  wire [  63:0] xbar_bank_resp$012_msg,
  output wire [   0:0] xbar_bank_resp$012_rdy,
  input  wire [   0:0] xbar_bank_resp$012_val,
  input  wire [  63:0] xbar_bank_resp$013_msg,
  output wire [   0:0] xbar_bank_resp$013_rdy,
  input  wire [   0:0] xbar_bank_resp$013_val,
  input  wire [  63:0] xbar_bank_resp$014_msg,
  output wire [   0:0] xbar_bank_resp$014_rdy,
  input  wire [   0:0] xbar_bank_resp$014_val,
  input  wire [  63:0] xbar_bank_resp$015_msg,
  output wire [   0:0] xbar_bank_resp$015_rdy,
  input  wire [   0:0] xbar_bank_resp$015_val,
  input  wire [  63:0] xbar_bank_resp$016_msg,
  output wire [   0:0] xbar_bank_resp$016_rdy,
  input  wire [   0:0] xbar_bank_resp$016_val,
  input  wire [  63:0] xbar_bank_resp$017_msg,
  output wire [   0:0] xbar_bank_resp$017_rdy,
  input  wire [   0:0] xbar_bank_resp$017_val,
  input  wire [  63:0] xbar_bank_resp$018_msg,
  output wire [   0:0] xbar_bank_resp$018_rdy,
  input  wire [   0:0] xbar_bank_resp$018_val,
  input  wire [  63:0] xbar_bank_resp$019_msg,
  output wire [   0:0] xbar_bank_resp$019_rdy,
  input  wire [   0:0] xbar_bank_resp$019_val,
  input  wire [  63:0] xbar_bank_resp$001_msg,
  output wire [   0:0] xbar_bank_resp$001_rdy,
  input  wire [   0:0] xbar_bank_resp$001_val,
  input  wire [  63:0] xbar_bank_resp$020_msg,
  output wire [   0:0] xbar_bank_resp$020_rdy,
  input  wire [   0:0] xbar_bank_resp$020_val,
  input  wire [  63:0] xbar_bank_resp$021_msg,
  output wire [   0:0] xbar_bank_resp$021_rdy,
  input  wire [   0:0] xbar_bank_resp$021_val,
  input  wire [  63:0] xbar_bank_resp$022_msg,
  output wire [   0:0] xbar_bank_resp$022_rdy,
  input  wire [   0:0] xbar_bank_resp$022_val,
  input  wire [  63:0] xbar_bank_resp$023_msg,
  output wire [   0:0] xbar_bank_resp$023_rdy,
  input  wire [   0:0] xbar_bank_resp$023_val,
  input  wire [  63:0] xbar_bank_resp$024_msg,
  output wire [   0:0] xbar_bank_resp$024_rdy,
  input  wire [   0:0] xbar_bank_resp$024_val,
  input  wire [  63:0] xbar_bank_resp$025_msg,
  output wire [   0:0] xbar_bank_resp$025_rdy,
  input  wire [   0:0] xbar_bank_resp$025_val,
  input  wire [  63:0] xbar_bank_resp$026_msg,
  output wire [   0:0] xbar_bank_resp$026_rdy,
  input  wire [   0:0] xbar_bank_resp$026_val,
  input  wire [  63:0] xbar_bank_resp$027_msg,
  output wire [   0:0] xbar_bank_resp$027_rdy,
  input  wire [   0:0] xbar_bank_resp$027_val,
  input  wire [  63:0] xbar_bank_resp$028_msg,
  output wire [   0:0] xbar_bank_resp$028_rdy,
  input  wire [   0:0] xbar_bank_resp$028_val,
  input  wire [  63:0] xbar_bank_resp$029_msg,
  output wire [   0:0] xbar_bank_resp$029_rdy,
  input  wire [   0:0] xbar_bank_resp$029_val,
  input  wire [  63:0] xbar_bank_resp$002_msg,
  output wire [   0:0] xbar_bank_resp$002_rdy,
  input  wire [   0:0] xbar_bank_resp$002_val,
  input  wire [  63:0] xbar_bank_resp$030_msg,
  output wire [   0:0] xbar_bank_resp$030_rdy,
  input  wire [   0:0] xbar_bank_resp$030_val,
  input  wire [  63:0] xbar_bank_resp$031_msg,
  output wire [   0:0] xbar_bank_resp$031_rdy,
  input  wire [   0:0] xbar_bank_resp$031_val,
  input  wire [  63:0] xbar_bank_resp$032_msg,
  output wire [   0:0] xbar_bank_resp$032_rdy,
  input  wire [   0:0] xbar_bank_resp$032_val,
  input  wire [  63:0] xbar_bank_resp$033_msg,
  output wire [   0:0] xbar_bank_resp$033_rdy,
  input  wire [   0:0] xbar_bank_resp$033_val,
  input  wire [  63:0] xbar_bank_resp$034_msg,
  output wire [   0:0] xbar_bank_resp$034_rdy,
  input  wire [   0:0] xbar_bank_resp$034_val,
  input  wire [  63:0] xbar_bank_resp$035_msg,
  output wire [   0:0] xbar_bank_resp$035_rdy,
  input  wire [   0:0] xbar_bank_resp$035_val,
  input  wire [  63:0] xbar_bank_resp$036_msg,
  output wire [   0:0] xbar_bank_resp$036_rdy,
  input  wire [   0:0] xbar_bank_resp$036_val,
  input  wire [  63:0] xbar_bank_resp$037_msg,
  output wire [   0:0] xbar_bank_resp$037_rdy,
  input  wire [   0:0] xbar_bank_resp$037_val,
  input  wire [  63:0] xbar_bank_resp$038_msg,
  output wire [   0:0] xbar_bank_resp$038_rdy,
  input  wire [   0:0] xbar_bank_resp$038_val,
  input  wire [  63:0] xbar_bank_resp$039_msg,
  output wire [   0:0] xbar_bank_resp$039_rdy,
  input  wire [   0:0] xbar_bank_resp$039_val,
  input  wire [  63:0] xbar_bank_resp$003_msg,
  output wire [   0:0] xbar_bank_resp$003_rdy,
  input  wire [   0:0] xbar_bank_resp$003_val,
  input  wire [  63:0] xbar_bank_resp$040_msg,
  output wire [   0:0] xbar_bank_resp$040_rdy,
  input  wire [   0:0] xbar_bank_resp$040_val,
  input  wire [  63:0] xbar_bank_resp$041_msg,
  output wire [   0:0] xbar_bank_resp$041_rdy,
  input  wire [   0:0] xbar_bank_resp$041_val,
  input  wire [  63:0] xbar_bank_resp$042_msg,
  output wire [   0:0] xbar_bank_resp$042_rdy,
  input  wire [   0:0] xbar_bank_resp$042_val,
  input  wire [  63:0] xbar_bank_resp$043_msg,
  output wire [   0:0] xbar_bank_resp$043_rdy,
  input  wire [   0:0] xbar_bank_resp$043_val,
  input  wire [  63:0] xbar_bank_resp$044_msg,
  output wire [   0:0] xbar_bank_resp$044_rdy,
  input  wire [   0:0] xbar_bank_resp$044_val,
  input  wire [  63:0] xbar_bank_resp$045_msg,
  output wire [   0:0] xbar_bank_resp$045_rdy,
  input  wire [   0:0] xbar_bank_resp$045_val,
  input  wire [  63:0] xbar_bank_resp$046_msg,
  output wire [   0:0] xbar_bank_resp$046_rdy,
  input  wire [   0:0] xbar_bank_resp$046_val,
  input  wire [  63:0] xbar_bank_resp$047_msg,
  output wire [   0:0] xbar_bank_resp$047_rdy,
  input  wire [   0:0] xbar_bank_resp$047_val,
  input  wire [  63:0] xbar_bank_resp$048_msg,
  output wire [   0:0] xbar_bank_resp$048_rdy,
  input  wire [   0:0] xbar_bank_resp$048_val,
  input  wire [  63:0] xbar_bank_resp$049_msg,
  output wire [   0:0] xbar_bank_resp$049_rdy,
  input  wire [   0:0] xbar_bank_resp$049_val,
  input  wire [  63:0] xbar_bank_resp$004_msg,
  output wire [   0:0] xbar_bank_resp$004_rdy,
  input  wire [   0:0] xbar_bank_resp$004_val,
  input  wire [  63:0] xbar_bank_resp$050_msg,
  output wire [   0:0] xbar_bank_resp$050_rdy,
  input  wire [   0:0] xbar_bank_resp$050_val,
  input  wire [  63:0] xbar_bank_resp$051_msg,
  output wire [   0:0] xbar_bank_resp$051_rdy,
  input  wire [   0:0] xbar_bank_resp$051_val,
  input  wire [  63:0] xbar_bank_resp$052_msg,
  output wire [   0:0] xbar_bank_resp$052_rdy,
  input  wire [   0:0] xbar_bank_resp$052_val,
  input  wire [  63:0] xbar_bank_resp$053_msg,
  output wire [   0:0] xbar_bank_resp$053_rdy,
  input  wire [   0:0] xbar_bank_resp$053_val,
  input  wire [  63:0] xbar_bank_resp$054_msg,
  output wire [   0:0] xbar_bank_resp$054_rdy,
  input  wire [   0:0] xbar_bank_resp$054_val,
  input  wire [  63:0] xbar_bank_resp$055_msg,
  output wire [   0:0] xbar_bank_resp$055_rdy,
  input  wire [   0:0] xbar_bank_resp$055_val,
  input  wire [  63:0] xbar_bank_resp$056_msg,
  output wire [   0:0] xbar_bank_resp$056_rdy,
  input  wire [   0:0] xbar_bank_resp$056_val,
  input  wire [  63:0] xbar_bank_resp$057_msg,
  output wire [   0:0] xbar_bank_resp$057_rdy,
  input  wire [   0:0] xbar_bank_resp$057_val,
  input  wire [  63:0] xbar_bank_resp$058_msg,
  output wire [   0:0] xbar_bank_resp$058_rdy,
  input  wire [   0:0] xbar_bank_resp$058_val,
  input  wire [  63:0] xbar_bank_resp$059_msg,
  output wire [   0:0] xbar_bank_resp$059_rdy,
  input  wire [   0:0] xbar_bank_resp$059_val,
  input  wire [  63:0] xbar_bank_resp$005_msg,
  output wire [   0:0] xbar_bank_resp$005_rdy,
  input  wire [   0:0] xbar_bank_resp$005_val,
  input  wire [  63:0] xbar_bank_resp$060_msg,
  output wire [   0:0] xbar_bank_resp$060_rdy,
  input  wire [   0:0] xbar_bank_resp$060_val,
  input  wire [  63:0] xbar_bank_resp$061_msg,
  output wire [   0:0] xbar_bank_resp$061_rdy,
  input  wire [   0:0] xbar_bank_resp$061_val,
  input  wire [  63:0] xbar_bank_resp$062_msg,
  output wire [   0:0] xbar_bank_resp$062_rdy,
  input  wire [   0:0] xbar_bank_resp$062_val,
  input  wire [  63:0] xbar_bank_resp$063_msg,
  output wire [   0:0] xbar_bank_resp$063_rdy,
  input  wire [   0:0] xbar_bank_resp$063_val,
  input  wire [  63:0] xbar_bank_resp$006_msg,
  output wire [   0:0] xbar_bank_resp$006_rdy,
  input  wire [   0:0] xbar_bank_resp$006_val,
  input  wire [  63:0] xbar_bank_resp$007_msg,
  output wire [   0:0] xbar_bank_resp$007_rdy,
  input  wire [   0:0] xbar_bank_resp$007_val,
  input  wire [  63:0] xbar_bank_resp$008_msg,
  output wire [   0:0] xbar_bank_resp$008_rdy,
  input  wire [   0:0] xbar_bank_resp$008_val,
  input  wire [  63:0] xbar_bank_resp$009_msg,
  output wire [   0:0] xbar_bank_resp$009_rdy,
  input  wire [   0:0] xbar_bank_resp$009_val,
  output wire [ 127:0] y_unloader$000_msg,
  input  wire [   0:0] y_unloader$000_rdy,
  output wire [   0:0] y_unloader$000_val,
  output wire [ 127:0] y_unloader$010_msg,
  input  wire [   0:0] y_unloader$010_rdy,
  output wire [   0:0] y_unloader$010_val,
  output wire [ 127:0] y_unloader$011_msg,
  input  wire [   0:0] y_unloader$011_rdy,
  output wire [   0:0] y_unloader$011_val,
  output wire [ 127:0] y_unloader$012_msg,
  input  wire [   0:0] y_unloader$012_rdy,
  output wire [   0:0] y_unloader$012_val,
  output wire [ 127:0] y_unloader$013_msg,
  input  wire [   0:0] y_unloader$013_rdy,
  output wire [   0:0] y_unloader$013_val,
  output wire [ 127:0] y_unloader$014_msg,
  input  wire [   0:0] y_unloader$014_rdy,
  output wire [   0:0] y_unloader$014_val,
  output wire [ 127:0] y_unloader$015_msg,
  input  wire [   0:0] y_unloader$015_rdy,
  output wire [   0:0] y_unloader$015_val,
  output wire [ 127:0] y_unloader$016_msg,
  input  wire [   0:0] y_unloader$016_rdy,
  output wire [   0:0] y_unloader$016_val,
  output wire [ 127:0] y_unloader$017_msg,
  input  wire [   0:0] y_unloader$017_rdy,
  output wire [   0:0] y_unloader$017_val,
  output wire [ 127:0] y_unloader$018_msg,
  input  wire [   0:0] y_unloader$018_rdy,
  output wire [   0:0] y_unloader$018_val,
  output wire [ 127:0] y_unloader$019_msg,
  input  wire [   0:0] y_unloader$019_rdy,
  output wire [   0:0] y_unloader$019_val,
  output wire [ 127:0] y_unloader$001_msg,
  input  wire [   0:0] y_unloader$001_rdy,
  output wire [   0:0] y_unloader$001_val,
  output wire [ 127:0] y_unloader$020_msg,
  input  wire [   0:0] y_unloader$020_rdy,
  output wire [   0:0] y_unloader$020_val,
  output wire [ 127:0] y_unloader$021_msg,
  input  wire [   0:0] y_unloader$021_rdy,
  output wire [   0:0] y_unloader$021_val,
  output wire [ 127:0] y_unloader$022_msg,
  input  wire [   0:0] y_unloader$022_rdy,
  output wire [   0:0] y_unloader$022_val,
  output wire [ 127:0] y_unloader$023_msg,
  input  wire [   0:0] y_unloader$023_rdy,
  output wire [   0:0] y_unloader$023_val,
  output wire [ 127:0] y_unloader$024_msg,
  input  wire [   0:0] y_unloader$024_rdy,
  output wire [   0:0] y_unloader$024_val,
  output wire [ 127:0] y_unloader$025_msg,
  input  wire [   0:0] y_unloader$025_rdy,
  output wire [   0:0] y_unloader$025_val,
  output wire [ 127:0] y_unloader$026_msg,
  input  wire [   0:0] y_unloader$026_rdy,
  output wire [   0:0] y_unloader$026_val,
  output wire [ 127:0] y_unloader$027_msg,
  input  wire [   0:0] y_unloader$027_rdy,
  output wire [   0:0] y_unloader$027_val,
  output wire [ 127:0] y_unloader$028_msg,
  input  wire [   0:0] y_unloader$028_rdy,
  output wire [   0:0] y_unloader$028_val,
  output wire [ 127:0] y_unloader$029_msg,
  input  wire [   0:0] y_unloader$029_rdy,
  output wire [   0:0] y_unloader$029_val,
  output wire [ 127:0] y_unloader$002_msg,
  input  wire [   0:0] y_unloader$002_rdy,
  output wire [   0:0] y_unloader$002_val,
  output wire [ 127:0] y_unloader$030_msg,
  input  wire [   0:0] y_unloader$030_rdy,
  output wire [   0:0] y_unloader$030_val,
  output wire [ 127:0] y_unloader$031_msg,
  input  wire [   0:0] y_unloader$031_rdy,
  output wire [   0:0] y_unloader$031_val,
  output wire [ 127:0] y_unloader$032_msg,
  input  wire [   0:0] y_unloader$032_rdy,
  output wire [   0:0] y_unloader$032_val,
  output wire [ 127:0] y_unloader$033_msg,
  input  wire [   0:0] y_unloader$033_rdy,
  output wire [   0:0] y_unloader$033_val,
  output wire [ 127:0] y_unloader$034_msg,
  input  wire [   0:0] y_unloader$034_rdy,
  output wire [   0:0] y_unloader$034_val,
  output wire [ 127:0] y_unloader$035_msg,
  input  wire [   0:0] y_unloader$035_rdy,
  output wire [   0:0] y_unloader$035_val,
  output wire [ 127:0] y_unloader$036_msg,
  input  wire [   0:0] y_unloader$036_rdy,
  output wire [   0:0] y_unloader$036_val,
  output wire [ 127:0] y_unloader$037_msg,
  input  wire [   0:0] y_unloader$037_rdy,
  output wire [   0:0] y_unloader$037_val,
  output wire [ 127:0] y_unloader$038_msg,
  input  wire [   0:0] y_unloader$038_rdy,
  output wire [   0:0] y_unloader$038_val,
  output wire [ 127:0] y_unloader$039_msg,
  input  wire [   0:0] y_unloader$039_rdy,
  output wire [   0:0] y_unloader$039_val,
  output wire [ 127:0] y_unloader$003_msg,
  input  wire [   0:0] y_unloader$003_rdy,
  output wire [   0:0] y_unloader$003_val,
  output wire [ 127:0] y_unloader$040_msg,
  input  wire [   0:0] y_unloader$040_rdy,
  output wire [   0:0] y_unloader$040_val,
  output wire [ 127:0] y_unloader$041_msg,
  input  wire [   0:0] y_unloader$041_rdy,
  output wire [   0:0] y_unloader$041_val,
  output wire [ 127:0] y_unloader$042_msg,
  input  wire [   0:0] y_unloader$042_rdy,
  output wire [   0:0] y_unloader$042_val,
  output wire [ 127:0] y_unloader$043_msg,
  input  wire [   0:0] y_unloader$043_rdy,
  output wire [   0:0] y_unloader$043_val,
  output wire [ 127:0] y_unloader$044_msg,
  input  wire [   0:0] y_unloader$044_rdy,
  output wire [   0:0] y_unloader$044_val,
  output wire [ 127:0] y_unloader$045_msg,
  input  wire [   0:0] y_unloader$045_rdy,
  output wire [   0:0] y_unloader$045_val,
  output wire [ 127:0] y_unloader$046_msg,
  input  wire [   0:0] y_unloader$046_rdy,
  output wire [   0:0] y_unloader$046_val,
  output wire [ 127:0] y_unloader$047_msg,
  input  wire [   0:0] y_unloader$047_rdy,
  output wire [   0:0] y_unloader$047_val,
  output wire [ 127:0] y_unloader$048_msg,
  input  wire [   0:0] y_unloader$048_rdy,
  output wire [   0:0] y_unloader$048_val,
  output wire [ 127:0] y_unloader$049_msg,
  input  wire [   0:0] y_unloader$049_rdy,
  output wire [   0:0] y_unloader$049_val,
  output wire [ 127:0] y_unloader$004_msg,
  input  wire [   0:0] y_unloader$004_rdy,
  output wire [   0:0] y_unloader$004_val,
  output wire [ 127:0] y_unloader$050_msg,
  input  wire [   0:0] y_unloader$050_rdy,
  output wire [   0:0] y_unloader$050_val,
  output wire [ 127:0] y_unloader$051_msg,
  input  wire [   0:0] y_unloader$051_rdy,
  output wire [   0:0] y_unloader$051_val,
  output wire [ 127:0] y_unloader$052_msg,
  input  wire [   0:0] y_unloader$052_rdy,
  output wire [   0:0] y_unloader$052_val,
  output wire [ 127:0] y_unloader$053_msg,
  input  wire [   0:0] y_unloader$053_rdy,
  output wire [   0:0] y_unloader$053_val,
  output wire [ 127:0] y_unloader$054_msg,
  input  wire [   0:0] y_unloader$054_rdy,
  output wire [   0:0] y_unloader$054_val,
  output wire [ 127:0] y_unloader$055_msg,
  input  wire [   0:0] y_unloader$055_rdy,
  output wire [   0:0] y_unloader$055_val,
  output wire [ 127:0] y_unloader$056_msg,
  input  wire [   0:0] y_unloader$056_rdy,
  output wire [   0:0] y_unloader$056_val,
  output wire [ 127:0] y_unloader$057_msg,
  input  wire [   0:0] y_unloader$057_rdy,
  output wire [   0:0] y_unloader$057_val,
  output wire [ 127:0] y_unloader$058_msg,
  input  wire [   0:0] y_unloader$058_rdy,
  output wire [   0:0] y_unloader$058_val,
  output wire [ 127:0] y_unloader$059_msg,
  input  wire [   0:0] y_unloader$059_rdy,
  output wire [   0:0] y_unloader$059_val,
  output wire [ 127:0] y_unloader$005_msg,
  input  wire [   0:0] y_unloader$005_rdy,
  output wire [   0:0] y_unloader$005_val,
  output wire [ 127:0] y_unloader$060_msg,
  input  wire [   0:0] y_unloader$060_rdy,
  output wire [   0:0] y_unloader$060_val,
  output wire [ 127:0] y_unloader$061_msg,
  input  wire [   0:0] y_unloader$061_rdy,
  output wire [   0:0] y_unloader$061_val,
  output wire [ 127:0] y_unloader$062_msg,
  input  wire [   0:0] y_unloader$062_rdy,
  output wire [   0:0] y_unloader$062_val,
  output wire [ 127:0] y_unloader$063_msg,
  input  wire [   0:0] y_unloader$063_rdy,
  output wire [   0:0] y_unloader$063_val,
  output wire [ 127:0] y_unloader$006_msg,
  input  wire [   0:0] y_unloader$006_rdy,
  output wire [   0:0] y_unloader$006_val,
  output wire [ 127:0] y_unloader$007_msg,
  input  wire [   0:0] y_unloader$007_rdy,
  output wire [   0:0] y_unloader$007_val,
  output wire [ 127:0] y_unloader$008_msg,
  input  wire [   0:0] y_unloader$008_rdy,
  output wire [   0:0] y_unloader$008_val,
  output wire [ 127:0] y_unloader$009_msg,
  input  wire [   0:0] y_unloader$009_rdy,
  output wire [   0:0] y_unloader$009_val
);

  // wire declarations
  wire   [   0:0] cm_rdy_l$000;
  wire   [   0:0] cm_rdy_l$001;
  wire   [   0:0] cm_rdy_l$002;
  wire   [   0:0] cm_rdy_l$003;
  wire   [   0:0] cm_rdy_l$004;
  wire   [   0:0] cm_rdy_l$005;
  wire   [   0:0] cm_rdy_l$006;
  wire   [   0:0] cm_rdy_l$007;
  wire   [   0:0] cm_rdy_l$008;
  wire   [   0:0] cm_rdy_l$009;
  wire   [   0:0] cm_rdy_l$010;
  wire   [   0:0] cm_rdy_l$011;
  wire   [   0:0] cm_rdy_l$012;
  wire   [   0:0] cm_rdy_l$013;
  wire   [   0:0] cm_rdy_l$014;
  wire   [   0:0] cm_rdy_l$015;
  wire   [   0:0] cm_rdy_l$016;
  wire   [   0:0] cm_rdy_l$017;
  wire   [   0:0] cm_rdy_l$018;
  wire   [   0:0] cm_rdy_l$019;
  wire   [   0:0] cm_rdy_l$020;
  wire   [   0:0] cm_rdy_l$021;
  wire   [   0:0] cm_rdy_l$022;
  wire   [   0:0] cm_rdy_l$023;
  wire   [   0:0] cm_rdy_l$024;
  wire   [   0:0] cm_rdy_l$025;
  wire   [   0:0] cm_rdy_l$026;
  wire   [   0:0] cm_rdy_l$027;
  wire   [   0:0] cm_rdy_l$028;
  wire   [   0:0] cm_rdy_l$029;
  wire   [   0:0] cm_rdy_l$030;
  wire   [   0:0] cm_rdy_l$031;
  wire   [   0:0] cm_rdy_l$032;
  wire   [   0:0] cm_rdy_l$033;
  wire   [   0:0] cm_rdy_l$034;
  wire   [   0:0] cm_rdy_l$035;
  wire   [   0:0] cm_rdy_l$036;
  wire   [   0:0] cm_rdy_l$037;
  wire   [   0:0] cm_rdy_l$038;
  wire   [   0:0] cm_rdy_l$039;
  wire   [   0:0] cm_rdy_l$040;
  wire   [   0:0] cm_rdy_l$041;
  wire   [   0:0] cm_rdy_l$042;
  wire   [   0:0] cm_rdy_l$043;
  wire   [   0:0] cm_rdy_l$044;
  wire   [   0:0] cm_rdy_l$045;
  wire   [   0:0] cm_rdy_l$046;
  wire   [   0:0] cm_rdy_l$047;
  wire   [   0:0] cm_rdy_l$048;
  wire   [   0:0] cm_rdy_l$049;
  wire   [   0:0] cm_rdy_l$050;
  wire   [   0:0] cm_rdy_l$051;
  wire   [   0:0] cm_rdy_l$052;
  wire   [   0:0] cm_rdy_l$053;
  wire   [   0:0] cm_rdy_l$054;
  wire   [   0:0] cm_rdy_l$055;
  wire   [   0:0] cm_rdy_l$056;
  wire   [   0:0] cm_rdy_l$057;
  wire   [   0:0] cm_rdy_l$058;
  wire   [   0:0] cm_rdy_l$059;
  wire   [   0:0] cm_rdy_l$060;
  wire   [   0:0] cm_rdy_l$061;
  wire   [   0:0] cm_rdy_l$062;
  wire   [   0:0] cm_rdy_l$063;


  // localparam declarations
  localparam num_PE = 64;

  // loop variable declarations
  integer i;











  // pe$000 temporaries
  wire   [   0:0] pe$000$clk;
  wire   [   0:0] pe$000$reset;
  wire   [  63:0] pe$000$pe_id_msg;
  wire   [   0:0] pe$000$pe_id_val;
  wire   [   0:0] pe$000$cm_msg;
  wire   [   0:0] pe$000$cm_val;
  wire   [  63:0] pe$000$a_feeder_in_msg;
  wire   [   0:0] pe$000$a_feeder_in_val;
  wire   [   0:0] pe$000$a_feeder_out_rdy;
  wire   [   0:0] pe$000$xbar_req_rdy;
  wire   [  63:0] pe$000$xbar_resp_msg;
  wire   [   0:0] pe$000$xbar_resp_val;
  wire   [   0:0] pe$000$y_unloader_rdy;
  wire   [   0:0] pe$000$blkdone_sig_rdy;
  wire   [  31:0] pe$000$blkdone_ack_msg;
  wire   [   0:0] pe$000$blkdone_ack_val;
  wire   [   0:0] pe$000$pe_id_rdy;
  wire   [   0:0] pe$000$cm_rdy;
  wire   [   0:0] pe$000$a_feeder_in_rdy;
  wire   [  63:0] pe$000$a_feeder_out_msg;
  wire   [   0:0] pe$000$a_feeder_out_val;
  wire   [  31:0] pe$000$xbar_req_msg;
  wire   [   0:0] pe$000$xbar_req_val;
  wire   [   0:0] pe$000$xbar_resp_rdy;
  wire   [ 127:0] pe$000$y_unloader_msg;
  wire   [   0:0] pe$000$y_unloader_val;
  wire   [  31:0] pe$000$blkdone_sig_msg;
  wire   [   0:0] pe$000$blkdone_sig_val;
  wire   [   0:0] pe$000$blkdone_ack_rdy;

  SDPERTL_wrapped_0x5a96c41063a827a4 pe$000
  (
    .clk              ( pe$000$clk ),
    .reset            ( pe$000$reset ),
    .pe_id_msg        ( pe$000$pe_id_msg ),
    .pe_id_val        ( pe$000$pe_id_val ),
    .cm_msg           ( pe$000$cm_msg ),
    .cm_val           ( pe$000$cm_val ),
    .a_feeder_in_msg  ( pe$000$a_feeder_in_msg ),
    .a_feeder_in_val  ( pe$000$a_feeder_in_val ),
    .a_feeder_out_rdy ( pe$000$a_feeder_out_rdy ),
    .xbar_req_rdy     ( pe$000$xbar_req_rdy ),
    .xbar_resp_msg    ( pe$000$xbar_resp_msg ),
    .xbar_resp_val    ( pe$000$xbar_resp_val ),
    .y_unloader_rdy   ( pe$000$y_unloader_rdy ),
    .blkdone_sig_rdy  ( pe$000$blkdone_sig_rdy ),
    .blkdone_ack_msg  ( pe$000$blkdone_ack_msg ),
    .blkdone_ack_val  ( pe$000$blkdone_ack_val ),
    .pe_id_rdy        ( pe$000$pe_id_rdy ),
    .cm_rdy           ( pe$000$cm_rdy ),
    .a_feeder_in_rdy  ( pe$000$a_feeder_in_rdy ),
    .a_feeder_out_msg ( pe$000$a_feeder_out_msg ),
    .a_feeder_out_val ( pe$000$a_feeder_out_val ),
    .xbar_req_msg     ( pe$000$xbar_req_msg ),
    .xbar_req_val     ( pe$000$xbar_req_val ),
    .xbar_resp_rdy    ( pe$000$xbar_resp_rdy ),
    .y_unloader_msg   ( pe$000$y_unloader_msg ),
    .y_unloader_val   ( pe$000$y_unloader_val ),
    .blkdone_sig_msg  ( pe$000$blkdone_sig_msg ),
    .blkdone_sig_val  ( pe$000$blkdone_sig_val ),
    .blkdone_ack_rdy  ( pe$000$blkdone_ack_rdy )
  );

  // pe$001 temporaries
  wire   [   0:0] pe$001$clk;
  wire   [   0:0] pe$001$reset;
  wire   [  63:0] pe$001$pe_id_msg;
  wire   [   0:0] pe$001$pe_id_val;
  wire   [   0:0] pe$001$cm_msg;
  wire   [   0:0] pe$001$cm_val;
  wire   [  63:0] pe$001$a_feeder_in_msg;
  wire   [   0:0] pe$001$a_feeder_in_val;
  wire   [   0:0] pe$001$a_feeder_out_rdy;
  wire   [   0:0] pe$001$xbar_req_rdy;
  wire   [  63:0] pe$001$xbar_resp_msg;
  wire   [   0:0] pe$001$xbar_resp_val;
  wire   [   0:0] pe$001$y_unloader_rdy;
  wire   [   0:0] pe$001$blkdone_sig_rdy;
  wire   [  31:0] pe$001$blkdone_ack_msg;
  wire   [   0:0] pe$001$blkdone_ack_val;
  wire   [   0:0] pe$001$pe_id_rdy;
  wire   [   0:0] pe$001$cm_rdy;
  wire   [   0:0] pe$001$a_feeder_in_rdy;
  wire   [  63:0] pe$001$a_feeder_out_msg;
  wire   [   0:0] pe$001$a_feeder_out_val;
  wire   [  31:0] pe$001$xbar_req_msg;
  wire   [   0:0] pe$001$xbar_req_val;
  wire   [   0:0] pe$001$xbar_resp_rdy;
  wire   [ 127:0] pe$001$y_unloader_msg;
  wire   [   0:0] pe$001$y_unloader_val;
  wire   [  31:0] pe$001$blkdone_sig_msg;
  wire   [   0:0] pe$001$blkdone_sig_val;
  wire   [   0:0] pe$001$blkdone_ack_rdy;

  SDPERTL_wrapped_0x5a96c41063a827a4 pe$001
  (
    .clk              ( pe$001$clk ),
    .reset            ( pe$001$reset ),
    .pe_id_msg        ( pe$001$pe_id_msg ),
    .pe_id_val        ( pe$001$pe_id_val ),
    .cm_msg           ( pe$001$cm_msg ),
    .cm_val           ( pe$001$cm_val ),
    .a_feeder_in_msg  ( pe$001$a_feeder_in_msg ),
    .a_feeder_in_val  ( pe$001$a_feeder_in_val ),
    .a_feeder_out_rdy ( pe$001$a_feeder_out_rdy ),
    .xbar_req_rdy     ( pe$001$xbar_req_rdy ),
    .xbar_resp_msg    ( pe$001$xbar_resp_msg ),
    .xbar_resp_val    ( pe$001$xbar_resp_val ),
    .y_unloader_rdy   ( pe$001$y_unloader_rdy ),
    .blkdone_sig_rdy  ( pe$001$blkdone_sig_rdy ),
    .blkdone_ack_msg  ( pe$001$blkdone_ack_msg ),
    .blkdone_ack_val  ( pe$001$blkdone_ack_val ),
    .pe_id_rdy        ( pe$001$pe_id_rdy ),
    .cm_rdy           ( pe$001$cm_rdy ),
    .a_feeder_in_rdy  ( pe$001$a_feeder_in_rdy ),
    .a_feeder_out_msg ( pe$001$a_feeder_out_msg ),
    .a_feeder_out_val ( pe$001$a_feeder_out_val ),
    .xbar_req_msg     ( pe$001$xbar_req_msg ),
    .xbar_req_val     ( pe$001$xbar_req_val ),
    .xbar_resp_rdy    ( pe$001$xbar_resp_rdy ),
    .y_unloader_msg   ( pe$001$y_unloader_msg ),
    .y_unloader_val   ( pe$001$y_unloader_val ),
    .blkdone_sig_msg  ( pe$001$blkdone_sig_msg ),
    .blkdone_sig_val  ( pe$001$blkdone_sig_val ),
    .blkdone_ack_rdy  ( pe$001$blkdone_ack_rdy )
  );

  // pe$002 temporaries
  wire   [   0:0] pe$002$clk;
  wire   [   0:0] pe$002$reset;
  wire   [  63:0] pe$002$pe_id_msg;
  wire   [   0:0] pe$002$pe_id_val;
  wire   [   0:0] pe$002$cm_msg;
  wire   [   0:0] pe$002$cm_val;
  wire   [  63:0] pe$002$a_feeder_in_msg;
  wire   [   0:0] pe$002$a_feeder_in_val;
  wire   [   0:0] pe$002$a_feeder_out_rdy;
  wire   [   0:0] pe$002$xbar_req_rdy;
  wire   [  63:0] pe$002$xbar_resp_msg;
  wire   [   0:0] pe$002$xbar_resp_val;
  wire   [   0:0] pe$002$y_unloader_rdy;
  wire   [   0:0] pe$002$blkdone_sig_rdy;
  wire   [  31:0] pe$002$blkdone_ack_msg;
  wire   [   0:0] pe$002$blkdone_ack_val;
  wire   [   0:0] pe$002$pe_id_rdy;
  wire   [   0:0] pe$002$cm_rdy;
  wire   [   0:0] pe$002$a_feeder_in_rdy;
  wire   [  63:0] pe$002$a_feeder_out_msg;
  wire   [   0:0] pe$002$a_feeder_out_val;
  wire   [  31:0] pe$002$xbar_req_msg;
  wire   [   0:0] pe$002$xbar_req_val;
  wire   [   0:0] pe$002$xbar_resp_rdy;
  wire   [ 127:0] pe$002$y_unloader_msg;
  wire   [   0:0] pe$002$y_unloader_val;
  wire   [  31:0] pe$002$blkdone_sig_msg;
  wire   [   0:0] pe$002$blkdone_sig_val;
  wire   [   0:0] pe$002$blkdone_ack_rdy;

  SDPERTL_wrapped_0x5a96c41063a827a4 pe$002
  (
    .clk              ( pe$002$clk ),
    .reset            ( pe$002$reset ),
    .pe_id_msg        ( pe$002$pe_id_msg ),
    .pe_id_val        ( pe$002$pe_id_val ),
    .cm_msg           ( pe$002$cm_msg ),
    .cm_val           ( pe$002$cm_val ),
    .a_feeder_in_msg  ( pe$002$a_feeder_in_msg ),
    .a_feeder_in_val  ( pe$002$a_feeder_in_val ),
    .a_feeder_out_rdy ( pe$002$a_feeder_out_rdy ),
    .xbar_req_rdy     ( pe$002$xbar_req_rdy ),
    .xbar_resp_msg    ( pe$002$xbar_resp_msg ),
    .xbar_resp_val    ( pe$002$xbar_resp_val ),
    .y_unloader_rdy   ( pe$002$y_unloader_rdy ),
    .blkdone_sig_rdy  ( pe$002$blkdone_sig_rdy ),
    .blkdone_ack_msg  ( pe$002$blkdone_ack_msg ),
    .blkdone_ack_val  ( pe$002$blkdone_ack_val ),
    .pe_id_rdy        ( pe$002$pe_id_rdy ),
    .cm_rdy           ( pe$002$cm_rdy ),
    .a_feeder_in_rdy  ( pe$002$a_feeder_in_rdy ),
    .a_feeder_out_msg ( pe$002$a_feeder_out_msg ),
    .a_feeder_out_val ( pe$002$a_feeder_out_val ),
    .xbar_req_msg     ( pe$002$xbar_req_msg ),
    .xbar_req_val     ( pe$002$xbar_req_val ),
    .xbar_resp_rdy    ( pe$002$xbar_resp_rdy ),
    .y_unloader_msg   ( pe$002$y_unloader_msg ),
    .y_unloader_val   ( pe$002$y_unloader_val ),
    .blkdone_sig_msg  ( pe$002$blkdone_sig_msg ),
    .blkdone_sig_val  ( pe$002$blkdone_sig_val ),
    .blkdone_ack_rdy  ( pe$002$blkdone_ack_rdy )
  );

  // pe$003 temporaries
  wire   [   0:0] pe$003$clk;
  wire   [   0:0] pe$003$reset;
  wire   [  63:0] pe$003$pe_id_msg;
  wire   [   0:0] pe$003$pe_id_val;
  wire   [   0:0] pe$003$cm_msg;
  wire   [   0:0] pe$003$cm_val;
  wire   [  63:0] pe$003$a_feeder_in_msg;
  wire   [   0:0] pe$003$a_feeder_in_val;
  wire   [   0:0] pe$003$a_feeder_out_rdy;
  wire   [   0:0] pe$003$xbar_req_rdy;
  wire   [  63:0] pe$003$xbar_resp_msg;
  wire   [   0:0] pe$003$xbar_resp_val;
  wire   [   0:0] pe$003$y_unloader_rdy;
  wire   [   0:0] pe$003$blkdone_sig_rdy;
  wire   [  31:0] pe$003$blkdone_ack_msg;
  wire   [   0:0] pe$003$blkdone_ack_val;
  wire   [   0:0] pe$003$pe_id_rdy;
  wire   [   0:0] pe$003$cm_rdy;
  wire   [   0:0] pe$003$a_feeder_in_rdy;
  wire   [  63:0] pe$003$a_feeder_out_msg;
  wire   [   0:0] pe$003$a_feeder_out_val;
  wire   [  31:0] pe$003$xbar_req_msg;
  wire   [   0:0] pe$003$xbar_req_val;
  wire   [   0:0] pe$003$xbar_resp_rdy;
  wire   [ 127:0] pe$003$y_unloader_msg;
  wire   [   0:0] pe$003$y_unloader_val;
  wire   [  31:0] pe$003$blkdone_sig_msg;
  wire   [   0:0] pe$003$blkdone_sig_val;
  wire   [   0:0] pe$003$blkdone_ack_rdy;

  SDPERTL_wrapped_0x5a96c41063a827a4 pe$003
  (
    .clk              ( pe$003$clk ),
    .reset            ( pe$003$reset ),
    .pe_id_msg        ( pe$003$pe_id_msg ),
    .pe_id_val        ( pe$003$pe_id_val ),
    .cm_msg           ( pe$003$cm_msg ),
    .cm_val           ( pe$003$cm_val ),
    .a_feeder_in_msg  ( pe$003$a_feeder_in_msg ),
    .a_feeder_in_val  ( pe$003$a_feeder_in_val ),
    .a_feeder_out_rdy ( pe$003$a_feeder_out_rdy ),
    .xbar_req_rdy     ( pe$003$xbar_req_rdy ),
    .xbar_resp_msg    ( pe$003$xbar_resp_msg ),
    .xbar_resp_val    ( pe$003$xbar_resp_val ),
    .y_unloader_rdy   ( pe$003$y_unloader_rdy ),
    .blkdone_sig_rdy  ( pe$003$blkdone_sig_rdy ),
    .blkdone_ack_msg  ( pe$003$blkdone_ack_msg ),
    .blkdone_ack_val  ( pe$003$blkdone_ack_val ),
    .pe_id_rdy        ( pe$003$pe_id_rdy ),
    .cm_rdy           ( pe$003$cm_rdy ),
    .a_feeder_in_rdy  ( pe$003$a_feeder_in_rdy ),
    .a_feeder_out_msg ( pe$003$a_feeder_out_msg ),
    .a_feeder_out_val ( pe$003$a_feeder_out_val ),
    .xbar_req_msg     ( pe$003$xbar_req_msg ),
    .xbar_req_val     ( pe$003$xbar_req_val ),
    .xbar_resp_rdy    ( pe$003$xbar_resp_rdy ),
    .y_unloader_msg   ( pe$003$y_unloader_msg ),
    .y_unloader_val   ( pe$003$y_unloader_val ),
    .blkdone_sig_msg  ( pe$003$blkdone_sig_msg ),
    .blkdone_sig_val  ( pe$003$blkdone_sig_val ),
    .blkdone_ack_rdy  ( pe$003$blkdone_ack_rdy )
  );

  // pe$004 temporaries
  wire   [   0:0] pe$004$clk;
  wire   [   0:0] pe$004$reset;
  wire   [  63:0] pe$004$pe_id_msg;
  wire   [   0:0] pe$004$pe_id_val;
  wire   [   0:0] pe$004$cm_msg;
  wire   [   0:0] pe$004$cm_val;
  wire   [  63:0] pe$004$a_feeder_in_msg;
  wire   [   0:0] pe$004$a_feeder_in_val;
  wire   [   0:0] pe$004$a_feeder_out_rdy;
  wire   [   0:0] pe$004$xbar_req_rdy;
  wire   [  63:0] pe$004$xbar_resp_msg;
  wire   [   0:0] pe$004$xbar_resp_val;
  wire   [   0:0] pe$004$y_unloader_rdy;
  wire   [   0:0] pe$004$blkdone_sig_rdy;
  wire   [  31:0] pe$004$blkdone_ack_msg;
  wire   [   0:0] pe$004$blkdone_ack_val;
  wire   [   0:0] pe$004$pe_id_rdy;
  wire   [   0:0] pe$004$cm_rdy;
  wire   [   0:0] pe$004$a_feeder_in_rdy;
  wire   [  63:0] pe$004$a_feeder_out_msg;
  wire   [   0:0] pe$004$a_feeder_out_val;
  wire   [  31:0] pe$004$xbar_req_msg;
  wire   [   0:0] pe$004$xbar_req_val;
  wire   [   0:0] pe$004$xbar_resp_rdy;
  wire   [ 127:0] pe$004$y_unloader_msg;
  wire   [   0:0] pe$004$y_unloader_val;
  wire   [  31:0] pe$004$blkdone_sig_msg;
  wire   [   0:0] pe$004$blkdone_sig_val;
  wire   [   0:0] pe$004$blkdone_ack_rdy;

  SDPERTL_wrapped_0x5a96c41063a827a4 pe$004
  (
    .clk              ( pe$004$clk ),
    .reset            ( pe$004$reset ),
    .pe_id_msg        ( pe$004$pe_id_msg ),
    .pe_id_val        ( pe$004$pe_id_val ),
    .cm_msg           ( pe$004$cm_msg ),
    .cm_val           ( pe$004$cm_val ),
    .a_feeder_in_msg  ( pe$004$a_feeder_in_msg ),
    .a_feeder_in_val  ( pe$004$a_feeder_in_val ),
    .a_feeder_out_rdy ( pe$004$a_feeder_out_rdy ),
    .xbar_req_rdy     ( pe$004$xbar_req_rdy ),
    .xbar_resp_msg    ( pe$004$xbar_resp_msg ),
    .xbar_resp_val    ( pe$004$xbar_resp_val ),
    .y_unloader_rdy   ( pe$004$y_unloader_rdy ),
    .blkdone_sig_rdy  ( pe$004$blkdone_sig_rdy ),
    .blkdone_ack_msg  ( pe$004$blkdone_ack_msg ),
    .blkdone_ack_val  ( pe$004$blkdone_ack_val ),
    .pe_id_rdy        ( pe$004$pe_id_rdy ),
    .cm_rdy           ( pe$004$cm_rdy ),
    .a_feeder_in_rdy  ( pe$004$a_feeder_in_rdy ),
    .a_feeder_out_msg ( pe$004$a_feeder_out_msg ),
    .a_feeder_out_val ( pe$004$a_feeder_out_val ),
    .xbar_req_msg     ( pe$004$xbar_req_msg ),
    .xbar_req_val     ( pe$004$xbar_req_val ),
    .xbar_resp_rdy    ( pe$004$xbar_resp_rdy ),
    .y_unloader_msg   ( pe$004$y_unloader_msg ),
    .y_unloader_val   ( pe$004$y_unloader_val ),
    .blkdone_sig_msg  ( pe$004$blkdone_sig_msg ),
    .blkdone_sig_val  ( pe$004$blkdone_sig_val ),
    .blkdone_ack_rdy  ( pe$004$blkdone_ack_rdy )
  );

  // pe$005 temporaries
  wire   [   0:0] pe$005$clk;
  wire   [   0:0] pe$005$reset;
  wire   [  63:0] pe$005$pe_id_msg;
  wire   [   0:0] pe$005$pe_id_val;
  wire   [   0:0] pe$005$cm_msg;
  wire   [   0:0] pe$005$cm_val;
  wire   [  63:0] pe$005$a_feeder_in_msg;
  wire   [   0:0] pe$005$a_feeder_in_val;
  wire   [   0:0] pe$005$a_feeder_out_rdy;
  wire   [   0:0] pe$005$xbar_req_rdy;
  wire   [  63:0] pe$005$xbar_resp_msg;
  wire   [   0:0] pe$005$xbar_resp_val;
  wire   [   0:0] pe$005$y_unloader_rdy;
  wire   [   0:0] pe$005$blkdone_sig_rdy;
  wire   [  31:0] pe$005$blkdone_ack_msg;
  wire   [   0:0] pe$005$blkdone_ack_val;
  wire   [   0:0] pe$005$pe_id_rdy;
  wire   [   0:0] pe$005$cm_rdy;
  wire   [   0:0] pe$005$a_feeder_in_rdy;
  wire   [  63:0] pe$005$a_feeder_out_msg;
  wire   [   0:0] pe$005$a_feeder_out_val;
  wire   [  31:0] pe$005$xbar_req_msg;
  wire   [   0:0] pe$005$xbar_req_val;
  wire   [   0:0] pe$005$xbar_resp_rdy;
  wire   [ 127:0] pe$005$y_unloader_msg;
  wire   [   0:0] pe$005$y_unloader_val;
  wire   [  31:0] pe$005$blkdone_sig_msg;
  wire   [   0:0] pe$005$blkdone_sig_val;
  wire   [   0:0] pe$005$blkdone_ack_rdy;

  SDPERTL_wrapped_0x5a96c41063a827a4 pe$005
  (
    .clk              ( pe$005$clk ),
    .reset            ( pe$005$reset ),
    .pe_id_msg        ( pe$005$pe_id_msg ),
    .pe_id_val        ( pe$005$pe_id_val ),
    .cm_msg           ( pe$005$cm_msg ),
    .cm_val           ( pe$005$cm_val ),
    .a_feeder_in_msg  ( pe$005$a_feeder_in_msg ),
    .a_feeder_in_val  ( pe$005$a_feeder_in_val ),
    .a_feeder_out_rdy ( pe$005$a_feeder_out_rdy ),
    .xbar_req_rdy     ( pe$005$xbar_req_rdy ),
    .xbar_resp_msg    ( pe$005$xbar_resp_msg ),
    .xbar_resp_val    ( pe$005$xbar_resp_val ),
    .y_unloader_rdy   ( pe$005$y_unloader_rdy ),
    .blkdone_sig_rdy  ( pe$005$blkdone_sig_rdy ),
    .blkdone_ack_msg  ( pe$005$blkdone_ack_msg ),
    .blkdone_ack_val  ( pe$005$blkdone_ack_val ),
    .pe_id_rdy        ( pe$005$pe_id_rdy ),
    .cm_rdy           ( pe$005$cm_rdy ),
    .a_feeder_in_rdy  ( pe$005$a_feeder_in_rdy ),
    .a_feeder_out_msg ( pe$005$a_feeder_out_msg ),
    .a_feeder_out_val ( pe$005$a_feeder_out_val ),
    .xbar_req_msg     ( pe$005$xbar_req_msg ),
    .xbar_req_val     ( pe$005$xbar_req_val ),
    .xbar_resp_rdy    ( pe$005$xbar_resp_rdy ),
    .y_unloader_msg   ( pe$005$y_unloader_msg ),
    .y_unloader_val   ( pe$005$y_unloader_val ),
    .blkdone_sig_msg  ( pe$005$blkdone_sig_msg ),
    .blkdone_sig_val  ( pe$005$blkdone_sig_val ),
    .blkdone_ack_rdy  ( pe$005$blkdone_ack_rdy )
  );

  // pe$006 temporaries
  wire   [   0:0] pe$006$clk;
  wire   [   0:0] pe$006$reset;
  wire   [  63:0] pe$006$pe_id_msg;
  wire   [   0:0] pe$006$pe_id_val;
  wire   [   0:0] pe$006$cm_msg;
  wire   [   0:0] pe$006$cm_val;
  wire   [  63:0] pe$006$a_feeder_in_msg;
  wire   [   0:0] pe$006$a_feeder_in_val;
  wire   [   0:0] pe$006$a_feeder_out_rdy;
  wire   [   0:0] pe$006$xbar_req_rdy;
  wire   [  63:0] pe$006$xbar_resp_msg;
  wire   [   0:0] pe$006$xbar_resp_val;
  wire   [   0:0] pe$006$y_unloader_rdy;
  wire   [   0:0] pe$006$blkdone_sig_rdy;
  wire   [  31:0] pe$006$blkdone_ack_msg;
  wire   [   0:0] pe$006$blkdone_ack_val;
  wire   [   0:0] pe$006$pe_id_rdy;
  wire   [   0:0] pe$006$cm_rdy;
  wire   [   0:0] pe$006$a_feeder_in_rdy;
  wire   [  63:0] pe$006$a_feeder_out_msg;
  wire   [   0:0] pe$006$a_feeder_out_val;
  wire   [  31:0] pe$006$xbar_req_msg;
  wire   [   0:0] pe$006$xbar_req_val;
  wire   [   0:0] pe$006$xbar_resp_rdy;
  wire   [ 127:0] pe$006$y_unloader_msg;
  wire   [   0:0] pe$006$y_unloader_val;
  wire   [  31:0] pe$006$blkdone_sig_msg;
  wire   [   0:0] pe$006$blkdone_sig_val;
  wire   [   0:0] pe$006$blkdone_ack_rdy;

  SDPERTL_wrapped_0x5a96c41063a827a4 pe$006
  (
    .clk              ( pe$006$clk ),
    .reset            ( pe$006$reset ),
    .pe_id_msg        ( pe$006$pe_id_msg ),
    .pe_id_val        ( pe$006$pe_id_val ),
    .cm_msg           ( pe$006$cm_msg ),
    .cm_val           ( pe$006$cm_val ),
    .a_feeder_in_msg  ( pe$006$a_feeder_in_msg ),
    .a_feeder_in_val  ( pe$006$a_feeder_in_val ),
    .a_feeder_out_rdy ( pe$006$a_feeder_out_rdy ),
    .xbar_req_rdy     ( pe$006$xbar_req_rdy ),
    .xbar_resp_msg    ( pe$006$xbar_resp_msg ),
    .xbar_resp_val    ( pe$006$xbar_resp_val ),
    .y_unloader_rdy   ( pe$006$y_unloader_rdy ),
    .blkdone_sig_rdy  ( pe$006$blkdone_sig_rdy ),
    .blkdone_ack_msg  ( pe$006$blkdone_ack_msg ),
    .blkdone_ack_val  ( pe$006$blkdone_ack_val ),
    .pe_id_rdy        ( pe$006$pe_id_rdy ),
    .cm_rdy           ( pe$006$cm_rdy ),
    .a_feeder_in_rdy  ( pe$006$a_feeder_in_rdy ),
    .a_feeder_out_msg ( pe$006$a_feeder_out_msg ),
    .a_feeder_out_val ( pe$006$a_feeder_out_val ),
    .xbar_req_msg     ( pe$006$xbar_req_msg ),
    .xbar_req_val     ( pe$006$xbar_req_val ),
    .xbar_resp_rdy    ( pe$006$xbar_resp_rdy ),
    .y_unloader_msg   ( pe$006$y_unloader_msg ),
    .y_unloader_val   ( pe$006$y_unloader_val ),
    .blkdone_sig_msg  ( pe$006$blkdone_sig_msg ),
    .blkdone_sig_val  ( pe$006$blkdone_sig_val ),
    .blkdone_ack_rdy  ( pe$006$blkdone_ack_rdy )
  );

  // pe$007 temporaries
  wire   [   0:0] pe$007$clk;
  wire   [   0:0] pe$007$reset;
  wire   [  63:0] pe$007$pe_id_msg;
  wire   [   0:0] pe$007$pe_id_val;
  wire   [   0:0] pe$007$cm_msg;
  wire   [   0:0] pe$007$cm_val;
  wire   [  63:0] pe$007$a_feeder_in_msg;
  wire   [   0:0] pe$007$a_feeder_in_val;
  wire   [   0:0] pe$007$a_feeder_out_rdy;
  wire   [   0:0] pe$007$xbar_req_rdy;
  wire   [  63:0] pe$007$xbar_resp_msg;
  wire   [   0:0] pe$007$xbar_resp_val;
  wire   [   0:0] pe$007$y_unloader_rdy;
  wire   [   0:0] pe$007$blkdone_sig_rdy;
  wire   [  31:0] pe$007$blkdone_ack_msg;
  wire   [   0:0] pe$007$blkdone_ack_val;
  wire   [   0:0] pe$007$pe_id_rdy;
  wire   [   0:0] pe$007$cm_rdy;
  wire   [   0:0] pe$007$a_feeder_in_rdy;
  wire   [  63:0] pe$007$a_feeder_out_msg;
  wire   [   0:0] pe$007$a_feeder_out_val;
  wire   [  31:0] pe$007$xbar_req_msg;
  wire   [   0:0] pe$007$xbar_req_val;
  wire   [   0:0] pe$007$xbar_resp_rdy;
  wire   [ 127:0] pe$007$y_unloader_msg;
  wire   [   0:0] pe$007$y_unloader_val;
  wire   [  31:0] pe$007$blkdone_sig_msg;
  wire   [   0:0] pe$007$blkdone_sig_val;
  wire   [   0:0] pe$007$blkdone_ack_rdy;

  SDPERTL_wrapped_0x5a96c41063a827a4 pe$007
  (
    .clk              ( pe$007$clk ),
    .reset            ( pe$007$reset ),
    .pe_id_msg        ( pe$007$pe_id_msg ),
    .pe_id_val        ( pe$007$pe_id_val ),
    .cm_msg           ( pe$007$cm_msg ),
    .cm_val           ( pe$007$cm_val ),
    .a_feeder_in_msg  ( pe$007$a_feeder_in_msg ),
    .a_feeder_in_val  ( pe$007$a_feeder_in_val ),
    .a_feeder_out_rdy ( pe$007$a_feeder_out_rdy ),
    .xbar_req_rdy     ( pe$007$xbar_req_rdy ),
    .xbar_resp_msg    ( pe$007$xbar_resp_msg ),
    .xbar_resp_val    ( pe$007$xbar_resp_val ),
    .y_unloader_rdy   ( pe$007$y_unloader_rdy ),
    .blkdone_sig_rdy  ( pe$007$blkdone_sig_rdy ),
    .blkdone_ack_msg  ( pe$007$blkdone_ack_msg ),
    .blkdone_ack_val  ( pe$007$blkdone_ack_val ),
    .pe_id_rdy        ( pe$007$pe_id_rdy ),
    .cm_rdy           ( pe$007$cm_rdy ),
    .a_feeder_in_rdy  ( pe$007$a_feeder_in_rdy ),
    .a_feeder_out_msg ( pe$007$a_feeder_out_msg ),
    .a_feeder_out_val ( pe$007$a_feeder_out_val ),
    .xbar_req_msg     ( pe$007$xbar_req_msg ),
    .xbar_req_val     ( pe$007$xbar_req_val ),
    .xbar_resp_rdy    ( pe$007$xbar_resp_rdy ),
    .y_unloader_msg   ( pe$007$y_unloader_msg ),
    .y_unloader_val   ( pe$007$y_unloader_val ),
    .blkdone_sig_msg  ( pe$007$blkdone_sig_msg ),
    .blkdone_sig_val  ( pe$007$blkdone_sig_val ),
    .blkdone_ack_rdy  ( pe$007$blkdone_ack_rdy )
  );

  // pe$008 temporaries
  wire   [   0:0] pe$008$clk;
  wire   [   0:0] pe$008$reset;
  wire   [  63:0] pe$008$pe_id_msg;
  wire   [   0:0] pe$008$pe_id_val;
  wire   [   0:0] pe$008$cm_msg;
  wire   [   0:0] pe$008$cm_val;
  wire   [  63:0] pe$008$a_feeder_in_msg;
  wire   [   0:0] pe$008$a_feeder_in_val;
  wire   [   0:0] pe$008$a_feeder_out_rdy;
  wire   [   0:0] pe$008$xbar_req_rdy;
  wire   [  63:0] pe$008$xbar_resp_msg;
  wire   [   0:0] pe$008$xbar_resp_val;
  wire   [   0:0] pe$008$y_unloader_rdy;
  wire   [   0:0] pe$008$blkdone_sig_rdy;
  wire   [  31:0] pe$008$blkdone_ack_msg;
  wire   [   0:0] pe$008$blkdone_ack_val;
  wire   [   0:0] pe$008$pe_id_rdy;
  wire   [   0:0] pe$008$cm_rdy;
  wire   [   0:0] pe$008$a_feeder_in_rdy;
  wire   [  63:0] pe$008$a_feeder_out_msg;
  wire   [   0:0] pe$008$a_feeder_out_val;
  wire   [  31:0] pe$008$xbar_req_msg;
  wire   [   0:0] pe$008$xbar_req_val;
  wire   [   0:0] pe$008$xbar_resp_rdy;
  wire   [ 127:0] pe$008$y_unloader_msg;
  wire   [   0:0] pe$008$y_unloader_val;
  wire   [  31:0] pe$008$blkdone_sig_msg;
  wire   [   0:0] pe$008$blkdone_sig_val;
  wire   [   0:0] pe$008$blkdone_ack_rdy;

  SDPERTL_wrapped_0x5a96c41063a827a4 pe$008
  (
    .clk              ( pe$008$clk ),
    .reset            ( pe$008$reset ),
    .pe_id_msg        ( pe$008$pe_id_msg ),
    .pe_id_val        ( pe$008$pe_id_val ),
    .cm_msg           ( pe$008$cm_msg ),
    .cm_val           ( pe$008$cm_val ),
    .a_feeder_in_msg  ( pe$008$a_feeder_in_msg ),
    .a_feeder_in_val  ( pe$008$a_feeder_in_val ),
    .a_feeder_out_rdy ( pe$008$a_feeder_out_rdy ),
    .xbar_req_rdy     ( pe$008$xbar_req_rdy ),
    .xbar_resp_msg    ( pe$008$xbar_resp_msg ),
    .xbar_resp_val    ( pe$008$xbar_resp_val ),
    .y_unloader_rdy   ( pe$008$y_unloader_rdy ),
    .blkdone_sig_rdy  ( pe$008$blkdone_sig_rdy ),
    .blkdone_ack_msg  ( pe$008$blkdone_ack_msg ),
    .blkdone_ack_val  ( pe$008$blkdone_ack_val ),
    .pe_id_rdy        ( pe$008$pe_id_rdy ),
    .cm_rdy           ( pe$008$cm_rdy ),
    .a_feeder_in_rdy  ( pe$008$a_feeder_in_rdy ),
    .a_feeder_out_msg ( pe$008$a_feeder_out_msg ),
    .a_feeder_out_val ( pe$008$a_feeder_out_val ),
    .xbar_req_msg     ( pe$008$xbar_req_msg ),
    .xbar_req_val     ( pe$008$xbar_req_val ),
    .xbar_resp_rdy    ( pe$008$xbar_resp_rdy ),
    .y_unloader_msg   ( pe$008$y_unloader_msg ),
    .y_unloader_val   ( pe$008$y_unloader_val ),
    .blkdone_sig_msg  ( pe$008$blkdone_sig_msg ),
    .blkdone_sig_val  ( pe$008$blkdone_sig_val ),
    .blkdone_ack_rdy  ( pe$008$blkdone_ack_rdy )
  );

  // pe$009 temporaries
  wire   [   0:0] pe$009$clk;
  wire   [   0:0] pe$009$reset;
  wire   [  63:0] pe$009$pe_id_msg;
  wire   [   0:0] pe$009$pe_id_val;
  wire   [   0:0] pe$009$cm_msg;
  wire   [   0:0] pe$009$cm_val;
  wire   [  63:0] pe$009$a_feeder_in_msg;
  wire   [   0:0] pe$009$a_feeder_in_val;
  wire   [   0:0] pe$009$a_feeder_out_rdy;
  wire   [   0:0] pe$009$xbar_req_rdy;
  wire   [  63:0] pe$009$xbar_resp_msg;
  wire   [   0:0] pe$009$xbar_resp_val;
  wire   [   0:0] pe$009$y_unloader_rdy;
  wire   [   0:0] pe$009$blkdone_sig_rdy;
  wire   [  31:0] pe$009$blkdone_ack_msg;
  wire   [   0:0] pe$009$blkdone_ack_val;
  wire   [   0:0] pe$009$pe_id_rdy;
  wire   [   0:0] pe$009$cm_rdy;
  wire   [   0:0] pe$009$a_feeder_in_rdy;
  wire   [  63:0] pe$009$a_feeder_out_msg;
  wire   [   0:0] pe$009$a_feeder_out_val;
  wire   [  31:0] pe$009$xbar_req_msg;
  wire   [   0:0] pe$009$xbar_req_val;
  wire   [   0:0] pe$009$xbar_resp_rdy;
  wire   [ 127:0] pe$009$y_unloader_msg;
  wire   [   0:0] pe$009$y_unloader_val;
  wire   [  31:0] pe$009$blkdone_sig_msg;
  wire   [   0:0] pe$009$blkdone_sig_val;
  wire   [   0:0] pe$009$blkdone_ack_rdy;

  SDPERTL_wrapped_0x5a96c41063a827a4 pe$009
  (
    .clk              ( pe$009$clk ),
    .reset            ( pe$009$reset ),
    .pe_id_msg        ( pe$009$pe_id_msg ),
    .pe_id_val        ( pe$009$pe_id_val ),
    .cm_msg           ( pe$009$cm_msg ),
    .cm_val           ( pe$009$cm_val ),
    .a_feeder_in_msg  ( pe$009$a_feeder_in_msg ),
    .a_feeder_in_val  ( pe$009$a_feeder_in_val ),
    .a_feeder_out_rdy ( pe$009$a_feeder_out_rdy ),
    .xbar_req_rdy     ( pe$009$xbar_req_rdy ),
    .xbar_resp_msg    ( pe$009$xbar_resp_msg ),
    .xbar_resp_val    ( pe$009$xbar_resp_val ),
    .y_unloader_rdy   ( pe$009$y_unloader_rdy ),
    .blkdone_sig_rdy  ( pe$009$blkdone_sig_rdy ),
    .blkdone_ack_msg  ( pe$009$blkdone_ack_msg ),
    .blkdone_ack_val  ( pe$009$blkdone_ack_val ),
    .pe_id_rdy        ( pe$009$pe_id_rdy ),
    .cm_rdy           ( pe$009$cm_rdy ),
    .a_feeder_in_rdy  ( pe$009$a_feeder_in_rdy ),
    .a_feeder_out_msg ( pe$009$a_feeder_out_msg ),
    .a_feeder_out_val ( pe$009$a_feeder_out_val ),
    .xbar_req_msg     ( pe$009$xbar_req_msg ),
    .xbar_req_val     ( pe$009$xbar_req_val ),
    .xbar_resp_rdy    ( pe$009$xbar_resp_rdy ),
    .y_unloader_msg   ( pe$009$y_unloader_msg ),
    .y_unloader_val   ( pe$009$y_unloader_val ),
    .blkdone_sig_msg  ( pe$009$blkdone_sig_msg ),
    .blkdone_sig_val  ( pe$009$blkdone_sig_val ),
    .blkdone_ack_rdy  ( pe$009$blkdone_ack_rdy )
  );

  // pe$010 temporaries
  wire   [   0:0] pe$010$clk;
  wire   [   0:0] pe$010$reset;
  wire   [  63:0] pe$010$pe_id_msg;
  wire   [   0:0] pe$010$pe_id_val;
  wire   [   0:0] pe$010$cm_msg;
  wire   [   0:0] pe$010$cm_val;
  wire   [  63:0] pe$010$a_feeder_in_msg;
  wire   [   0:0] pe$010$a_feeder_in_val;
  wire   [   0:0] pe$010$a_feeder_out_rdy;
  wire   [   0:0] pe$010$xbar_req_rdy;
  wire   [  63:0] pe$010$xbar_resp_msg;
  wire   [   0:0] pe$010$xbar_resp_val;
  wire   [   0:0] pe$010$y_unloader_rdy;
  wire   [   0:0] pe$010$blkdone_sig_rdy;
  wire   [  31:0] pe$010$blkdone_ack_msg;
  wire   [   0:0] pe$010$blkdone_ack_val;
  wire   [   0:0] pe$010$pe_id_rdy;
  wire   [   0:0] pe$010$cm_rdy;
  wire   [   0:0] pe$010$a_feeder_in_rdy;
  wire   [  63:0] pe$010$a_feeder_out_msg;
  wire   [   0:0] pe$010$a_feeder_out_val;
  wire   [  31:0] pe$010$xbar_req_msg;
  wire   [   0:0] pe$010$xbar_req_val;
  wire   [   0:0] pe$010$xbar_resp_rdy;
  wire   [ 127:0] pe$010$y_unloader_msg;
  wire   [   0:0] pe$010$y_unloader_val;
  wire   [  31:0] pe$010$blkdone_sig_msg;
  wire   [   0:0] pe$010$blkdone_sig_val;
  wire   [   0:0] pe$010$blkdone_ack_rdy;

  SDPERTL_wrapped_0x5a96c41063a827a4 pe$010
  (
    .clk              ( pe$010$clk ),
    .reset            ( pe$010$reset ),
    .pe_id_msg        ( pe$010$pe_id_msg ),
    .pe_id_val        ( pe$010$pe_id_val ),
    .cm_msg           ( pe$010$cm_msg ),
    .cm_val           ( pe$010$cm_val ),
    .a_feeder_in_msg  ( pe$010$a_feeder_in_msg ),
    .a_feeder_in_val  ( pe$010$a_feeder_in_val ),
    .a_feeder_out_rdy ( pe$010$a_feeder_out_rdy ),
    .xbar_req_rdy     ( pe$010$xbar_req_rdy ),
    .xbar_resp_msg    ( pe$010$xbar_resp_msg ),
    .xbar_resp_val    ( pe$010$xbar_resp_val ),
    .y_unloader_rdy   ( pe$010$y_unloader_rdy ),
    .blkdone_sig_rdy  ( pe$010$blkdone_sig_rdy ),
    .blkdone_ack_msg  ( pe$010$blkdone_ack_msg ),
    .blkdone_ack_val  ( pe$010$blkdone_ack_val ),
    .pe_id_rdy        ( pe$010$pe_id_rdy ),
    .cm_rdy           ( pe$010$cm_rdy ),
    .a_feeder_in_rdy  ( pe$010$a_feeder_in_rdy ),
    .a_feeder_out_msg ( pe$010$a_feeder_out_msg ),
    .a_feeder_out_val ( pe$010$a_feeder_out_val ),
    .xbar_req_msg     ( pe$010$xbar_req_msg ),
    .xbar_req_val     ( pe$010$xbar_req_val ),
    .xbar_resp_rdy    ( pe$010$xbar_resp_rdy ),
    .y_unloader_msg   ( pe$010$y_unloader_msg ),
    .y_unloader_val   ( pe$010$y_unloader_val ),
    .blkdone_sig_msg  ( pe$010$blkdone_sig_msg ),
    .blkdone_sig_val  ( pe$010$blkdone_sig_val ),
    .blkdone_ack_rdy  ( pe$010$blkdone_ack_rdy )
  );

  // pe$011 temporaries
  wire   [   0:0] pe$011$clk;
  wire   [   0:0] pe$011$reset;
  wire   [  63:0] pe$011$pe_id_msg;
  wire   [   0:0] pe$011$pe_id_val;
  wire   [   0:0] pe$011$cm_msg;
  wire   [   0:0] pe$011$cm_val;
  wire   [  63:0] pe$011$a_feeder_in_msg;
  wire   [   0:0] pe$011$a_feeder_in_val;
  wire   [   0:0] pe$011$a_feeder_out_rdy;
  wire   [   0:0] pe$011$xbar_req_rdy;
  wire   [  63:0] pe$011$xbar_resp_msg;
  wire   [   0:0] pe$011$xbar_resp_val;
  wire   [   0:0] pe$011$y_unloader_rdy;
  wire   [   0:0] pe$011$blkdone_sig_rdy;
  wire   [  31:0] pe$011$blkdone_ack_msg;
  wire   [   0:0] pe$011$blkdone_ack_val;
  wire   [   0:0] pe$011$pe_id_rdy;
  wire   [   0:0] pe$011$cm_rdy;
  wire   [   0:0] pe$011$a_feeder_in_rdy;
  wire   [  63:0] pe$011$a_feeder_out_msg;
  wire   [   0:0] pe$011$a_feeder_out_val;
  wire   [  31:0] pe$011$xbar_req_msg;
  wire   [   0:0] pe$011$xbar_req_val;
  wire   [   0:0] pe$011$xbar_resp_rdy;
  wire   [ 127:0] pe$011$y_unloader_msg;
  wire   [   0:0] pe$011$y_unloader_val;
  wire   [  31:0] pe$011$blkdone_sig_msg;
  wire   [   0:0] pe$011$blkdone_sig_val;
  wire   [   0:0] pe$011$blkdone_ack_rdy;

  SDPERTL_wrapped_0x5a96c41063a827a4 pe$011
  (
    .clk              ( pe$011$clk ),
    .reset            ( pe$011$reset ),
    .pe_id_msg        ( pe$011$pe_id_msg ),
    .pe_id_val        ( pe$011$pe_id_val ),
    .cm_msg           ( pe$011$cm_msg ),
    .cm_val           ( pe$011$cm_val ),
    .a_feeder_in_msg  ( pe$011$a_feeder_in_msg ),
    .a_feeder_in_val  ( pe$011$a_feeder_in_val ),
    .a_feeder_out_rdy ( pe$011$a_feeder_out_rdy ),
    .xbar_req_rdy     ( pe$011$xbar_req_rdy ),
    .xbar_resp_msg    ( pe$011$xbar_resp_msg ),
    .xbar_resp_val    ( pe$011$xbar_resp_val ),
    .y_unloader_rdy   ( pe$011$y_unloader_rdy ),
    .blkdone_sig_rdy  ( pe$011$blkdone_sig_rdy ),
    .blkdone_ack_msg  ( pe$011$blkdone_ack_msg ),
    .blkdone_ack_val  ( pe$011$blkdone_ack_val ),
    .pe_id_rdy        ( pe$011$pe_id_rdy ),
    .cm_rdy           ( pe$011$cm_rdy ),
    .a_feeder_in_rdy  ( pe$011$a_feeder_in_rdy ),
    .a_feeder_out_msg ( pe$011$a_feeder_out_msg ),
    .a_feeder_out_val ( pe$011$a_feeder_out_val ),
    .xbar_req_msg     ( pe$011$xbar_req_msg ),
    .xbar_req_val     ( pe$011$xbar_req_val ),
    .xbar_resp_rdy    ( pe$011$xbar_resp_rdy ),
    .y_unloader_msg   ( pe$011$y_unloader_msg ),
    .y_unloader_val   ( pe$011$y_unloader_val ),
    .blkdone_sig_msg  ( pe$011$blkdone_sig_msg ),
    .blkdone_sig_val  ( pe$011$blkdone_sig_val ),
    .blkdone_ack_rdy  ( pe$011$blkdone_ack_rdy )
  );

  // pe$012 temporaries
  wire   [   0:0] pe$012$clk;
  wire   [   0:0] pe$012$reset;
  wire   [  63:0] pe$012$pe_id_msg;
  wire   [   0:0] pe$012$pe_id_val;
  wire   [   0:0] pe$012$cm_msg;
  wire   [   0:0] pe$012$cm_val;
  wire   [  63:0] pe$012$a_feeder_in_msg;
  wire   [   0:0] pe$012$a_feeder_in_val;
  wire   [   0:0] pe$012$a_feeder_out_rdy;
  wire   [   0:0] pe$012$xbar_req_rdy;
  wire   [  63:0] pe$012$xbar_resp_msg;
  wire   [   0:0] pe$012$xbar_resp_val;
  wire   [   0:0] pe$012$y_unloader_rdy;
  wire   [   0:0] pe$012$blkdone_sig_rdy;
  wire   [  31:0] pe$012$blkdone_ack_msg;
  wire   [   0:0] pe$012$blkdone_ack_val;
  wire   [   0:0] pe$012$pe_id_rdy;
  wire   [   0:0] pe$012$cm_rdy;
  wire   [   0:0] pe$012$a_feeder_in_rdy;
  wire   [  63:0] pe$012$a_feeder_out_msg;
  wire   [   0:0] pe$012$a_feeder_out_val;
  wire   [  31:0] pe$012$xbar_req_msg;
  wire   [   0:0] pe$012$xbar_req_val;
  wire   [   0:0] pe$012$xbar_resp_rdy;
  wire   [ 127:0] pe$012$y_unloader_msg;
  wire   [   0:0] pe$012$y_unloader_val;
  wire   [  31:0] pe$012$blkdone_sig_msg;
  wire   [   0:0] pe$012$blkdone_sig_val;
  wire   [   0:0] pe$012$blkdone_ack_rdy;

  SDPERTL_wrapped_0x5a96c41063a827a4 pe$012
  (
    .clk              ( pe$012$clk ),
    .reset            ( pe$012$reset ),
    .pe_id_msg        ( pe$012$pe_id_msg ),
    .pe_id_val        ( pe$012$pe_id_val ),
    .cm_msg           ( pe$012$cm_msg ),
    .cm_val           ( pe$012$cm_val ),
    .a_feeder_in_msg  ( pe$012$a_feeder_in_msg ),
    .a_feeder_in_val  ( pe$012$a_feeder_in_val ),
    .a_feeder_out_rdy ( pe$012$a_feeder_out_rdy ),
    .xbar_req_rdy     ( pe$012$xbar_req_rdy ),
    .xbar_resp_msg    ( pe$012$xbar_resp_msg ),
    .xbar_resp_val    ( pe$012$xbar_resp_val ),
    .y_unloader_rdy   ( pe$012$y_unloader_rdy ),
    .blkdone_sig_rdy  ( pe$012$blkdone_sig_rdy ),
    .blkdone_ack_msg  ( pe$012$blkdone_ack_msg ),
    .blkdone_ack_val  ( pe$012$blkdone_ack_val ),
    .pe_id_rdy        ( pe$012$pe_id_rdy ),
    .cm_rdy           ( pe$012$cm_rdy ),
    .a_feeder_in_rdy  ( pe$012$a_feeder_in_rdy ),
    .a_feeder_out_msg ( pe$012$a_feeder_out_msg ),
    .a_feeder_out_val ( pe$012$a_feeder_out_val ),
    .xbar_req_msg     ( pe$012$xbar_req_msg ),
    .xbar_req_val     ( pe$012$xbar_req_val ),
    .xbar_resp_rdy    ( pe$012$xbar_resp_rdy ),
    .y_unloader_msg   ( pe$012$y_unloader_msg ),
    .y_unloader_val   ( pe$012$y_unloader_val ),
    .blkdone_sig_msg  ( pe$012$blkdone_sig_msg ),
    .blkdone_sig_val  ( pe$012$blkdone_sig_val ),
    .blkdone_ack_rdy  ( pe$012$blkdone_ack_rdy )
  );

  // pe$013 temporaries
  wire   [   0:0] pe$013$clk;
  wire   [   0:0] pe$013$reset;
  wire   [  63:0] pe$013$pe_id_msg;
  wire   [   0:0] pe$013$pe_id_val;
  wire   [   0:0] pe$013$cm_msg;
  wire   [   0:0] pe$013$cm_val;
  wire   [  63:0] pe$013$a_feeder_in_msg;
  wire   [   0:0] pe$013$a_feeder_in_val;
  wire   [   0:0] pe$013$a_feeder_out_rdy;
  wire   [   0:0] pe$013$xbar_req_rdy;
  wire   [  63:0] pe$013$xbar_resp_msg;
  wire   [   0:0] pe$013$xbar_resp_val;
  wire   [   0:0] pe$013$y_unloader_rdy;
  wire   [   0:0] pe$013$blkdone_sig_rdy;
  wire   [  31:0] pe$013$blkdone_ack_msg;
  wire   [   0:0] pe$013$blkdone_ack_val;
  wire   [   0:0] pe$013$pe_id_rdy;
  wire   [   0:0] pe$013$cm_rdy;
  wire   [   0:0] pe$013$a_feeder_in_rdy;
  wire   [  63:0] pe$013$a_feeder_out_msg;
  wire   [   0:0] pe$013$a_feeder_out_val;
  wire   [  31:0] pe$013$xbar_req_msg;
  wire   [   0:0] pe$013$xbar_req_val;
  wire   [   0:0] pe$013$xbar_resp_rdy;
  wire   [ 127:0] pe$013$y_unloader_msg;
  wire   [   0:0] pe$013$y_unloader_val;
  wire   [  31:0] pe$013$blkdone_sig_msg;
  wire   [   0:0] pe$013$blkdone_sig_val;
  wire   [   0:0] pe$013$blkdone_ack_rdy;

  SDPERTL_wrapped_0x5a96c41063a827a4 pe$013
  (
    .clk              ( pe$013$clk ),
    .reset            ( pe$013$reset ),
    .pe_id_msg        ( pe$013$pe_id_msg ),
    .pe_id_val        ( pe$013$pe_id_val ),
    .cm_msg           ( pe$013$cm_msg ),
    .cm_val           ( pe$013$cm_val ),
    .a_feeder_in_msg  ( pe$013$a_feeder_in_msg ),
    .a_feeder_in_val  ( pe$013$a_feeder_in_val ),
    .a_feeder_out_rdy ( pe$013$a_feeder_out_rdy ),
    .xbar_req_rdy     ( pe$013$xbar_req_rdy ),
    .xbar_resp_msg    ( pe$013$xbar_resp_msg ),
    .xbar_resp_val    ( pe$013$xbar_resp_val ),
    .y_unloader_rdy   ( pe$013$y_unloader_rdy ),
    .blkdone_sig_rdy  ( pe$013$blkdone_sig_rdy ),
    .blkdone_ack_msg  ( pe$013$blkdone_ack_msg ),
    .blkdone_ack_val  ( pe$013$blkdone_ack_val ),
    .pe_id_rdy        ( pe$013$pe_id_rdy ),
    .cm_rdy           ( pe$013$cm_rdy ),
    .a_feeder_in_rdy  ( pe$013$a_feeder_in_rdy ),
    .a_feeder_out_msg ( pe$013$a_feeder_out_msg ),
    .a_feeder_out_val ( pe$013$a_feeder_out_val ),
    .xbar_req_msg     ( pe$013$xbar_req_msg ),
    .xbar_req_val     ( pe$013$xbar_req_val ),
    .xbar_resp_rdy    ( pe$013$xbar_resp_rdy ),
    .y_unloader_msg   ( pe$013$y_unloader_msg ),
    .y_unloader_val   ( pe$013$y_unloader_val ),
    .blkdone_sig_msg  ( pe$013$blkdone_sig_msg ),
    .blkdone_sig_val  ( pe$013$blkdone_sig_val ),
    .blkdone_ack_rdy  ( pe$013$blkdone_ack_rdy )
  );

  // pe$014 temporaries
  wire   [   0:0] pe$014$clk;
  wire   [   0:0] pe$014$reset;
  wire   [  63:0] pe$014$pe_id_msg;
  wire   [   0:0] pe$014$pe_id_val;
  wire   [   0:0] pe$014$cm_msg;
  wire   [   0:0] pe$014$cm_val;
  wire   [  63:0] pe$014$a_feeder_in_msg;
  wire   [   0:0] pe$014$a_feeder_in_val;
  wire   [   0:0] pe$014$a_feeder_out_rdy;
  wire   [   0:0] pe$014$xbar_req_rdy;
  wire   [  63:0] pe$014$xbar_resp_msg;
  wire   [   0:0] pe$014$xbar_resp_val;
  wire   [   0:0] pe$014$y_unloader_rdy;
  wire   [   0:0] pe$014$blkdone_sig_rdy;
  wire   [  31:0] pe$014$blkdone_ack_msg;
  wire   [   0:0] pe$014$blkdone_ack_val;
  wire   [   0:0] pe$014$pe_id_rdy;
  wire   [   0:0] pe$014$cm_rdy;
  wire   [   0:0] pe$014$a_feeder_in_rdy;
  wire   [  63:0] pe$014$a_feeder_out_msg;
  wire   [   0:0] pe$014$a_feeder_out_val;
  wire   [  31:0] pe$014$xbar_req_msg;
  wire   [   0:0] pe$014$xbar_req_val;
  wire   [   0:0] pe$014$xbar_resp_rdy;
  wire   [ 127:0] pe$014$y_unloader_msg;
  wire   [   0:0] pe$014$y_unloader_val;
  wire   [  31:0] pe$014$blkdone_sig_msg;
  wire   [   0:0] pe$014$blkdone_sig_val;
  wire   [   0:0] pe$014$blkdone_ack_rdy;

  SDPERTL_wrapped_0x5a96c41063a827a4 pe$014
  (
    .clk              ( pe$014$clk ),
    .reset            ( pe$014$reset ),
    .pe_id_msg        ( pe$014$pe_id_msg ),
    .pe_id_val        ( pe$014$pe_id_val ),
    .cm_msg           ( pe$014$cm_msg ),
    .cm_val           ( pe$014$cm_val ),
    .a_feeder_in_msg  ( pe$014$a_feeder_in_msg ),
    .a_feeder_in_val  ( pe$014$a_feeder_in_val ),
    .a_feeder_out_rdy ( pe$014$a_feeder_out_rdy ),
    .xbar_req_rdy     ( pe$014$xbar_req_rdy ),
    .xbar_resp_msg    ( pe$014$xbar_resp_msg ),
    .xbar_resp_val    ( pe$014$xbar_resp_val ),
    .y_unloader_rdy   ( pe$014$y_unloader_rdy ),
    .blkdone_sig_rdy  ( pe$014$blkdone_sig_rdy ),
    .blkdone_ack_msg  ( pe$014$blkdone_ack_msg ),
    .blkdone_ack_val  ( pe$014$blkdone_ack_val ),
    .pe_id_rdy        ( pe$014$pe_id_rdy ),
    .cm_rdy           ( pe$014$cm_rdy ),
    .a_feeder_in_rdy  ( pe$014$a_feeder_in_rdy ),
    .a_feeder_out_msg ( pe$014$a_feeder_out_msg ),
    .a_feeder_out_val ( pe$014$a_feeder_out_val ),
    .xbar_req_msg     ( pe$014$xbar_req_msg ),
    .xbar_req_val     ( pe$014$xbar_req_val ),
    .xbar_resp_rdy    ( pe$014$xbar_resp_rdy ),
    .y_unloader_msg   ( pe$014$y_unloader_msg ),
    .y_unloader_val   ( pe$014$y_unloader_val ),
    .blkdone_sig_msg  ( pe$014$blkdone_sig_msg ),
    .blkdone_sig_val  ( pe$014$blkdone_sig_val ),
    .blkdone_ack_rdy  ( pe$014$blkdone_ack_rdy )
  );

  // pe$015 temporaries
  wire   [   0:0] pe$015$clk;
  wire   [   0:0] pe$015$reset;
  wire   [  63:0] pe$015$pe_id_msg;
  wire   [   0:0] pe$015$pe_id_val;
  wire   [   0:0] pe$015$cm_msg;
  wire   [   0:0] pe$015$cm_val;
  wire   [  63:0] pe$015$a_feeder_in_msg;
  wire   [   0:0] pe$015$a_feeder_in_val;
  wire   [   0:0] pe$015$a_feeder_out_rdy;
  wire   [   0:0] pe$015$xbar_req_rdy;
  wire   [  63:0] pe$015$xbar_resp_msg;
  wire   [   0:0] pe$015$xbar_resp_val;
  wire   [   0:0] pe$015$y_unloader_rdy;
  wire   [   0:0] pe$015$blkdone_sig_rdy;
  wire   [  31:0] pe$015$blkdone_ack_msg;
  wire   [   0:0] pe$015$blkdone_ack_val;
  wire   [   0:0] pe$015$pe_id_rdy;
  wire   [   0:0] pe$015$cm_rdy;
  wire   [   0:0] pe$015$a_feeder_in_rdy;
  wire   [  63:0] pe$015$a_feeder_out_msg;
  wire   [   0:0] pe$015$a_feeder_out_val;
  wire   [  31:0] pe$015$xbar_req_msg;
  wire   [   0:0] pe$015$xbar_req_val;
  wire   [   0:0] pe$015$xbar_resp_rdy;
  wire   [ 127:0] pe$015$y_unloader_msg;
  wire   [   0:0] pe$015$y_unloader_val;
  wire   [  31:0] pe$015$blkdone_sig_msg;
  wire   [   0:0] pe$015$blkdone_sig_val;
  wire   [   0:0] pe$015$blkdone_ack_rdy;

  SDPERTL_wrapped_0x5a96c41063a827a4 pe$015
  (
    .clk              ( pe$015$clk ),
    .reset            ( pe$015$reset ),
    .pe_id_msg        ( pe$015$pe_id_msg ),
    .pe_id_val        ( pe$015$pe_id_val ),
    .cm_msg           ( pe$015$cm_msg ),
    .cm_val           ( pe$015$cm_val ),
    .a_feeder_in_msg  ( pe$015$a_feeder_in_msg ),
    .a_feeder_in_val  ( pe$015$a_feeder_in_val ),
    .a_feeder_out_rdy ( pe$015$a_feeder_out_rdy ),
    .xbar_req_rdy     ( pe$015$xbar_req_rdy ),
    .xbar_resp_msg    ( pe$015$xbar_resp_msg ),
    .xbar_resp_val    ( pe$015$xbar_resp_val ),
    .y_unloader_rdy   ( pe$015$y_unloader_rdy ),
    .blkdone_sig_rdy  ( pe$015$blkdone_sig_rdy ),
    .blkdone_ack_msg  ( pe$015$blkdone_ack_msg ),
    .blkdone_ack_val  ( pe$015$blkdone_ack_val ),
    .pe_id_rdy        ( pe$015$pe_id_rdy ),
    .cm_rdy           ( pe$015$cm_rdy ),
    .a_feeder_in_rdy  ( pe$015$a_feeder_in_rdy ),
    .a_feeder_out_msg ( pe$015$a_feeder_out_msg ),
    .a_feeder_out_val ( pe$015$a_feeder_out_val ),
    .xbar_req_msg     ( pe$015$xbar_req_msg ),
    .xbar_req_val     ( pe$015$xbar_req_val ),
    .xbar_resp_rdy    ( pe$015$xbar_resp_rdy ),
    .y_unloader_msg   ( pe$015$y_unloader_msg ),
    .y_unloader_val   ( pe$015$y_unloader_val ),
    .blkdone_sig_msg  ( pe$015$blkdone_sig_msg ),
    .blkdone_sig_val  ( pe$015$blkdone_sig_val ),
    .blkdone_ack_rdy  ( pe$015$blkdone_ack_rdy )
  );

  // pe$016 temporaries
  wire   [   0:0] pe$016$clk;
  wire   [   0:0] pe$016$reset;
  wire   [  63:0] pe$016$pe_id_msg;
  wire   [   0:0] pe$016$pe_id_val;
  wire   [   0:0] pe$016$cm_msg;
  wire   [   0:0] pe$016$cm_val;
  wire   [  63:0] pe$016$a_feeder_in_msg;
  wire   [   0:0] pe$016$a_feeder_in_val;
  wire   [   0:0] pe$016$a_feeder_out_rdy;
  wire   [   0:0] pe$016$xbar_req_rdy;
  wire   [  63:0] pe$016$xbar_resp_msg;
  wire   [   0:0] pe$016$xbar_resp_val;
  wire   [   0:0] pe$016$y_unloader_rdy;
  wire   [   0:0] pe$016$blkdone_sig_rdy;
  wire   [  31:0] pe$016$blkdone_ack_msg;
  wire   [   0:0] pe$016$blkdone_ack_val;
  wire   [   0:0] pe$016$pe_id_rdy;
  wire   [   0:0] pe$016$cm_rdy;
  wire   [   0:0] pe$016$a_feeder_in_rdy;
  wire   [  63:0] pe$016$a_feeder_out_msg;
  wire   [   0:0] pe$016$a_feeder_out_val;
  wire   [  31:0] pe$016$xbar_req_msg;
  wire   [   0:0] pe$016$xbar_req_val;
  wire   [   0:0] pe$016$xbar_resp_rdy;
  wire   [ 127:0] pe$016$y_unloader_msg;
  wire   [   0:0] pe$016$y_unloader_val;
  wire   [  31:0] pe$016$blkdone_sig_msg;
  wire   [   0:0] pe$016$blkdone_sig_val;
  wire   [   0:0] pe$016$blkdone_ack_rdy;

  SDPERTL_wrapped_0x5a96c41063a827a4 pe$016
  (
    .clk              ( pe$016$clk ),
    .reset            ( pe$016$reset ),
    .pe_id_msg        ( pe$016$pe_id_msg ),
    .pe_id_val        ( pe$016$pe_id_val ),
    .cm_msg           ( pe$016$cm_msg ),
    .cm_val           ( pe$016$cm_val ),
    .a_feeder_in_msg  ( pe$016$a_feeder_in_msg ),
    .a_feeder_in_val  ( pe$016$a_feeder_in_val ),
    .a_feeder_out_rdy ( pe$016$a_feeder_out_rdy ),
    .xbar_req_rdy     ( pe$016$xbar_req_rdy ),
    .xbar_resp_msg    ( pe$016$xbar_resp_msg ),
    .xbar_resp_val    ( pe$016$xbar_resp_val ),
    .y_unloader_rdy   ( pe$016$y_unloader_rdy ),
    .blkdone_sig_rdy  ( pe$016$blkdone_sig_rdy ),
    .blkdone_ack_msg  ( pe$016$blkdone_ack_msg ),
    .blkdone_ack_val  ( pe$016$blkdone_ack_val ),
    .pe_id_rdy        ( pe$016$pe_id_rdy ),
    .cm_rdy           ( pe$016$cm_rdy ),
    .a_feeder_in_rdy  ( pe$016$a_feeder_in_rdy ),
    .a_feeder_out_msg ( pe$016$a_feeder_out_msg ),
    .a_feeder_out_val ( pe$016$a_feeder_out_val ),
    .xbar_req_msg     ( pe$016$xbar_req_msg ),
    .xbar_req_val     ( pe$016$xbar_req_val ),
    .xbar_resp_rdy    ( pe$016$xbar_resp_rdy ),
    .y_unloader_msg   ( pe$016$y_unloader_msg ),
    .y_unloader_val   ( pe$016$y_unloader_val ),
    .blkdone_sig_msg  ( pe$016$blkdone_sig_msg ),
    .blkdone_sig_val  ( pe$016$blkdone_sig_val ),
    .blkdone_ack_rdy  ( pe$016$blkdone_ack_rdy )
  );

  // pe$017 temporaries
  wire   [   0:0] pe$017$clk;
  wire   [   0:0] pe$017$reset;
  wire   [  63:0] pe$017$pe_id_msg;
  wire   [   0:0] pe$017$pe_id_val;
  wire   [   0:0] pe$017$cm_msg;
  wire   [   0:0] pe$017$cm_val;
  wire   [  63:0] pe$017$a_feeder_in_msg;
  wire   [   0:0] pe$017$a_feeder_in_val;
  wire   [   0:0] pe$017$a_feeder_out_rdy;
  wire   [   0:0] pe$017$xbar_req_rdy;
  wire   [  63:0] pe$017$xbar_resp_msg;
  wire   [   0:0] pe$017$xbar_resp_val;
  wire   [   0:0] pe$017$y_unloader_rdy;
  wire   [   0:0] pe$017$blkdone_sig_rdy;
  wire   [  31:0] pe$017$blkdone_ack_msg;
  wire   [   0:0] pe$017$blkdone_ack_val;
  wire   [   0:0] pe$017$pe_id_rdy;
  wire   [   0:0] pe$017$cm_rdy;
  wire   [   0:0] pe$017$a_feeder_in_rdy;
  wire   [  63:0] pe$017$a_feeder_out_msg;
  wire   [   0:0] pe$017$a_feeder_out_val;
  wire   [  31:0] pe$017$xbar_req_msg;
  wire   [   0:0] pe$017$xbar_req_val;
  wire   [   0:0] pe$017$xbar_resp_rdy;
  wire   [ 127:0] pe$017$y_unloader_msg;
  wire   [   0:0] pe$017$y_unloader_val;
  wire   [  31:0] pe$017$blkdone_sig_msg;
  wire   [   0:0] pe$017$blkdone_sig_val;
  wire   [   0:0] pe$017$blkdone_ack_rdy;

  SDPERTL_wrapped_0x5a96c41063a827a4 pe$017
  (
    .clk              ( pe$017$clk ),
    .reset            ( pe$017$reset ),
    .pe_id_msg        ( pe$017$pe_id_msg ),
    .pe_id_val        ( pe$017$pe_id_val ),
    .cm_msg           ( pe$017$cm_msg ),
    .cm_val           ( pe$017$cm_val ),
    .a_feeder_in_msg  ( pe$017$a_feeder_in_msg ),
    .a_feeder_in_val  ( pe$017$a_feeder_in_val ),
    .a_feeder_out_rdy ( pe$017$a_feeder_out_rdy ),
    .xbar_req_rdy     ( pe$017$xbar_req_rdy ),
    .xbar_resp_msg    ( pe$017$xbar_resp_msg ),
    .xbar_resp_val    ( pe$017$xbar_resp_val ),
    .y_unloader_rdy   ( pe$017$y_unloader_rdy ),
    .blkdone_sig_rdy  ( pe$017$blkdone_sig_rdy ),
    .blkdone_ack_msg  ( pe$017$blkdone_ack_msg ),
    .blkdone_ack_val  ( pe$017$blkdone_ack_val ),
    .pe_id_rdy        ( pe$017$pe_id_rdy ),
    .cm_rdy           ( pe$017$cm_rdy ),
    .a_feeder_in_rdy  ( pe$017$a_feeder_in_rdy ),
    .a_feeder_out_msg ( pe$017$a_feeder_out_msg ),
    .a_feeder_out_val ( pe$017$a_feeder_out_val ),
    .xbar_req_msg     ( pe$017$xbar_req_msg ),
    .xbar_req_val     ( pe$017$xbar_req_val ),
    .xbar_resp_rdy    ( pe$017$xbar_resp_rdy ),
    .y_unloader_msg   ( pe$017$y_unloader_msg ),
    .y_unloader_val   ( pe$017$y_unloader_val ),
    .blkdone_sig_msg  ( pe$017$blkdone_sig_msg ),
    .blkdone_sig_val  ( pe$017$blkdone_sig_val ),
    .blkdone_ack_rdy  ( pe$017$blkdone_ack_rdy )
  );

  // pe$018 temporaries
  wire   [   0:0] pe$018$clk;
  wire   [   0:0] pe$018$reset;
  wire   [  63:0] pe$018$pe_id_msg;
  wire   [   0:0] pe$018$pe_id_val;
  wire   [   0:0] pe$018$cm_msg;
  wire   [   0:0] pe$018$cm_val;
  wire   [  63:0] pe$018$a_feeder_in_msg;
  wire   [   0:0] pe$018$a_feeder_in_val;
  wire   [   0:0] pe$018$a_feeder_out_rdy;
  wire   [   0:0] pe$018$xbar_req_rdy;
  wire   [  63:0] pe$018$xbar_resp_msg;
  wire   [   0:0] pe$018$xbar_resp_val;
  wire   [   0:0] pe$018$y_unloader_rdy;
  wire   [   0:0] pe$018$blkdone_sig_rdy;
  wire   [  31:0] pe$018$blkdone_ack_msg;
  wire   [   0:0] pe$018$blkdone_ack_val;
  wire   [   0:0] pe$018$pe_id_rdy;
  wire   [   0:0] pe$018$cm_rdy;
  wire   [   0:0] pe$018$a_feeder_in_rdy;
  wire   [  63:0] pe$018$a_feeder_out_msg;
  wire   [   0:0] pe$018$a_feeder_out_val;
  wire   [  31:0] pe$018$xbar_req_msg;
  wire   [   0:0] pe$018$xbar_req_val;
  wire   [   0:0] pe$018$xbar_resp_rdy;
  wire   [ 127:0] pe$018$y_unloader_msg;
  wire   [   0:0] pe$018$y_unloader_val;
  wire   [  31:0] pe$018$blkdone_sig_msg;
  wire   [   0:0] pe$018$blkdone_sig_val;
  wire   [   0:0] pe$018$blkdone_ack_rdy;

  SDPERTL_wrapped_0x5a96c41063a827a4 pe$018
  (
    .clk              ( pe$018$clk ),
    .reset            ( pe$018$reset ),
    .pe_id_msg        ( pe$018$pe_id_msg ),
    .pe_id_val        ( pe$018$pe_id_val ),
    .cm_msg           ( pe$018$cm_msg ),
    .cm_val           ( pe$018$cm_val ),
    .a_feeder_in_msg  ( pe$018$a_feeder_in_msg ),
    .a_feeder_in_val  ( pe$018$a_feeder_in_val ),
    .a_feeder_out_rdy ( pe$018$a_feeder_out_rdy ),
    .xbar_req_rdy     ( pe$018$xbar_req_rdy ),
    .xbar_resp_msg    ( pe$018$xbar_resp_msg ),
    .xbar_resp_val    ( pe$018$xbar_resp_val ),
    .y_unloader_rdy   ( pe$018$y_unloader_rdy ),
    .blkdone_sig_rdy  ( pe$018$blkdone_sig_rdy ),
    .blkdone_ack_msg  ( pe$018$blkdone_ack_msg ),
    .blkdone_ack_val  ( pe$018$blkdone_ack_val ),
    .pe_id_rdy        ( pe$018$pe_id_rdy ),
    .cm_rdy           ( pe$018$cm_rdy ),
    .a_feeder_in_rdy  ( pe$018$a_feeder_in_rdy ),
    .a_feeder_out_msg ( pe$018$a_feeder_out_msg ),
    .a_feeder_out_val ( pe$018$a_feeder_out_val ),
    .xbar_req_msg     ( pe$018$xbar_req_msg ),
    .xbar_req_val     ( pe$018$xbar_req_val ),
    .xbar_resp_rdy    ( pe$018$xbar_resp_rdy ),
    .y_unloader_msg   ( pe$018$y_unloader_msg ),
    .y_unloader_val   ( pe$018$y_unloader_val ),
    .blkdone_sig_msg  ( pe$018$blkdone_sig_msg ),
    .blkdone_sig_val  ( pe$018$blkdone_sig_val ),
    .blkdone_ack_rdy  ( pe$018$blkdone_ack_rdy )
  );

  // pe$019 temporaries
  wire   [   0:0] pe$019$clk;
  wire   [   0:0] pe$019$reset;
  wire   [  63:0] pe$019$pe_id_msg;
  wire   [   0:0] pe$019$pe_id_val;
  wire   [   0:0] pe$019$cm_msg;
  wire   [   0:0] pe$019$cm_val;
  wire   [  63:0] pe$019$a_feeder_in_msg;
  wire   [   0:0] pe$019$a_feeder_in_val;
  wire   [   0:0] pe$019$a_feeder_out_rdy;
  wire   [   0:0] pe$019$xbar_req_rdy;
  wire   [  63:0] pe$019$xbar_resp_msg;
  wire   [   0:0] pe$019$xbar_resp_val;
  wire   [   0:0] pe$019$y_unloader_rdy;
  wire   [   0:0] pe$019$blkdone_sig_rdy;
  wire   [  31:0] pe$019$blkdone_ack_msg;
  wire   [   0:0] pe$019$blkdone_ack_val;
  wire   [   0:0] pe$019$pe_id_rdy;
  wire   [   0:0] pe$019$cm_rdy;
  wire   [   0:0] pe$019$a_feeder_in_rdy;
  wire   [  63:0] pe$019$a_feeder_out_msg;
  wire   [   0:0] pe$019$a_feeder_out_val;
  wire   [  31:0] pe$019$xbar_req_msg;
  wire   [   0:0] pe$019$xbar_req_val;
  wire   [   0:0] pe$019$xbar_resp_rdy;
  wire   [ 127:0] pe$019$y_unloader_msg;
  wire   [   0:0] pe$019$y_unloader_val;
  wire   [  31:0] pe$019$blkdone_sig_msg;
  wire   [   0:0] pe$019$blkdone_sig_val;
  wire   [   0:0] pe$019$blkdone_ack_rdy;

  SDPERTL_wrapped_0x5a96c41063a827a4 pe$019
  (
    .clk              ( pe$019$clk ),
    .reset            ( pe$019$reset ),
    .pe_id_msg        ( pe$019$pe_id_msg ),
    .pe_id_val        ( pe$019$pe_id_val ),
    .cm_msg           ( pe$019$cm_msg ),
    .cm_val           ( pe$019$cm_val ),
    .a_feeder_in_msg  ( pe$019$a_feeder_in_msg ),
    .a_feeder_in_val  ( pe$019$a_feeder_in_val ),
    .a_feeder_out_rdy ( pe$019$a_feeder_out_rdy ),
    .xbar_req_rdy     ( pe$019$xbar_req_rdy ),
    .xbar_resp_msg    ( pe$019$xbar_resp_msg ),
    .xbar_resp_val    ( pe$019$xbar_resp_val ),
    .y_unloader_rdy   ( pe$019$y_unloader_rdy ),
    .blkdone_sig_rdy  ( pe$019$blkdone_sig_rdy ),
    .blkdone_ack_msg  ( pe$019$blkdone_ack_msg ),
    .blkdone_ack_val  ( pe$019$blkdone_ack_val ),
    .pe_id_rdy        ( pe$019$pe_id_rdy ),
    .cm_rdy           ( pe$019$cm_rdy ),
    .a_feeder_in_rdy  ( pe$019$a_feeder_in_rdy ),
    .a_feeder_out_msg ( pe$019$a_feeder_out_msg ),
    .a_feeder_out_val ( pe$019$a_feeder_out_val ),
    .xbar_req_msg     ( pe$019$xbar_req_msg ),
    .xbar_req_val     ( pe$019$xbar_req_val ),
    .xbar_resp_rdy    ( pe$019$xbar_resp_rdy ),
    .y_unloader_msg   ( pe$019$y_unloader_msg ),
    .y_unloader_val   ( pe$019$y_unloader_val ),
    .blkdone_sig_msg  ( pe$019$blkdone_sig_msg ),
    .blkdone_sig_val  ( pe$019$blkdone_sig_val ),
    .blkdone_ack_rdy  ( pe$019$blkdone_ack_rdy )
  );

  // pe$020 temporaries
  wire   [   0:0] pe$020$clk;
  wire   [   0:0] pe$020$reset;
  wire   [  63:0] pe$020$pe_id_msg;
  wire   [   0:0] pe$020$pe_id_val;
  wire   [   0:0] pe$020$cm_msg;
  wire   [   0:0] pe$020$cm_val;
  wire   [  63:0] pe$020$a_feeder_in_msg;
  wire   [   0:0] pe$020$a_feeder_in_val;
  wire   [   0:0] pe$020$a_feeder_out_rdy;
  wire   [   0:0] pe$020$xbar_req_rdy;
  wire   [  63:0] pe$020$xbar_resp_msg;
  wire   [   0:0] pe$020$xbar_resp_val;
  wire   [   0:0] pe$020$y_unloader_rdy;
  wire   [   0:0] pe$020$blkdone_sig_rdy;
  wire   [  31:0] pe$020$blkdone_ack_msg;
  wire   [   0:0] pe$020$blkdone_ack_val;
  wire   [   0:0] pe$020$pe_id_rdy;
  wire   [   0:0] pe$020$cm_rdy;
  wire   [   0:0] pe$020$a_feeder_in_rdy;
  wire   [  63:0] pe$020$a_feeder_out_msg;
  wire   [   0:0] pe$020$a_feeder_out_val;
  wire   [  31:0] pe$020$xbar_req_msg;
  wire   [   0:0] pe$020$xbar_req_val;
  wire   [   0:0] pe$020$xbar_resp_rdy;
  wire   [ 127:0] pe$020$y_unloader_msg;
  wire   [   0:0] pe$020$y_unloader_val;
  wire   [  31:0] pe$020$blkdone_sig_msg;
  wire   [   0:0] pe$020$blkdone_sig_val;
  wire   [   0:0] pe$020$blkdone_ack_rdy;

  SDPERTL_wrapped_0x5a96c41063a827a4 pe$020
  (
    .clk              ( pe$020$clk ),
    .reset            ( pe$020$reset ),
    .pe_id_msg        ( pe$020$pe_id_msg ),
    .pe_id_val        ( pe$020$pe_id_val ),
    .cm_msg           ( pe$020$cm_msg ),
    .cm_val           ( pe$020$cm_val ),
    .a_feeder_in_msg  ( pe$020$a_feeder_in_msg ),
    .a_feeder_in_val  ( pe$020$a_feeder_in_val ),
    .a_feeder_out_rdy ( pe$020$a_feeder_out_rdy ),
    .xbar_req_rdy     ( pe$020$xbar_req_rdy ),
    .xbar_resp_msg    ( pe$020$xbar_resp_msg ),
    .xbar_resp_val    ( pe$020$xbar_resp_val ),
    .y_unloader_rdy   ( pe$020$y_unloader_rdy ),
    .blkdone_sig_rdy  ( pe$020$blkdone_sig_rdy ),
    .blkdone_ack_msg  ( pe$020$blkdone_ack_msg ),
    .blkdone_ack_val  ( pe$020$blkdone_ack_val ),
    .pe_id_rdy        ( pe$020$pe_id_rdy ),
    .cm_rdy           ( pe$020$cm_rdy ),
    .a_feeder_in_rdy  ( pe$020$a_feeder_in_rdy ),
    .a_feeder_out_msg ( pe$020$a_feeder_out_msg ),
    .a_feeder_out_val ( pe$020$a_feeder_out_val ),
    .xbar_req_msg     ( pe$020$xbar_req_msg ),
    .xbar_req_val     ( pe$020$xbar_req_val ),
    .xbar_resp_rdy    ( pe$020$xbar_resp_rdy ),
    .y_unloader_msg   ( pe$020$y_unloader_msg ),
    .y_unloader_val   ( pe$020$y_unloader_val ),
    .blkdone_sig_msg  ( pe$020$blkdone_sig_msg ),
    .blkdone_sig_val  ( pe$020$blkdone_sig_val ),
    .blkdone_ack_rdy  ( pe$020$blkdone_ack_rdy )
  );

  // pe$021 temporaries
  wire   [   0:0] pe$021$clk;
  wire   [   0:0] pe$021$reset;
  wire   [  63:0] pe$021$pe_id_msg;
  wire   [   0:0] pe$021$pe_id_val;
  wire   [   0:0] pe$021$cm_msg;
  wire   [   0:0] pe$021$cm_val;
  wire   [  63:0] pe$021$a_feeder_in_msg;
  wire   [   0:0] pe$021$a_feeder_in_val;
  wire   [   0:0] pe$021$a_feeder_out_rdy;
  wire   [   0:0] pe$021$xbar_req_rdy;
  wire   [  63:0] pe$021$xbar_resp_msg;
  wire   [   0:0] pe$021$xbar_resp_val;
  wire   [   0:0] pe$021$y_unloader_rdy;
  wire   [   0:0] pe$021$blkdone_sig_rdy;
  wire   [  31:0] pe$021$blkdone_ack_msg;
  wire   [   0:0] pe$021$blkdone_ack_val;
  wire   [   0:0] pe$021$pe_id_rdy;
  wire   [   0:0] pe$021$cm_rdy;
  wire   [   0:0] pe$021$a_feeder_in_rdy;
  wire   [  63:0] pe$021$a_feeder_out_msg;
  wire   [   0:0] pe$021$a_feeder_out_val;
  wire   [  31:0] pe$021$xbar_req_msg;
  wire   [   0:0] pe$021$xbar_req_val;
  wire   [   0:0] pe$021$xbar_resp_rdy;
  wire   [ 127:0] pe$021$y_unloader_msg;
  wire   [   0:0] pe$021$y_unloader_val;
  wire   [  31:0] pe$021$blkdone_sig_msg;
  wire   [   0:0] pe$021$blkdone_sig_val;
  wire   [   0:0] pe$021$blkdone_ack_rdy;

  SDPERTL_wrapped_0x5a96c41063a827a4 pe$021
  (
    .clk              ( pe$021$clk ),
    .reset            ( pe$021$reset ),
    .pe_id_msg        ( pe$021$pe_id_msg ),
    .pe_id_val        ( pe$021$pe_id_val ),
    .cm_msg           ( pe$021$cm_msg ),
    .cm_val           ( pe$021$cm_val ),
    .a_feeder_in_msg  ( pe$021$a_feeder_in_msg ),
    .a_feeder_in_val  ( pe$021$a_feeder_in_val ),
    .a_feeder_out_rdy ( pe$021$a_feeder_out_rdy ),
    .xbar_req_rdy     ( pe$021$xbar_req_rdy ),
    .xbar_resp_msg    ( pe$021$xbar_resp_msg ),
    .xbar_resp_val    ( pe$021$xbar_resp_val ),
    .y_unloader_rdy   ( pe$021$y_unloader_rdy ),
    .blkdone_sig_rdy  ( pe$021$blkdone_sig_rdy ),
    .blkdone_ack_msg  ( pe$021$blkdone_ack_msg ),
    .blkdone_ack_val  ( pe$021$blkdone_ack_val ),
    .pe_id_rdy        ( pe$021$pe_id_rdy ),
    .cm_rdy           ( pe$021$cm_rdy ),
    .a_feeder_in_rdy  ( pe$021$a_feeder_in_rdy ),
    .a_feeder_out_msg ( pe$021$a_feeder_out_msg ),
    .a_feeder_out_val ( pe$021$a_feeder_out_val ),
    .xbar_req_msg     ( pe$021$xbar_req_msg ),
    .xbar_req_val     ( pe$021$xbar_req_val ),
    .xbar_resp_rdy    ( pe$021$xbar_resp_rdy ),
    .y_unloader_msg   ( pe$021$y_unloader_msg ),
    .y_unloader_val   ( pe$021$y_unloader_val ),
    .blkdone_sig_msg  ( pe$021$blkdone_sig_msg ),
    .blkdone_sig_val  ( pe$021$blkdone_sig_val ),
    .blkdone_ack_rdy  ( pe$021$blkdone_ack_rdy )
  );

  // pe$022 temporaries
  wire   [   0:0] pe$022$clk;
  wire   [   0:0] pe$022$reset;
  wire   [  63:0] pe$022$pe_id_msg;
  wire   [   0:0] pe$022$pe_id_val;
  wire   [   0:0] pe$022$cm_msg;
  wire   [   0:0] pe$022$cm_val;
  wire   [  63:0] pe$022$a_feeder_in_msg;
  wire   [   0:0] pe$022$a_feeder_in_val;
  wire   [   0:0] pe$022$a_feeder_out_rdy;
  wire   [   0:0] pe$022$xbar_req_rdy;
  wire   [  63:0] pe$022$xbar_resp_msg;
  wire   [   0:0] pe$022$xbar_resp_val;
  wire   [   0:0] pe$022$y_unloader_rdy;
  wire   [   0:0] pe$022$blkdone_sig_rdy;
  wire   [  31:0] pe$022$blkdone_ack_msg;
  wire   [   0:0] pe$022$blkdone_ack_val;
  wire   [   0:0] pe$022$pe_id_rdy;
  wire   [   0:0] pe$022$cm_rdy;
  wire   [   0:0] pe$022$a_feeder_in_rdy;
  wire   [  63:0] pe$022$a_feeder_out_msg;
  wire   [   0:0] pe$022$a_feeder_out_val;
  wire   [  31:0] pe$022$xbar_req_msg;
  wire   [   0:0] pe$022$xbar_req_val;
  wire   [   0:0] pe$022$xbar_resp_rdy;
  wire   [ 127:0] pe$022$y_unloader_msg;
  wire   [   0:0] pe$022$y_unloader_val;
  wire   [  31:0] pe$022$blkdone_sig_msg;
  wire   [   0:0] pe$022$blkdone_sig_val;
  wire   [   0:0] pe$022$blkdone_ack_rdy;

  SDPERTL_wrapped_0x5a96c41063a827a4 pe$022
  (
    .clk              ( pe$022$clk ),
    .reset            ( pe$022$reset ),
    .pe_id_msg        ( pe$022$pe_id_msg ),
    .pe_id_val        ( pe$022$pe_id_val ),
    .cm_msg           ( pe$022$cm_msg ),
    .cm_val           ( pe$022$cm_val ),
    .a_feeder_in_msg  ( pe$022$a_feeder_in_msg ),
    .a_feeder_in_val  ( pe$022$a_feeder_in_val ),
    .a_feeder_out_rdy ( pe$022$a_feeder_out_rdy ),
    .xbar_req_rdy     ( pe$022$xbar_req_rdy ),
    .xbar_resp_msg    ( pe$022$xbar_resp_msg ),
    .xbar_resp_val    ( pe$022$xbar_resp_val ),
    .y_unloader_rdy   ( pe$022$y_unloader_rdy ),
    .blkdone_sig_rdy  ( pe$022$blkdone_sig_rdy ),
    .blkdone_ack_msg  ( pe$022$blkdone_ack_msg ),
    .blkdone_ack_val  ( pe$022$blkdone_ack_val ),
    .pe_id_rdy        ( pe$022$pe_id_rdy ),
    .cm_rdy           ( pe$022$cm_rdy ),
    .a_feeder_in_rdy  ( pe$022$a_feeder_in_rdy ),
    .a_feeder_out_msg ( pe$022$a_feeder_out_msg ),
    .a_feeder_out_val ( pe$022$a_feeder_out_val ),
    .xbar_req_msg     ( pe$022$xbar_req_msg ),
    .xbar_req_val     ( pe$022$xbar_req_val ),
    .xbar_resp_rdy    ( pe$022$xbar_resp_rdy ),
    .y_unloader_msg   ( pe$022$y_unloader_msg ),
    .y_unloader_val   ( pe$022$y_unloader_val ),
    .blkdone_sig_msg  ( pe$022$blkdone_sig_msg ),
    .blkdone_sig_val  ( pe$022$blkdone_sig_val ),
    .blkdone_ack_rdy  ( pe$022$blkdone_ack_rdy )
  );

  // pe$023 temporaries
  wire   [   0:0] pe$023$clk;
  wire   [   0:0] pe$023$reset;
  wire   [  63:0] pe$023$pe_id_msg;
  wire   [   0:0] pe$023$pe_id_val;
  wire   [   0:0] pe$023$cm_msg;
  wire   [   0:0] pe$023$cm_val;
  wire   [  63:0] pe$023$a_feeder_in_msg;
  wire   [   0:0] pe$023$a_feeder_in_val;
  wire   [   0:0] pe$023$a_feeder_out_rdy;
  wire   [   0:0] pe$023$xbar_req_rdy;
  wire   [  63:0] pe$023$xbar_resp_msg;
  wire   [   0:0] pe$023$xbar_resp_val;
  wire   [   0:0] pe$023$y_unloader_rdy;
  wire   [   0:0] pe$023$blkdone_sig_rdy;
  wire   [  31:0] pe$023$blkdone_ack_msg;
  wire   [   0:0] pe$023$blkdone_ack_val;
  wire   [   0:0] pe$023$pe_id_rdy;
  wire   [   0:0] pe$023$cm_rdy;
  wire   [   0:0] pe$023$a_feeder_in_rdy;
  wire   [  63:0] pe$023$a_feeder_out_msg;
  wire   [   0:0] pe$023$a_feeder_out_val;
  wire   [  31:0] pe$023$xbar_req_msg;
  wire   [   0:0] pe$023$xbar_req_val;
  wire   [   0:0] pe$023$xbar_resp_rdy;
  wire   [ 127:0] pe$023$y_unloader_msg;
  wire   [   0:0] pe$023$y_unloader_val;
  wire   [  31:0] pe$023$blkdone_sig_msg;
  wire   [   0:0] pe$023$blkdone_sig_val;
  wire   [   0:0] pe$023$blkdone_ack_rdy;

  SDPERTL_wrapped_0x5a96c41063a827a4 pe$023
  (
    .clk              ( pe$023$clk ),
    .reset            ( pe$023$reset ),
    .pe_id_msg        ( pe$023$pe_id_msg ),
    .pe_id_val        ( pe$023$pe_id_val ),
    .cm_msg           ( pe$023$cm_msg ),
    .cm_val           ( pe$023$cm_val ),
    .a_feeder_in_msg  ( pe$023$a_feeder_in_msg ),
    .a_feeder_in_val  ( pe$023$a_feeder_in_val ),
    .a_feeder_out_rdy ( pe$023$a_feeder_out_rdy ),
    .xbar_req_rdy     ( pe$023$xbar_req_rdy ),
    .xbar_resp_msg    ( pe$023$xbar_resp_msg ),
    .xbar_resp_val    ( pe$023$xbar_resp_val ),
    .y_unloader_rdy   ( pe$023$y_unloader_rdy ),
    .blkdone_sig_rdy  ( pe$023$blkdone_sig_rdy ),
    .blkdone_ack_msg  ( pe$023$blkdone_ack_msg ),
    .blkdone_ack_val  ( pe$023$blkdone_ack_val ),
    .pe_id_rdy        ( pe$023$pe_id_rdy ),
    .cm_rdy           ( pe$023$cm_rdy ),
    .a_feeder_in_rdy  ( pe$023$a_feeder_in_rdy ),
    .a_feeder_out_msg ( pe$023$a_feeder_out_msg ),
    .a_feeder_out_val ( pe$023$a_feeder_out_val ),
    .xbar_req_msg     ( pe$023$xbar_req_msg ),
    .xbar_req_val     ( pe$023$xbar_req_val ),
    .xbar_resp_rdy    ( pe$023$xbar_resp_rdy ),
    .y_unloader_msg   ( pe$023$y_unloader_msg ),
    .y_unloader_val   ( pe$023$y_unloader_val ),
    .blkdone_sig_msg  ( pe$023$blkdone_sig_msg ),
    .blkdone_sig_val  ( pe$023$blkdone_sig_val ),
    .blkdone_ack_rdy  ( pe$023$blkdone_ack_rdy )
  );

  // pe$024 temporaries
  wire   [   0:0] pe$024$clk;
  wire   [   0:0] pe$024$reset;
  wire   [  63:0] pe$024$pe_id_msg;
  wire   [   0:0] pe$024$pe_id_val;
  wire   [   0:0] pe$024$cm_msg;
  wire   [   0:0] pe$024$cm_val;
  wire   [  63:0] pe$024$a_feeder_in_msg;
  wire   [   0:0] pe$024$a_feeder_in_val;
  wire   [   0:0] pe$024$a_feeder_out_rdy;
  wire   [   0:0] pe$024$xbar_req_rdy;
  wire   [  63:0] pe$024$xbar_resp_msg;
  wire   [   0:0] pe$024$xbar_resp_val;
  wire   [   0:0] pe$024$y_unloader_rdy;
  wire   [   0:0] pe$024$blkdone_sig_rdy;
  wire   [  31:0] pe$024$blkdone_ack_msg;
  wire   [   0:0] pe$024$blkdone_ack_val;
  wire   [   0:0] pe$024$pe_id_rdy;
  wire   [   0:0] pe$024$cm_rdy;
  wire   [   0:0] pe$024$a_feeder_in_rdy;
  wire   [  63:0] pe$024$a_feeder_out_msg;
  wire   [   0:0] pe$024$a_feeder_out_val;
  wire   [  31:0] pe$024$xbar_req_msg;
  wire   [   0:0] pe$024$xbar_req_val;
  wire   [   0:0] pe$024$xbar_resp_rdy;
  wire   [ 127:0] pe$024$y_unloader_msg;
  wire   [   0:0] pe$024$y_unloader_val;
  wire   [  31:0] pe$024$blkdone_sig_msg;
  wire   [   0:0] pe$024$blkdone_sig_val;
  wire   [   0:0] pe$024$blkdone_ack_rdy;

  SDPERTL_wrapped_0x5a96c41063a827a4 pe$024
  (
    .clk              ( pe$024$clk ),
    .reset            ( pe$024$reset ),
    .pe_id_msg        ( pe$024$pe_id_msg ),
    .pe_id_val        ( pe$024$pe_id_val ),
    .cm_msg           ( pe$024$cm_msg ),
    .cm_val           ( pe$024$cm_val ),
    .a_feeder_in_msg  ( pe$024$a_feeder_in_msg ),
    .a_feeder_in_val  ( pe$024$a_feeder_in_val ),
    .a_feeder_out_rdy ( pe$024$a_feeder_out_rdy ),
    .xbar_req_rdy     ( pe$024$xbar_req_rdy ),
    .xbar_resp_msg    ( pe$024$xbar_resp_msg ),
    .xbar_resp_val    ( pe$024$xbar_resp_val ),
    .y_unloader_rdy   ( pe$024$y_unloader_rdy ),
    .blkdone_sig_rdy  ( pe$024$blkdone_sig_rdy ),
    .blkdone_ack_msg  ( pe$024$blkdone_ack_msg ),
    .blkdone_ack_val  ( pe$024$blkdone_ack_val ),
    .pe_id_rdy        ( pe$024$pe_id_rdy ),
    .cm_rdy           ( pe$024$cm_rdy ),
    .a_feeder_in_rdy  ( pe$024$a_feeder_in_rdy ),
    .a_feeder_out_msg ( pe$024$a_feeder_out_msg ),
    .a_feeder_out_val ( pe$024$a_feeder_out_val ),
    .xbar_req_msg     ( pe$024$xbar_req_msg ),
    .xbar_req_val     ( pe$024$xbar_req_val ),
    .xbar_resp_rdy    ( pe$024$xbar_resp_rdy ),
    .y_unloader_msg   ( pe$024$y_unloader_msg ),
    .y_unloader_val   ( pe$024$y_unloader_val ),
    .blkdone_sig_msg  ( pe$024$blkdone_sig_msg ),
    .blkdone_sig_val  ( pe$024$blkdone_sig_val ),
    .blkdone_ack_rdy  ( pe$024$blkdone_ack_rdy )
  );

  // pe$025 temporaries
  wire   [   0:0] pe$025$clk;
  wire   [   0:0] pe$025$reset;
  wire   [  63:0] pe$025$pe_id_msg;
  wire   [   0:0] pe$025$pe_id_val;
  wire   [   0:0] pe$025$cm_msg;
  wire   [   0:0] pe$025$cm_val;
  wire   [  63:0] pe$025$a_feeder_in_msg;
  wire   [   0:0] pe$025$a_feeder_in_val;
  wire   [   0:0] pe$025$a_feeder_out_rdy;
  wire   [   0:0] pe$025$xbar_req_rdy;
  wire   [  63:0] pe$025$xbar_resp_msg;
  wire   [   0:0] pe$025$xbar_resp_val;
  wire   [   0:0] pe$025$y_unloader_rdy;
  wire   [   0:0] pe$025$blkdone_sig_rdy;
  wire   [  31:0] pe$025$blkdone_ack_msg;
  wire   [   0:0] pe$025$blkdone_ack_val;
  wire   [   0:0] pe$025$pe_id_rdy;
  wire   [   0:0] pe$025$cm_rdy;
  wire   [   0:0] pe$025$a_feeder_in_rdy;
  wire   [  63:0] pe$025$a_feeder_out_msg;
  wire   [   0:0] pe$025$a_feeder_out_val;
  wire   [  31:0] pe$025$xbar_req_msg;
  wire   [   0:0] pe$025$xbar_req_val;
  wire   [   0:0] pe$025$xbar_resp_rdy;
  wire   [ 127:0] pe$025$y_unloader_msg;
  wire   [   0:0] pe$025$y_unloader_val;
  wire   [  31:0] pe$025$blkdone_sig_msg;
  wire   [   0:0] pe$025$blkdone_sig_val;
  wire   [   0:0] pe$025$blkdone_ack_rdy;

  SDPERTL_wrapped_0x5a96c41063a827a4 pe$025
  (
    .clk              ( pe$025$clk ),
    .reset            ( pe$025$reset ),
    .pe_id_msg        ( pe$025$pe_id_msg ),
    .pe_id_val        ( pe$025$pe_id_val ),
    .cm_msg           ( pe$025$cm_msg ),
    .cm_val           ( pe$025$cm_val ),
    .a_feeder_in_msg  ( pe$025$a_feeder_in_msg ),
    .a_feeder_in_val  ( pe$025$a_feeder_in_val ),
    .a_feeder_out_rdy ( pe$025$a_feeder_out_rdy ),
    .xbar_req_rdy     ( pe$025$xbar_req_rdy ),
    .xbar_resp_msg    ( pe$025$xbar_resp_msg ),
    .xbar_resp_val    ( pe$025$xbar_resp_val ),
    .y_unloader_rdy   ( pe$025$y_unloader_rdy ),
    .blkdone_sig_rdy  ( pe$025$blkdone_sig_rdy ),
    .blkdone_ack_msg  ( pe$025$blkdone_ack_msg ),
    .blkdone_ack_val  ( pe$025$blkdone_ack_val ),
    .pe_id_rdy        ( pe$025$pe_id_rdy ),
    .cm_rdy           ( pe$025$cm_rdy ),
    .a_feeder_in_rdy  ( pe$025$a_feeder_in_rdy ),
    .a_feeder_out_msg ( pe$025$a_feeder_out_msg ),
    .a_feeder_out_val ( pe$025$a_feeder_out_val ),
    .xbar_req_msg     ( pe$025$xbar_req_msg ),
    .xbar_req_val     ( pe$025$xbar_req_val ),
    .xbar_resp_rdy    ( pe$025$xbar_resp_rdy ),
    .y_unloader_msg   ( pe$025$y_unloader_msg ),
    .y_unloader_val   ( pe$025$y_unloader_val ),
    .blkdone_sig_msg  ( pe$025$blkdone_sig_msg ),
    .blkdone_sig_val  ( pe$025$blkdone_sig_val ),
    .blkdone_ack_rdy  ( pe$025$blkdone_ack_rdy )
  );

  // pe$026 temporaries
  wire   [   0:0] pe$026$clk;
  wire   [   0:0] pe$026$reset;
  wire   [  63:0] pe$026$pe_id_msg;
  wire   [   0:0] pe$026$pe_id_val;
  wire   [   0:0] pe$026$cm_msg;
  wire   [   0:0] pe$026$cm_val;
  wire   [  63:0] pe$026$a_feeder_in_msg;
  wire   [   0:0] pe$026$a_feeder_in_val;
  wire   [   0:0] pe$026$a_feeder_out_rdy;
  wire   [   0:0] pe$026$xbar_req_rdy;
  wire   [  63:0] pe$026$xbar_resp_msg;
  wire   [   0:0] pe$026$xbar_resp_val;
  wire   [   0:0] pe$026$y_unloader_rdy;
  wire   [   0:0] pe$026$blkdone_sig_rdy;
  wire   [  31:0] pe$026$blkdone_ack_msg;
  wire   [   0:0] pe$026$blkdone_ack_val;
  wire   [   0:0] pe$026$pe_id_rdy;
  wire   [   0:0] pe$026$cm_rdy;
  wire   [   0:0] pe$026$a_feeder_in_rdy;
  wire   [  63:0] pe$026$a_feeder_out_msg;
  wire   [   0:0] pe$026$a_feeder_out_val;
  wire   [  31:0] pe$026$xbar_req_msg;
  wire   [   0:0] pe$026$xbar_req_val;
  wire   [   0:0] pe$026$xbar_resp_rdy;
  wire   [ 127:0] pe$026$y_unloader_msg;
  wire   [   0:0] pe$026$y_unloader_val;
  wire   [  31:0] pe$026$blkdone_sig_msg;
  wire   [   0:0] pe$026$blkdone_sig_val;
  wire   [   0:0] pe$026$blkdone_ack_rdy;

  SDPERTL_wrapped_0x5a96c41063a827a4 pe$026
  (
    .clk              ( pe$026$clk ),
    .reset            ( pe$026$reset ),
    .pe_id_msg        ( pe$026$pe_id_msg ),
    .pe_id_val        ( pe$026$pe_id_val ),
    .cm_msg           ( pe$026$cm_msg ),
    .cm_val           ( pe$026$cm_val ),
    .a_feeder_in_msg  ( pe$026$a_feeder_in_msg ),
    .a_feeder_in_val  ( pe$026$a_feeder_in_val ),
    .a_feeder_out_rdy ( pe$026$a_feeder_out_rdy ),
    .xbar_req_rdy     ( pe$026$xbar_req_rdy ),
    .xbar_resp_msg    ( pe$026$xbar_resp_msg ),
    .xbar_resp_val    ( pe$026$xbar_resp_val ),
    .y_unloader_rdy   ( pe$026$y_unloader_rdy ),
    .blkdone_sig_rdy  ( pe$026$blkdone_sig_rdy ),
    .blkdone_ack_msg  ( pe$026$blkdone_ack_msg ),
    .blkdone_ack_val  ( pe$026$blkdone_ack_val ),
    .pe_id_rdy        ( pe$026$pe_id_rdy ),
    .cm_rdy           ( pe$026$cm_rdy ),
    .a_feeder_in_rdy  ( pe$026$a_feeder_in_rdy ),
    .a_feeder_out_msg ( pe$026$a_feeder_out_msg ),
    .a_feeder_out_val ( pe$026$a_feeder_out_val ),
    .xbar_req_msg     ( pe$026$xbar_req_msg ),
    .xbar_req_val     ( pe$026$xbar_req_val ),
    .xbar_resp_rdy    ( pe$026$xbar_resp_rdy ),
    .y_unloader_msg   ( pe$026$y_unloader_msg ),
    .y_unloader_val   ( pe$026$y_unloader_val ),
    .blkdone_sig_msg  ( pe$026$blkdone_sig_msg ),
    .blkdone_sig_val  ( pe$026$blkdone_sig_val ),
    .blkdone_ack_rdy  ( pe$026$blkdone_ack_rdy )
  );

  // pe$027 temporaries
  wire   [   0:0] pe$027$clk;
  wire   [   0:0] pe$027$reset;
  wire   [  63:0] pe$027$pe_id_msg;
  wire   [   0:0] pe$027$pe_id_val;
  wire   [   0:0] pe$027$cm_msg;
  wire   [   0:0] pe$027$cm_val;
  wire   [  63:0] pe$027$a_feeder_in_msg;
  wire   [   0:0] pe$027$a_feeder_in_val;
  wire   [   0:0] pe$027$a_feeder_out_rdy;
  wire   [   0:0] pe$027$xbar_req_rdy;
  wire   [  63:0] pe$027$xbar_resp_msg;
  wire   [   0:0] pe$027$xbar_resp_val;
  wire   [   0:0] pe$027$y_unloader_rdy;
  wire   [   0:0] pe$027$blkdone_sig_rdy;
  wire   [  31:0] pe$027$blkdone_ack_msg;
  wire   [   0:0] pe$027$blkdone_ack_val;
  wire   [   0:0] pe$027$pe_id_rdy;
  wire   [   0:0] pe$027$cm_rdy;
  wire   [   0:0] pe$027$a_feeder_in_rdy;
  wire   [  63:0] pe$027$a_feeder_out_msg;
  wire   [   0:0] pe$027$a_feeder_out_val;
  wire   [  31:0] pe$027$xbar_req_msg;
  wire   [   0:0] pe$027$xbar_req_val;
  wire   [   0:0] pe$027$xbar_resp_rdy;
  wire   [ 127:0] pe$027$y_unloader_msg;
  wire   [   0:0] pe$027$y_unloader_val;
  wire   [  31:0] pe$027$blkdone_sig_msg;
  wire   [   0:0] pe$027$blkdone_sig_val;
  wire   [   0:0] pe$027$blkdone_ack_rdy;

  SDPERTL_wrapped_0x5a96c41063a827a4 pe$027
  (
    .clk              ( pe$027$clk ),
    .reset            ( pe$027$reset ),
    .pe_id_msg        ( pe$027$pe_id_msg ),
    .pe_id_val        ( pe$027$pe_id_val ),
    .cm_msg           ( pe$027$cm_msg ),
    .cm_val           ( pe$027$cm_val ),
    .a_feeder_in_msg  ( pe$027$a_feeder_in_msg ),
    .a_feeder_in_val  ( pe$027$a_feeder_in_val ),
    .a_feeder_out_rdy ( pe$027$a_feeder_out_rdy ),
    .xbar_req_rdy     ( pe$027$xbar_req_rdy ),
    .xbar_resp_msg    ( pe$027$xbar_resp_msg ),
    .xbar_resp_val    ( pe$027$xbar_resp_val ),
    .y_unloader_rdy   ( pe$027$y_unloader_rdy ),
    .blkdone_sig_rdy  ( pe$027$blkdone_sig_rdy ),
    .blkdone_ack_msg  ( pe$027$blkdone_ack_msg ),
    .blkdone_ack_val  ( pe$027$blkdone_ack_val ),
    .pe_id_rdy        ( pe$027$pe_id_rdy ),
    .cm_rdy           ( pe$027$cm_rdy ),
    .a_feeder_in_rdy  ( pe$027$a_feeder_in_rdy ),
    .a_feeder_out_msg ( pe$027$a_feeder_out_msg ),
    .a_feeder_out_val ( pe$027$a_feeder_out_val ),
    .xbar_req_msg     ( pe$027$xbar_req_msg ),
    .xbar_req_val     ( pe$027$xbar_req_val ),
    .xbar_resp_rdy    ( pe$027$xbar_resp_rdy ),
    .y_unloader_msg   ( pe$027$y_unloader_msg ),
    .y_unloader_val   ( pe$027$y_unloader_val ),
    .blkdone_sig_msg  ( pe$027$blkdone_sig_msg ),
    .blkdone_sig_val  ( pe$027$blkdone_sig_val ),
    .blkdone_ack_rdy  ( pe$027$blkdone_ack_rdy )
  );

  // pe$028 temporaries
  wire   [   0:0] pe$028$clk;
  wire   [   0:0] pe$028$reset;
  wire   [  63:0] pe$028$pe_id_msg;
  wire   [   0:0] pe$028$pe_id_val;
  wire   [   0:0] pe$028$cm_msg;
  wire   [   0:0] pe$028$cm_val;
  wire   [  63:0] pe$028$a_feeder_in_msg;
  wire   [   0:0] pe$028$a_feeder_in_val;
  wire   [   0:0] pe$028$a_feeder_out_rdy;
  wire   [   0:0] pe$028$xbar_req_rdy;
  wire   [  63:0] pe$028$xbar_resp_msg;
  wire   [   0:0] pe$028$xbar_resp_val;
  wire   [   0:0] pe$028$y_unloader_rdy;
  wire   [   0:0] pe$028$blkdone_sig_rdy;
  wire   [  31:0] pe$028$blkdone_ack_msg;
  wire   [   0:0] pe$028$blkdone_ack_val;
  wire   [   0:0] pe$028$pe_id_rdy;
  wire   [   0:0] pe$028$cm_rdy;
  wire   [   0:0] pe$028$a_feeder_in_rdy;
  wire   [  63:0] pe$028$a_feeder_out_msg;
  wire   [   0:0] pe$028$a_feeder_out_val;
  wire   [  31:0] pe$028$xbar_req_msg;
  wire   [   0:0] pe$028$xbar_req_val;
  wire   [   0:0] pe$028$xbar_resp_rdy;
  wire   [ 127:0] pe$028$y_unloader_msg;
  wire   [   0:0] pe$028$y_unloader_val;
  wire   [  31:0] pe$028$blkdone_sig_msg;
  wire   [   0:0] pe$028$blkdone_sig_val;
  wire   [   0:0] pe$028$blkdone_ack_rdy;

  SDPERTL_wrapped_0x5a96c41063a827a4 pe$028
  (
    .clk              ( pe$028$clk ),
    .reset            ( pe$028$reset ),
    .pe_id_msg        ( pe$028$pe_id_msg ),
    .pe_id_val        ( pe$028$pe_id_val ),
    .cm_msg           ( pe$028$cm_msg ),
    .cm_val           ( pe$028$cm_val ),
    .a_feeder_in_msg  ( pe$028$a_feeder_in_msg ),
    .a_feeder_in_val  ( pe$028$a_feeder_in_val ),
    .a_feeder_out_rdy ( pe$028$a_feeder_out_rdy ),
    .xbar_req_rdy     ( pe$028$xbar_req_rdy ),
    .xbar_resp_msg    ( pe$028$xbar_resp_msg ),
    .xbar_resp_val    ( pe$028$xbar_resp_val ),
    .y_unloader_rdy   ( pe$028$y_unloader_rdy ),
    .blkdone_sig_rdy  ( pe$028$blkdone_sig_rdy ),
    .blkdone_ack_msg  ( pe$028$blkdone_ack_msg ),
    .blkdone_ack_val  ( pe$028$blkdone_ack_val ),
    .pe_id_rdy        ( pe$028$pe_id_rdy ),
    .cm_rdy           ( pe$028$cm_rdy ),
    .a_feeder_in_rdy  ( pe$028$a_feeder_in_rdy ),
    .a_feeder_out_msg ( pe$028$a_feeder_out_msg ),
    .a_feeder_out_val ( pe$028$a_feeder_out_val ),
    .xbar_req_msg     ( pe$028$xbar_req_msg ),
    .xbar_req_val     ( pe$028$xbar_req_val ),
    .xbar_resp_rdy    ( pe$028$xbar_resp_rdy ),
    .y_unloader_msg   ( pe$028$y_unloader_msg ),
    .y_unloader_val   ( pe$028$y_unloader_val ),
    .blkdone_sig_msg  ( pe$028$blkdone_sig_msg ),
    .blkdone_sig_val  ( pe$028$blkdone_sig_val ),
    .blkdone_ack_rdy  ( pe$028$blkdone_ack_rdy )
  );

  // pe$029 temporaries
  wire   [   0:0] pe$029$clk;
  wire   [   0:0] pe$029$reset;
  wire   [  63:0] pe$029$pe_id_msg;
  wire   [   0:0] pe$029$pe_id_val;
  wire   [   0:0] pe$029$cm_msg;
  wire   [   0:0] pe$029$cm_val;
  wire   [  63:0] pe$029$a_feeder_in_msg;
  wire   [   0:0] pe$029$a_feeder_in_val;
  wire   [   0:0] pe$029$a_feeder_out_rdy;
  wire   [   0:0] pe$029$xbar_req_rdy;
  wire   [  63:0] pe$029$xbar_resp_msg;
  wire   [   0:0] pe$029$xbar_resp_val;
  wire   [   0:0] pe$029$y_unloader_rdy;
  wire   [   0:0] pe$029$blkdone_sig_rdy;
  wire   [  31:0] pe$029$blkdone_ack_msg;
  wire   [   0:0] pe$029$blkdone_ack_val;
  wire   [   0:0] pe$029$pe_id_rdy;
  wire   [   0:0] pe$029$cm_rdy;
  wire   [   0:0] pe$029$a_feeder_in_rdy;
  wire   [  63:0] pe$029$a_feeder_out_msg;
  wire   [   0:0] pe$029$a_feeder_out_val;
  wire   [  31:0] pe$029$xbar_req_msg;
  wire   [   0:0] pe$029$xbar_req_val;
  wire   [   0:0] pe$029$xbar_resp_rdy;
  wire   [ 127:0] pe$029$y_unloader_msg;
  wire   [   0:0] pe$029$y_unloader_val;
  wire   [  31:0] pe$029$blkdone_sig_msg;
  wire   [   0:0] pe$029$blkdone_sig_val;
  wire   [   0:0] pe$029$blkdone_ack_rdy;

  SDPERTL_wrapped_0x5a96c41063a827a4 pe$029
  (
    .clk              ( pe$029$clk ),
    .reset            ( pe$029$reset ),
    .pe_id_msg        ( pe$029$pe_id_msg ),
    .pe_id_val        ( pe$029$pe_id_val ),
    .cm_msg           ( pe$029$cm_msg ),
    .cm_val           ( pe$029$cm_val ),
    .a_feeder_in_msg  ( pe$029$a_feeder_in_msg ),
    .a_feeder_in_val  ( pe$029$a_feeder_in_val ),
    .a_feeder_out_rdy ( pe$029$a_feeder_out_rdy ),
    .xbar_req_rdy     ( pe$029$xbar_req_rdy ),
    .xbar_resp_msg    ( pe$029$xbar_resp_msg ),
    .xbar_resp_val    ( pe$029$xbar_resp_val ),
    .y_unloader_rdy   ( pe$029$y_unloader_rdy ),
    .blkdone_sig_rdy  ( pe$029$blkdone_sig_rdy ),
    .blkdone_ack_msg  ( pe$029$blkdone_ack_msg ),
    .blkdone_ack_val  ( pe$029$blkdone_ack_val ),
    .pe_id_rdy        ( pe$029$pe_id_rdy ),
    .cm_rdy           ( pe$029$cm_rdy ),
    .a_feeder_in_rdy  ( pe$029$a_feeder_in_rdy ),
    .a_feeder_out_msg ( pe$029$a_feeder_out_msg ),
    .a_feeder_out_val ( pe$029$a_feeder_out_val ),
    .xbar_req_msg     ( pe$029$xbar_req_msg ),
    .xbar_req_val     ( pe$029$xbar_req_val ),
    .xbar_resp_rdy    ( pe$029$xbar_resp_rdy ),
    .y_unloader_msg   ( pe$029$y_unloader_msg ),
    .y_unloader_val   ( pe$029$y_unloader_val ),
    .blkdone_sig_msg  ( pe$029$blkdone_sig_msg ),
    .blkdone_sig_val  ( pe$029$blkdone_sig_val ),
    .blkdone_ack_rdy  ( pe$029$blkdone_ack_rdy )
  );

  // pe$030 temporaries
  wire   [   0:0] pe$030$clk;
  wire   [   0:0] pe$030$reset;
  wire   [  63:0] pe$030$pe_id_msg;
  wire   [   0:0] pe$030$pe_id_val;
  wire   [   0:0] pe$030$cm_msg;
  wire   [   0:0] pe$030$cm_val;
  wire   [  63:0] pe$030$a_feeder_in_msg;
  wire   [   0:0] pe$030$a_feeder_in_val;
  wire   [   0:0] pe$030$a_feeder_out_rdy;
  wire   [   0:0] pe$030$xbar_req_rdy;
  wire   [  63:0] pe$030$xbar_resp_msg;
  wire   [   0:0] pe$030$xbar_resp_val;
  wire   [   0:0] pe$030$y_unloader_rdy;
  wire   [   0:0] pe$030$blkdone_sig_rdy;
  wire   [  31:0] pe$030$blkdone_ack_msg;
  wire   [   0:0] pe$030$blkdone_ack_val;
  wire   [   0:0] pe$030$pe_id_rdy;
  wire   [   0:0] pe$030$cm_rdy;
  wire   [   0:0] pe$030$a_feeder_in_rdy;
  wire   [  63:0] pe$030$a_feeder_out_msg;
  wire   [   0:0] pe$030$a_feeder_out_val;
  wire   [  31:0] pe$030$xbar_req_msg;
  wire   [   0:0] pe$030$xbar_req_val;
  wire   [   0:0] pe$030$xbar_resp_rdy;
  wire   [ 127:0] pe$030$y_unloader_msg;
  wire   [   0:0] pe$030$y_unloader_val;
  wire   [  31:0] pe$030$blkdone_sig_msg;
  wire   [   0:0] pe$030$blkdone_sig_val;
  wire   [   0:0] pe$030$blkdone_ack_rdy;

  SDPERTL_wrapped_0x5a96c41063a827a4 pe$030
  (
    .clk              ( pe$030$clk ),
    .reset            ( pe$030$reset ),
    .pe_id_msg        ( pe$030$pe_id_msg ),
    .pe_id_val        ( pe$030$pe_id_val ),
    .cm_msg           ( pe$030$cm_msg ),
    .cm_val           ( pe$030$cm_val ),
    .a_feeder_in_msg  ( pe$030$a_feeder_in_msg ),
    .a_feeder_in_val  ( pe$030$a_feeder_in_val ),
    .a_feeder_out_rdy ( pe$030$a_feeder_out_rdy ),
    .xbar_req_rdy     ( pe$030$xbar_req_rdy ),
    .xbar_resp_msg    ( pe$030$xbar_resp_msg ),
    .xbar_resp_val    ( pe$030$xbar_resp_val ),
    .y_unloader_rdy   ( pe$030$y_unloader_rdy ),
    .blkdone_sig_rdy  ( pe$030$blkdone_sig_rdy ),
    .blkdone_ack_msg  ( pe$030$blkdone_ack_msg ),
    .blkdone_ack_val  ( pe$030$blkdone_ack_val ),
    .pe_id_rdy        ( pe$030$pe_id_rdy ),
    .cm_rdy           ( pe$030$cm_rdy ),
    .a_feeder_in_rdy  ( pe$030$a_feeder_in_rdy ),
    .a_feeder_out_msg ( pe$030$a_feeder_out_msg ),
    .a_feeder_out_val ( pe$030$a_feeder_out_val ),
    .xbar_req_msg     ( pe$030$xbar_req_msg ),
    .xbar_req_val     ( pe$030$xbar_req_val ),
    .xbar_resp_rdy    ( pe$030$xbar_resp_rdy ),
    .y_unloader_msg   ( pe$030$y_unloader_msg ),
    .y_unloader_val   ( pe$030$y_unloader_val ),
    .blkdone_sig_msg  ( pe$030$blkdone_sig_msg ),
    .blkdone_sig_val  ( pe$030$blkdone_sig_val ),
    .blkdone_ack_rdy  ( pe$030$blkdone_ack_rdy )
  );

  // pe$031 temporaries
  wire   [   0:0] pe$031$clk;
  wire   [   0:0] pe$031$reset;
  wire   [  63:0] pe$031$pe_id_msg;
  wire   [   0:0] pe$031$pe_id_val;
  wire   [   0:0] pe$031$cm_msg;
  wire   [   0:0] pe$031$cm_val;
  wire   [  63:0] pe$031$a_feeder_in_msg;
  wire   [   0:0] pe$031$a_feeder_in_val;
  wire   [   0:0] pe$031$a_feeder_out_rdy;
  wire   [   0:0] pe$031$xbar_req_rdy;
  wire   [  63:0] pe$031$xbar_resp_msg;
  wire   [   0:0] pe$031$xbar_resp_val;
  wire   [   0:0] pe$031$y_unloader_rdy;
  wire   [   0:0] pe$031$blkdone_sig_rdy;
  wire   [  31:0] pe$031$blkdone_ack_msg;
  wire   [   0:0] pe$031$blkdone_ack_val;
  wire   [   0:0] pe$031$pe_id_rdy;
  wire   [   0:0] pe$031$cm_rdy;
  wire   [   0:0] pe$031$a_feeder_in_rdy;
  wire   [  63:0] pe$031$a_feeder_out_msg;
  wire   [   0:0] pe$031$a_feeder_out_val;
  wire   [  31:0] pe$031$xbar_req_msg;
  wire   [   0:0] pe$031$xbar_req_val;
  wire   [   0:0] pe$031$xbar_resp_rdy;
  wire   [ 127:0] pe$031$y_unloader_msg;
  wire   [   0:0] pe$031$y_unloader_val;
  wire   [  31:0] pe$031$blkdone_sig_msg;
  wire   [   0:0] pe$031$blkdone_sig_val;
  wire   [   0:0] pe$031$blkdone_ack_rdy;

  SDPERTL_wrapped_0x5a96c41063a827a4 pe$031
  (
    .clk              ( pe$031$clk ),
    .reset            ( pe$031$reset ),
    .pe_id_msg        ( pe$031$pe_id_msg ),
    .pe_id_val        ( pe$031$pe_id_val ),
    .cm_msg           ( pe$031$cm_msg ),
    .cm_val           ( pe$031$cm_val ),
    .a_feeder_in_msg  ( pe$031$a_feeder_in_msg ),
    .a_feeder_in_val  ( pe$031$a_feeder_in_val ),
    .a_feeder_out_rdy ( pe$031$a_feeder_out_rdy ),
    .xbar_req_rdy     ( pe$031$xbar_req_rdy ),
    .xbar_resp_msg    ( pe$031$xbar_resp_msg ),
    .xbar_resp_val    ( pe$031$xbar_resp_val ),
    .y_unloader_rdy   ( pe$031$y_unloader_rdy ),
    .blkdone_sig_rdy  ( pe$031$blkdone_sig_rdy ),
    .blkdone_ack_msg  ( pe$031$blkdone_ack_msg ),
    .blkdone_ack_val  ( pe$031$blkdone_ack_val ),
    .pe_id_rdy        ( pe$031$pe_id_rdy ),
    .cm_rdy           ( pe$031$cm_rdy ),
    .a_feeder_in_rdy  ( pe$031$a_feeder_in_rdy ),
    .a_feeder_out_msg ( pe$031$a_feeder_out_msg ),
    .a_feeder_out_val ( pe$031$a_feeder_out_val ),
    .xbar_req_msg     ( pe$031$xbar_req_msg ),
    .xbar_req_val     ( pe$031$xbar_req_val ),
    .xbar_resp_rdy    ( pe$031$xbar_resp_rdy ),
    .y_unloader_msg   ( pe$031$y_unloader_msg ),
    .y_unloader_val   ( pe$031$y_unloader_val ),
    .blkdone_sig_msg  ( pe$031$blkdone_sig_msg ),
    .blkdone_sig_val  ( pe$031$blkdone_sig_val ),
    .blkdone_ack_rdy  ( pe$031$blkdone_ack_rdy )
  );

  // pe$032 temporaries
  wire   [   0:0] pe$032$clk;
  wire   [   0:0] pe$032$reset;
  wire   [  63:0] pe$032$pe_id_msg;
  wire   [   0:0] pe$032$pe_id_val;
  wire   [   0:0] pe$032$cm_msg;
  wire   [   0:0] pe$032$cm_val;
  wire   [  63:0] pe$032$a_feeder_in_msg;
  wire   [   0:0] pe$032$a_feeder_in_val;
  wire   [   0:0] pe$032$a_feeder_out_rdy;
  wire   [   0:0] pe$032$xbar_req_rdy;
  wire   [  63:0] pe$032$xbar_resp_msg;
  wire   [   0:0] pe$032$xbar_resp_val;
  wire   [   0:0] pe$032$y_unloader_rdy;
  wire   [   0:0] pe$032$blkdone_sig_rdy;
  wire   [  31:0] pe$032$blkdone_ack_msg;
  wire   [   0:0] pe$032$blkdone_ack_val;
  wire   [   0:0] pe$032$pe_id_rdy;
  wire   [   0:0] pe$032$cm_rdy;
  wire   [   0:0] pe$032$a_feeder_in_rdy;
  wire   [  63:0] pe$032$a_feeder_out_msg;
  wire   [   0:0] pe$032$a_feeder_out_val;
  wire   [  31:0] pe$032$xbar_req_msg;
  wire   [   0:0] pe$032$xbar_req_val;
  wire   [   0:0] pe$032$xbar_resp_rdy;
  wire   [ 127:0] pe$032$y_unloader_msg;
  wire   [   0:0] pe$032$y_unloader_val;
  wire   [  31:0] pe$032$blkdone_sig_msg;
  wire   [   0:0] pe$032$blkdone_sig_val;
  wire   [   0:0] pe$032$blkdone_ack_rdy;

  SDPERTL_wrapped_0x5a96c41063a827a4 pe$032
  (
    .clk              ( pe$032$clk ),
    .reset            ( pe$032$reset ),
    .pe_id_msg        ( pe$032$pe_id_msg ),
    .pe_id_val        ( pe$032$pe_id_val ),
    .cm_msg           ( pe$032$cm_msg ),
    .cm_val           ( pe$032$cm_val ),
    .a_feeder_in_msg  ( pe$032$a_feeder_in_msg ),
    .a_feeder_in_val  ( pe$032$a_feeder_in_val ),
    .a_feeder_out_rdy ( pe$032$a_feeder_out_rdy ),
    .xbar_req_rdy     ( pe$032$xbar_req_rdy ),
    .xbar_resp_msg    ( pe$032$xbar_resp_msg ),
    .xbar_resp_val    ( pe$032$xbar_resp_val ),
    .y_unloader_rdy   ( pe$032$y_unloader_rdy ),
    .blkdone_sig_rdy  ( pe$032$blkdone_sig_rdy ),
    .blkdone_ack_msg  ( pe$032$blkdone_ack_msg ),
    .blkdone_ack_val  ( pe$032$blkdone_ack_val ),
    .pe_id_rdy        ( pe$032$pe_id_rdy ),
    .cm_rdy           ( pe$032$cm_rdy ),
    .a_feeder_in_rdy  ( pe$032$a_feeder_in_rdy ),
    .a_feeder_out_msg ( pe$032$a_feeder_out_msg ),
    .a_feeder_out_val ( pe$032$a_feeder_out_val ),
    .xbar_req_msg     ( pe$032$xbar_req_msg ),
    .xbar_req_val     ( pe$032$xbar_req_val ),
    .xbar_resp_rdy    ( pe$032$xbar_resp_rdy ),
    .y_unloader_msg   ( pe$032$y_unloader_msg ),
    .y_unloader_val   ( pe$032$y_unloader_val ),
    .blkdone_sig_msg  ( pe$032$blkdone_sig_msg ),
    .blkdone_sig_val  ( pe$032$blkdone_sig_val ),
    .blkdone_ack_rdy  ( pe$032$blkdone_ack_rdy )
  );

  // pe$033 temporaries
  wire   [   0:0] pe$033$clk;
  wire   [   0:0] pe$033$reset;
  wire   [  63:0] pe$033$pe_id_msg;
  wire   [   0:0] pe$033$pe_id_val;
  wire   [   0:0] pe$033$cm_msg;
  wire   [   0:0] pe$033$cm_val;
  wire   [  63:0] pe$033$a_feeder_in_msg;
  wire   [   0:0] pe$033$a_feeder_in_val;
  wire   [   0:0] pe$033$a_feeder_out_rdy;
  wire   [   0:0] pe$033$xbar_req_rdy;
  wire   [  63:0] pe$033$xbar_resp_msg;
  wire   [   0:0] pe$033$xbar_resp_val;
  wire   [   0:0] pe$033$y_unloader_rdy;
  wire   [   0:0] pe$033$blkdone_sig_rdy;
  wire   [  31:0] pe$033$blkdone_ack_msg;
  wire   [   0:0] pe$033$blkdone_ack_val;
  wire   [   0:0] pe$033$pe_id_rdy;
  wire   [   0:0] pe$033$cm_rdy;
  wire   [   0:0] pe$033$a_feeder_in_rdy;
  wire   [  63:0] pe$033$a_feeder_out_msg;
  wire   [   0:0] pe$033$a_feeder_out_val;
  wire   [  31:0] pe$033$xbar_req_msg;
  wire   [   0:0] pe$033$xbar_req_val;
  wire   [   0:0] pe$033$xbar_resp_rdy;
  wire   [ 127:0] pe$033$y_unloader_msg;
  wire   [   0:0] pe$033$y_unloader_val;
  wire   [  31:0] pe$033$blkdone_sig_msg;
  wire   [   0:0] pe$033$blkdone_sig_val;
  wire   [   0:0] pe$033$blkdone_ack_rdy;

  SDPERTL_wrapped_0x5a96c41063a827a4 pe$033
  (
    .clk              ( pe$033$clk ),
    .reset            ( pe$033$reset ),
    .pe_id_msg        ( pe$033$pe_id_msg ),
    .pe_id_val        ( pe$033$pe_id_val ),
    .cm_msg           ( pe$033$cm_msg ),
    .cm_val           ( pe$033$cm_val ),
    .a_feeder_in_msg  ( pe$033$a_feeder_in_msg ),
    .a_feeder_in_val  ( pe$033$a_feeder_in_val ),
    .a_feeder_out_rdy ( pe$033$a_feeder_out_rdy ),
    .xbar_req_rdy     ( pe$033$xbar_req_rdy ),
    .xbar_resp_msg    ( pe$033$xbar_resp_msg ),
    .xbar_resp_val    ( pe$033$xbar_resp_val ),
    .y_unloader_rdy   ( pe$033$y_unloader_rdy ),
    .blkdone_sig_rdy  ( pe$033$blkdone_sig_rdy ),
    .blkdone_ack_msg  ( pe$033$blkdone_ack_msg ),
    .blkdone_ack_val  ( pe$033$blkdone_ack_val ),
    .pe_id_rdy        ( pe$033$pe_id_rdy ),
    .cm_rdy           ( pe$033$cm_rdy ),
    .a_feeder_in_rdy  ( pe$033$a_feeder_in_rdy ),
    .a_feeder_out_msg ( pe$033$a_feeder_out_msg ),
    .a_feeder_out_val ( pe$033$a_feeder_out_val ),
    .xbar_req_msg     ( pe$033$xbar_req_msg ),
    .xbar_req_val     ( pe$033$xbar_req_val ),
    .xbar_resp_rdy    ( pe$033$xbar_resp_rdy ),
    .y_unloader_msg   ( pe$033$y_unloader_msg ),
    .y_unloader_val   ( pe$033$y_unloader_val ),
    .blkdone_sig_msg  ( pe$033$blkdone_sig_msg ),
    .blkdone_sig_val  ( pe$033$blkdone_sig_val ),
    .blkdone_ack_rdy  ( pe$033$blkdone_ack_rdy )
  );

  // pe$034 temporaries
  wire   [   0:0] pe$034$clk;
  wire   [   0:0] pe$034$reset;
  wire   [  63:0] pe$034$pe_id_msg;
  wire   [   0:0] pe$034$pe_id_val;
  wire   [   0:0] pe$034$cm_msg;
  wire   [   0:0] pe$034$cm_val;
  wire   [  63:0] pe$034$a_feeder_in_msg;
  wire   [   0:0] pe$034$a_feeder_in_val;
  wire   [   0:0] pe$034$a_feeder_out_rdy;
  wire   [   0:0] pe$034$xbar_req_rdy;
  wire   [  63:0] pe$034$xbar_resp_msg;
  wire   [   0:0] pe$034$xbar_resp_val;
  wire   [   0:0] pe$034$y_unloader_rdy;
  wire   [   0:0] pe$034$blkdone_sig_rdy;
  wire   [  31:0] pe$034$blkdone_ack_msg;
  wire   [   0:0] pe$034$blkdone_ack_val;
  wire   [   0:0] pe$034$pe_id_rdy;
  wire   [   0:0] pe$034$cm_rdy;
  wire   [   0:0] pe$034$a_feeder_in_rdy;
  wire   [  63:0] pe$034$a_feeder_out_msg;
  wire   [   0:0] pe$034$a_feeder_out_val;
  wire   [  31:0] pe$034$xbar_req_msg;
  wire   [   0:0] pe$034$xbar_req_val;
  wire   [   0:0] pe$034$xbar_resp_rdy;
  wire   [ 127:0] pe$034$y_unloader_msg;
  wire   [   0:0] pe$034$y_unloader_val;
  wire   [  31:0] pe$034$blkdone_sig_msg;
  wire   [   0:0] pe$034$blkdone_sig_val;
  wire   [   0:0] pe$034$blkdone_ack_rdy;

  SDPERTL_wrapped_0x5a96c41063a827a4 pe$034
  (
    .clk              ( pe$034$clk ),
    .reset            ( pe$034$reset ),
    .pe_id_msg        ( pe$034$pe_id_msg ),
    .pe_id_val        ( pe$034$pe_id_val ),
    .cm_msg           ( pe$034$cm_msg ),
    .cm_val           ( pe$034$cm_val ),
    .a_feeder_in_msg  ( pe$034$a_feeder_in_msg ),
    .a_feeder_in_val  ( pe$034$a_feeder_in_val ),
    .a_feeder_out_rdy ( pe$034$a_feeder_out_rdy ),
    .xbar_req_rdy     ( pe$034$xbar_req_rdy ),
    .xbar_resp_msg    ( pe$034$xbar_resp_msg ),
    .xbar_resp_val    ( pe$034$xbar_resp_val ),
    .y_unloader_rdy   ( pe$034$y_unloader_rdy ),
    .blkdone_sig_rdy  ( pe$034$blkdone_sig_rdy ),
    .blkdone_ack_msg  ( pe$034$blkdone_ack_msg ),
    .blkdone_ack_val  ( pe$034$blkdone_ack_val ),
    .pe_id_rdy        ( pe$034$pe_id_rdy ),
    .cm_rdy           ( pe$034$cm_rdy ),
    .a_feeder_in_rdy  ( pe$034$a_feeder_in_rdy ),
    .a_feeder_out_msg ( pe$034$a_feeder_out_msg ),
    .a_feeder_out_val ( pe$034$a_feeder_out_val ),
    .xbar_req_msg     ( pe$034$xbar_req_msg ),
    .xbar_req_val     ( pe$034$xbar_req_val ),
    .xbar_resp_rdy    ( pe$034$xbar_resp_rdy ),
    .y_unloader_msg   ( pe$034$y_unloader_msg ),
    .y_unloader_val   ( pe$034$y_unloader_val ),
    .blkdone_sig_msg  ( pe$034$blkdone_sig_msg ),
    .blkdone_sig_val  ( pe$034$blkdone_sig_val ),
    .blkdone_ack_rdy  ( pe$034$blkdone_ack_rdy )
  );

  // pe$035 temporaries
  wire   [   0:0] pe$035$clk;
  wire   [   0:0] pe$035$reset;
  wire   [  63:0] pe$035$pe_id_msg;
  wire   [   0:0] pe$035$pe_id_val;
  wire   [   0:0] pe$035$cm_msg;
  wire   [   0:0] pe$035$cm_val;
  wire   [  63:0] pe$035$a_feeder_in_msg;
  wire   [   0:0] pe$035$a_feeder_in_val;
  wire   [   0:0] pe$035$a_feeder_out_rdy;
  wire   [   0:0] pe$035$xbar_req_rdy;
  wire   [  63:0] pe$035$xbar_resp_msg;
  wire   [   0:0] pe$035$xbar_resp_val;
  wire   [   0:0] pe$035$y_unloader_rdy;
  wire   [   0:0] pe$035$blkdone_sig_rdy;
  wire   [  31:0] pe$035$blkdone_ack_msg;
  wire   [   0:0] pe$035$blkdone_ack_val;
  wire   [   0:0] pe$035$pe_id_rdy;
  wire   [   0:0] pe$035$cm_rdy;
  wire   [   0:0] pe$035$a_feeder_in_rdy;
  wire   [  63:0] pe$035$a_feeder_out_msg;
  wire   [   0:0] pe$035$a_feeder_out_val;
  wire   [  31:0] pe$035$xbar_req_msg;
  wire   [   0:0] pe$035$xbar_req_val;
  wire   [   0:0] pe$035$xbar_resp_rdy;
  wire   [ 127:0] pe$035$y_unloader_msg;
  wire   [   0:0] pe$035$y_unloader_val;
  wire   [  31:0] pe$035$blkdone_sig_msg;
  wire   [   0:0] pe$035$blkdone_sig_val;
  wire   [   0:0] pe$035$blkdone_ack_rdy;

  SDPERTL_wrapped_0x5a96c41063a827a4 pe$035
  (
    .clk              ( pe$035$clk ),
    .reset            ( pe$035$reset ),
    .pe_id_msg        ( pe$035$pe_id_msg ),
    .pe_id_val        ( pe$035$pe_id_val ),
    .cm_msg           ( pe$035$cm_msg ),
    .cm_val           ( pe$035$cm_val ),
    .a_feeder_in_msg  ( pe$035$a_feeder_in_msg ),
    .a_feeder_in_val  ( pe$035$a_feeder_in_val ),
    .a_feeder_out_rdy ( pe$035$a_feeder_out_rdy ),
    .xbar_req_rdy     ( pe$035$xbar_req_rdy ),
    .xbar_resp_msg    ( pe$035$xbar_resp_msg ),
    .xbar_resp_val    ( pe$035$xbar_resp_val ),
    .y_unloader_rdy   ( pe$035$y_unloader_rdy ),
    .blkdone_sig_rdy  ( pe$035$blkdone_sig_rdy ),
    .blkdone_ack_msg  ( pe$035$blkdone_ack_msg ),
    .blkdone_ack_val  ( pe$035$blkdone_ack_val ),
    .pe_id_rdy        ( pe$035$pe_id_rdy ),
    .cm_rdy           ( pe$035$cm_rdy ),
    .a_feeder_in_rdy  ( pe$035$a_feeder_in_rdy ),
    .a_feeder_out_msg ( pe$035$a_feeder_out_msg ),
    .a_feeder_out_val ( pe$035$a_feeder_out_val ),
    .xbar_req_msg     ( pe$035$xbar_req_msg ),
    .xbar_req_val     ( pe$035$xbar_req_val ),
    .xbar_resp_rdy    ( pe$035$xbar_resp_rdy ),
    .y_unloader_msg   ( pe$035$y_unloader_msg ),
    .y_unloader_val   ( pe$035$y_unloader_val ),
    .blkdone_sig_msg  ( pe$035$blkdone_sig_msg ),
    .blkdone_sig_val  ( pe$035$blkdone_sig_val ),
    .blkdone_ack_rdy  ( pe$035$blkdone_ack_rdy )
  );

  // pe$036 temporaries
  wire   [   0:0] pe$036$clk;
  wire   [   0:0] pe$036$reset;
  wire   [  63:0] pe$036$pe_id_msg;
  wire   [   0:0] pe$036$pe_id_val;
  wire   [   0:0] pe$036$cm_msg;
  wire   [   0:0] pe$036$cm_val;
  wire   [  63:0] pe$036$a_feeder_in_msg;
  wire   [   0:0] pe$036$a_feeder_in_val;
  wire   [   0:0] pe$036$a_feeder_out_rdy;
  wire   [   0:0] pe$036$xbar_req_rdy;
  wire   [  63:0] pe$036$xbar_resp_msg;
  wire   [   0:0] pe$036$xbar_resp_val;
  wire   [   0:0] pe$036$y_unloader_rdy;
  wire   [   0:0] pe$036$blkdone_sig_rdy;
  wire   [  31:0] pe$036$blkdone_ack_msg;
  wire   [   0:0] pe$036$blkdone_ack_val;
  wire   [   0:0] pe$036$pe_id_rdy;
  wire   [   0:0] pe$036$cm_rdy;
  wire   [   0:0] pe$036$a_feeder_in_rdy;
  wire   [  63:0] pe$036$a_feeder_out_msg;
  wire   [   0:0] pe$036$a_feeder_out_val;
  wire   [  31:0] pe$036$xbar_req_msg;
  wire   [   0:0] pe$036$xbar_req_val;
  wire   [   0:0] pe$036$xbar_resp_rdy;
  wire   [ 127:0] pe$036$y_unloader_msg;
  wire   [   0:0] pe$036$y_unloader_val;
  wire   [  31:0] pe$036$blkdone_sig_msg;
  wire   [   0:0] pe$036$blkdone_sig_val;
  wire   [   0:0] pe$036$blkdone_ack_rdy;

  SDPERTL_wrapped_0x5a96c41063a827a4 pe$036
  (
    .clk              ( pe$036$clk ),
    .reset            ( pe$036$reset ),
    .pe_id_msg        ( pe$036$pe_id_msg ),
    .pe_id_val        ( pe$036$pe_id_val ),
    .cm_msg           ( pe$036$cm_msg ),
    .cm_val           ( pe$036$cm_val ),
    .a_feeder_in_msg  ( pe$036$a_feeder_in_msg ),
    .a_feeder_in_val  ( pe$036$a_feeder_in_val ),
    .a_feeder_out_rdy ( pe$036$a_feeder_out_rdy ),
    .xbar_req_rdy     ( pe$036$xbar_req_rdy ),
    .xbar_resp_msg    ( pe$036$xbar_resp_msg ),
    .xbar_resp_val    ( pe$036$xbar_resp_val ),
    .y_unloader_rdy   ( pe$036$y_unloader_rdy ),
    .blkdone_sig_rdy  ( pe$036$blkdone_sig_rdy ),
    .blkdone_ack_msg  ( pe$036$blkdone_ack_msg ),
    .blkdone_ack_val  ( pe$036$blkdone_ack_val ),
    .pe_id_rdy        ( pe$036$pe_id_rdy ),
    .cm_rdy           ( pe$036$cm_rdy ),
    .a_feeder_in_rdy  ( pe$036$a_feeder_in_rdy ),
    .a_feeder_out_msg ( pe$036$a_feeder_out_msg ),
    .a_feeder_out_val ( pe$036$a_feeder_out_val ),
    .xbar_req_msg     ( pe$036$xbar_req_msg ),
    .xbar_req_val     ( pe$036$xbar_req_val ),
    .xbar_resp_rdy    ( pe$036$xbar_resp_rdy ),
    .y_unloader_msg   ( pe$036$y_unloader_msg ),
    .y_unloader_val   ( pe$036$y_unloader_val ),
    .blkdone_sig_msg  ( pe$036$blkdone_sig_msg ),
    .blkdone_sig_val  ( pe$036$blkdone_sig_val ),
    .blkdone_ack_rdy  ( pe$036$blkdone_ack_rdy )
  );

  // pe$037 temporaries
  wire   [   0:0] pe$037$clk;
  wire   [   0:0] pe$037$reset;
  wire   [  63:0] pe$037$pe_id_msg;
  wire   [   0:0] pe$037$pe_id_val;
  wire   [   0:0] pe$037$cm_msg;
  wire   [   0:0] pe$037$cm_val;
  wire   [  63:0] pe$037$a_feeder_in_msg;
  wire   [   0:0] pe$037$a_feeder_in_val;
  wire   [   0:0] pe$037$a_feeder_out_rdy;
  wire   [   0:0] pe$037$xbar_req_rdy;
  wire   [  63:0] pe$037$xbar_resp_msg;
  wire   [   0:0] pe$037$xbar_resp_val;
  wire   [   0:0] pe$037$y_unloader_rdy;
  wire   [   0:0] pe$037$blkdone_sig_rdy;
  wire   [  31:0] pe$037$blkdone_ack_msg;
  wire   [   0:0] pe$037$blkdone_ack_val;
  wire   [   0:0] pe$037$pe_id_rdy;
  wire   [   0:0] pe$037$cm_rdy;
  wire   [   0:0] pe$037$a_feeder_in_rdy;
  wire   [  63:0] pe$037$a_feeder_out_msg;
  wire   [   0:0] pe$037$a_feeder_out_val;
  wire   [  31:0] pe$037$xbar_req_msg;
  wire   [   0:0] pe$037$xbar_req_val;
  wire   [   0:0] pe$037$xbar_resp_rdy;
  wire   [ 127:0] pe$037$y_unloader_msg;
  wire   [   0:0] pe$037$y_unloader_val;
  wire   [  31:0] pe$037$blkdone_sig_msg;
  wire   [   0:0] pe$037$blkdone_sig_val;
  wire   [   0:0] pe$037$blkdone_ack_rdy;

  SDPERTL_wrapped_0x5a96c41063a827a4 pe$037
  (
    .clk              ( pe$037$clk ),
    .reset            ( pe$037$reset ),
    .pe_id_msg        ( pe$037$pe_id_msg ),
    .pe_id_val        ( pe$037$pe_id_val ),
    .cm_msg           ( pe$037$cm_msg ),
    .cm_val           ( pe$037$cm_val ),
    .a_feeder_in_msg  ( pe$037$a_feeder_in_msg ),
    .a_feeder_in_val  ( pe$037$a_feeder_in_val ),
    .a_feeder_out_rdy ( pe$037$a_feeder_out_rdy ),
    .xbar_req_rdy     ( pe$037$xbar_req_rdy ),
    .xbar_resp_msg    ( pe$037$xbar_resp_msg ),
    .xbar_resp_val    ( pe$037$xbar_resp_val ),
    .y_unloader_rdy   ( pe$037$y_unloader_rdy ),
    .blkdone_sig_rdy  ( pe$037$blkdone_sig_rdy ),
    .blkdone_ack_msg  ( pe$037$blkdone_ack_msg ),
    .blkdone_ack_val  ( pe$037$blkdone_ack_val ),
    .pe_id_rdy        ( pe$037$pe_id_rdy ),
    .cm_rdy           ( pe$037$cm_rdy ),
    .a_feeder_in_rdy  ( pe$037$a_feeder_in_rdy ),
    .a_feeder_out_msg ( pe$037$a_feeder_out_msg ),
    .a_feeder_out_val ( pe$037$a_feeder_out_val ),
    .xbar_req_msg     ( pe$037$xbar_req_msg ),
    .xbar_req_val     ( pe$037$xbar_req_val ),
    .xbar_resp_rdy    ( pe$037$xbar_resp_rdy ),
    .y_unloader_msg   ( pe$037$y_unloader_msg ),
    .y_unloader_val   ( pe$037$y_unloader_val ),
    .blkdone_sig_msg  ( pe$037$blkdone_sig_msg ),
    .blkdone_sig_val  ( pe$037$blkdone_sig_val ),
    .blkdone_ack_rdy  ( pe$037$blkdone_ack_rdy )
  );

  // pe$038 temporaries
  wire   [   0:0] pe$038$clk;
  wire   [   0:0] pe$038$reset;
  wire   [  63:0] pe$038$pe_id_msg;
  wire   [   0:0] pe$038$pe_id_val;
  wire   [   0:0] pe$038$cm_msg;
  wire   [   0:0] pe$038$cm_val;
  wire   [  63:0] pe$038$a_feeder_in_msg;
  wire   [   0:0] pe$038$a_feeder_in_val;
  wire   [   0:0] pe$038$a_feeder_out_rdy;
  wire   [   0:0] pe$038$xbar_req_rdy;
  wire   [  63:0] pe$038$xbar_resp_msg;
  wire   [   0:0] pe$038$xbar_resp_val;
  wire   [   0:0] pe$038$y_unloader_rdy;
  wire   [   0:0] pe$038$blkdone_sig_rdy;
  wire   [  31:0] pe$038$blkdone_ack_msg;
  wire   [   0:0] pe$038$blkdone_ack_val;
  wire   [   0:0] pe$038$pe_id_rdy;
  wire   [   0:0] pe$038$cm_rdy;
  wire   [   0:0] pe$038$a_feeder_in_rdy;
  wire   [  63:0] pe$038$a_feeder_out_msg;
  wire   [   0:0] pe$038$a_feeder_out_val;
  wire   [  31:0] pe$038$xbar_req_msg;
  wire   [   0:0] pe$038$xbar_req_val;
  wire   [   0:0] pe$038$xbar_resp_rdy;
  wire   [ 127:0] pe$038$y_unloader_msg;
  wire   [   0:0] pe$038$y_unloader_val;
  wire   [  31:0] pe$038$blkdone_sig_msg;
  wire   [   0:0] pe$038$blkdone_sig_val;
  wire   [   0:0] pe$038$blkdone_ack_rdy;

  SDPERTL_wrapped_0x5a96c41063a827a4 pe$038
  (
    .clk              ( pe$038$clk ),
    .reset            ( pe$038$reset ),
    .pe_id_msg        ( pe$038$pe_id_msg ),
    .pe_id_val        ( pe$038$pe_id_val ),
    .cm_msg           ( pe$038$cm_msg ),
    .cm_val           ( pe$038$cm_val ),
    .a_feeder_in_msg  ( pe$038$a_feeder_in_msg ),
    .a_feeder_in_val  ( pe$038$a_feeder_in_val ),
    .a_feeder_out_rdy ( pe$038$a_feeder_out_rdy ),
    .xbar_req_rdy     ( pe$038$xbar_req_rdy ),
    .xbar_resp_msg    ( pe$038$xbar_resp_msg ),
    .xbar_resp_val    ( pe$038$xbar_resp_val ),
    .y_unloader_rdy   ( pe$038$y_unloader_rdy ),
    .blkdone_sig_rdy  ( pe$038$blkdone_sig_rdy ),
    .blkdone_ack_msg  ( pe$038$blkdone_ack_msg ),
    .blkdone_ack_val  ( pe$038$blkdone_ack_val ),
    .pe_id_rdy        ( pe$038$pe_id_rdy ),
    .cm_rdy           ( pe$038$cm_rdy ),
    .a_feeder_in_rdy  ( pe$038$a_feeder_in_rdy ),
    .a_feeder_out_msg ( pe$038$a_feeder_out_msg ),
    .a_feeder_out_val ( pe$038$a_feeder_out_val ),
    .xbar_req_msg     ( pe$038$xbar_req_msg ),
    .xbar_req_val     ( pe$038$xbar_req_val ),
    .xbar_resp_rdy    ( pe$038$xbar_resp_rdy ),
    .y_unloader_msg   ( pe$038$y_unloader_msg ),
    .y_unloader_val   ( pe$038$y_unloader_val ),
    .blkdone_sig_msg  ( pe$038$blkdone_sig_msg ),
    .blkdone_sig_val  ( pe$038$blkdone_sig_val ),
    .blkdone_ack_rdy  ( pe$038$blkdone_ack_rdy )
  );

  // pe$039 temporaries
  wire   [   0:0] pe$039$clk;
  wire   [   0:0] pe$039$reset;
  wire   [  63:0] pe$039$pe_id_msg;
  wire   [   0:0] pe$039$pe_id_val;
  wire   [   0:0] pe$039$cm_msg;
  wire   [   0:0] pe$039$cm_val;
  wire   [  63:0] pe$039$a_feeder_in_msg;
  wire   [   0:0] pe$039$a_feeder_in_val;
  wire   [   0:0] pe$039$a_feeder_out_rdy;
  wire   [   0:0] pe$039$xbar_req_rdy;
  wire   [  63:0] pe$039$xbar_resp_msg;
  wire   [   0:0] pe$039$xbar_resp_val;
  wire   [   0:0] pe$039$y_unloader_rdy;
  wire   [   0:0] pe$039$blkdone_sig_rdy;
  wire   [  31:0] pe$039$blkdone_ack_msg;
  wire   [   0:0] pe$039$blkdone_ack_val;
  wire   [   0:0] pe$039$pe_id_rdy;
  wire   [   0:0] pe$039$cm_rdy;
  wire   [   0:0] pe$039$a_feeder_in_rdy;
  wire   [  63:0] pe$039$a_feeder_out_msg;
  wire   [   0:0] pe$039$a_feeder_out_val;
  wire   [  31:0] pe$039$xbar_req_msg;
  wire   [   0:0] pe$039$xbar_req_val;
  wire   [   0:0] pe$039$xbar_resp_rdy;
  wire   [ 127:0] pe$039$y_unloader_msg;
  wire   [   0:0] pe$039$y_unloader_val;
  wire   [  31:0] pe$039$blkdone_sig_msg;
  wire   [   0:0] pe$039$blkdone_sig_val;
  wire   [   0:0] pe$039$blkdone_ack_rdy;

  SDPERTL_wrapped_0x5a96c41063a827a4 pe$039
  (
    .clk              ( pe$039$clk ),
    .reset            ( pe$039$reset ),
    .pe_id_msg        ( pe$039$pe_id_msg ),
    .pe_id_val        ( pe$039$pe_id_val ),
    .cm_msg           ( pe$039$cm_msg ),
    .cm_val           ( pe$039$cm_val ),
    .a_feeder_in_msg  ( pe$039$a_feeder_in_msg ),
    .a_feeder_in_val  ( pe$039$a_feeder_in_val ),
    .a_feeder_out_rdy ( pe$039$a_feeder_out_rdy ),
    .xbar_req_rdy     ( pe$039$xbar_req_rdy ),
    .xbar_resp_msg    ( pe$039$xbar_resp_msg ),
    .xbar_resp_val    ( pe$039$xbar_resp_val ),
    .y_unloader_rdy   ( pe$039$y_unloader_rdy ),
    .blkdone_sig_rdy  ( pe$039$blkdone_sig_rdy ),
    .blkdone_ack_msg  ( pe$039$blkdone_ack_msg ),
    .blkdone_ack_val  ( pe$039$blkdone_ack_val ),
    .pe_id_rdy        ( pe$039$pe_id_rdy ),
    .cm_rdy           ( pe$039$cm_rdy ),
    .a_feeder_in_rdy  ( pe$039$a_feeder_in_rdy ),
    .a_feeder_out_msg ( pe$039$a_feeder_out_msg ),
    .a_feeder_out_val ( pe$039$a_feeder_out_val ),
    .xbar_req_msg     ( pe$039$xbar_req_msg ),
    .xbar_req_val     ( pe$039$xbar_req_val ),
    .xbar_resp_rdy    ( pe$039$xbar_resp_rdy ),
    .y_unloader_msg   ( pe$039$y_unloader_msg ),
    .y_unloader_val   ( pe$039$y_unloader_val ),
    .blkdone_sig_msg  ( pe$039$blkdone_sig_msg ),
    .blkdone_sig_val  ( pe$039$blkdone_sig_val ),
    .blkdone_ack_rdy  ( pe$039$blkdone_ack_rdy )
  );

  // pe$040 temporaries
  wire   [   0:0] pe$040$clk;
  wire   [   0:0] pe$040$reset;
  wire   [  63:0] pe$040$pe_id_msg;
  wire   [   0:0] pe$040$pe_id_val;
  wire   [   0:0] pe$040$cm_msg;
  wire   [   0:0] pe$040$cm_val;
  wire   [  63:0] pe$040$a_feeder_in_msg;
  wire   [   0:0] pe$040$a_feeder_in_val;
  wire   [   0:0] pe$040$a_feeder_out_rdy;
  wire   [   0:0] pe$040$xbar_req_rdy;
  wire   [  63:0] pe$040$xbar_resp_msg;
  wire   [   0:0] pe$040$xbar_resp_val;
  wire   [   0:0] pe$040$y_unloader_rdy;
  wire   [   0:0] pe$040$blkdone_sig_rdy;
  wire   [  31:0] pe$040$blkdone_ack_msg;
  wire   [   0:0] pe$040$blkdone_ack_val;
  wire   [   0:0] pe$040$pe_id_rdy;
  wire   [   0:0] pe$040$cm_rdy;
  wire   [   0:0] pe$040$a_feeder_in_rdy;
  wire   [  63:0] pe$040$a_feeder_out_msg;
  wire   [   0:0] pe$040$a_feeder_out_val;
  wire   [  31:0] pe$040$xbar_req_msg;
  wire   [   0:0] pe$040$xbar_req_val;
  wire   [   0:0] pe$040$xbar_resp_rdy;
  wire   [ 127:0] pe$040$y_unloader_msg;
  wire   [   0:0] pe$040$y_unloader_val;
  wire   [  31:0] pe$040$blkdone_sig_msg;
  wire   [   0:0] pe$040$blkdone_sig_val;
  wire   [   0:0] pe$040$blkdone_ack_rdy;

  SDPERTL_wrapped_0x5a96c41063a827a4 pe$040
  (
    .clk              ( pe$040$clk ),
    .reset            ( pe$040$reset ),
    .pe_id_msg        ( pe$040$pe_id_msg ),
    .pe_id_val        ( pe$040$pe_id_val ),
    .cm_msg           ( pe$040$cm_msg ),
    .cm_val           ( pe$040$cm_val ),
    .a_feeder_in_msg  ( pe$040$a_feeder_in_msg ),
    .a_feeder_in_val  ( pe$040$a_feeder_in_val ),
    .a_feeder_out_rdy ( pe$040$a_feeder_out_rdy ),
    .xbar_req_rdy     ( pe$040$xbar_req_rdy ),
    .xbar_resp_msg    ( pe$040$xbar_resp_msg ),
    .xbar_resp_val    ( pe$040$xbar_resp_val ),
    .y_unloader_rdy   ( pe$040$y_unloader_rdy ),
    .blkdone_sig_rdy  ( pe$040$blkdone_sig_rdy ),
    .blkdone_ack_msg  ( pe$040$blkdone_ack_msg ),
    .blkdone_ack_val  ( pe$040$blkdone_ack_val ),
    .pe_id_rdy        ( pe$040$pe_id_rdy ),
    .cm_rdy           ( pe$040$cm_rdy ),
    .a_feeder_in_rdy  ( pe$040$a_feeder_in_rdy ),
    .a_feeder_out_msg ( pe$040$a_feeder_out_msg ),
    .a_feeder_out_val ( pe$040$a_feeder_out_val ),
    .xbar_req_msg     ( pe$040$xbar_req_msg ),
    .xbar_req_val     ( pe$040$xbar_req_val ),
    .xbar_resp_rdy    ( pe$040$xbar_resp_rdy ),
    .y_unloader_msg   ( pe$040$y_unloader_msg ),
    .y_unloader_val   ( pe$040$y_unloader_val ),
    .blkdone_sig_msg  ( pe$040$blkdone_sig_msg ),
    .blkdone_sig_val  ( pe$040$blkdone_sig_val ),
    .blkdone_ack_rdy  ( pe$040$blkdone_ack_rdy )
  );

  // pe$041 temporaries
  wire   [   0:0] pe$041$clk;
  wire   [   0:0] pe$041$reset;
  wire   [  63:0] pe$041$pe_id_msg;
  wire   [   0:0] pe$041$pe_id_val;
  wire   [   0:0] pe$041$cm_msg;
  wire   [   0:0] pe$041$cm_val;
  wire   [  63:0] pe$041$a_feeder_in_msg;
  wire   [   0:0] pe$041$a_feeder_in_val;
  wire   [   0:0] pe$041$a_feeder_out_rdy;
  wire   [   0:0] pe$041$xbar_req_rdy;
  wire   [  63:0] pe$041$xbar_resp_msg;
  wire   [   0:0] pe$041$xbar_resp_val;
  wire   [   0:0] pe$041$y_unloader_rdy;
  wire   [   0:0] pe$041$blkdone_sig_rdy;
  wire   [  31:0] pe$041$blkdone_ack_msg;
  wire   [   0:0] pe$041$blkdone_ack_val;
  wire   [   0:0] pe$041$pe_id_rdy;
  wire   [   0:0] pe$041$cm_rdy;
  wire   [   0:0] pe$041$a_feeder_in_rdy;
  wire   [  63:0] pe$041$a_feeder_out_msg;
  wire   [   0:0] pe$041$a_feeder_out_val;
  wire   [  31:0] pe$041$xbar_req_msg;
  wire   [   0:0] pe$041$xbar_req_val;
  wire   [   0:0] pe$041$xbar_resp_rdy;
  wire   [ 127:0] pe$041$y_unloader_msg;
  wire   [   0:0] pe$041$y_unloader_val;
  wire   [  31:0] pe$041$blkdone_sig_msg;
  wire   [   0:0] pe$041$blkdone_sig_val;
  wire   [   0:0] pe$041$blkdone_ack_rdy;

  SDPERTL_wrapped_0x5a96c41063a827a4 pe$041
  (
    .clk              ( pe$041$clk ),
    .reset            ( pe$041$reset ),
    .pe_id_msg        ( pe$041$pe_id_msg ),
    .pe_id_val        ( pe$041$pe_id_val ),
    .cm_msg           ( pe$041$cm_msg ),
    .cm_val           ( pe$041$cm_val ),
    .a_feeder_in_msg  ( pe$041$a_feeder_in_msg ),
    .a_feeder_in_val  ( pe$041$a_feeder_in_val ),
    .a_feeder_out_rdy ( pe$041$a_feeder_out_rdy ),
    .xbar_req_rdy     ( pe$041$xbar_req_rdy ),
    .xbar_resp_msg    ( pe$041$xbar_resp_msg ),
    .xbar_resp_val    ( pe$041$xbar_resp_val ),
    .y_unloader_rdy   ( pe$041$y_unloader_rdy ),
    .blkdone_sig_rdy  ( pe$041$blkdone_sig_rdy ),
    .blkdone_ack_msg  ( pe$041$blkdone_ack_msg ),
    .blkdone_ack_val  ( pe$041$blkdone_ack_val ),
    .pe_id_rdy        ( pe$041$pe_id_rdy ),
    .cm_rdy           ( pe$041$cm_rdy ),
    .a_feeder_in_rdy  ( pe$041$a_feeder_in_rdy ),
    .a_feeder_out_msg ( pe$041$a_feeder_out_msg ),
    .a_feeder_out_val ( pe$041$a_feeder_out_val ),
    .xbar_req_msg     ( pe$041$xbar_req_msg ),
    .xbar_req_val     ( pe$041$xbar_req_val ),
    .xbar_resp_rdy    ( pe$041$xbar_resp_rdy ),
    .y_unloader_msg   ( pe$041$y_unloader_msg ),
    .y_unloader_val   ( pe$041$y_unloader_val ),
    .blkdone_sig_msg  ( pe$041$blkdone_sig_msg ),
    .blkdone_sig_val  ( pe$041$blkdone_sig_val ),
    .blkdone_ack_rdy  ( pe$041$blkdone_ack_rdy )
  );

  // pe$042 temporaries
  wire   [   0:0] pe$042$clk;
  wire   [   0:0] pe$042$reset;
  wire   [  63:0] pe$042$pe_id_msg;
  wire   [   0:0] pe$042$pe_id_val;
  wire   [   0:0] pe$042$cm_msg;
  wire   [   0:0] pe$042$cm_val;
  wire   [  63:0] pe$042$a_feeder_in_msg;
  wire   [   0:0] pe$042$a_feeder_in_val;
  wire   [   0:0] pe$042$a_feeder_out_rdy;
  wire   [   0:0] pe$042$xbar_req_rdy;
  wire   [  63:0] pe$042$xbar_resp_msg;
  wire   [   0:0] pe$042$xbar_resp_val;
  wire   [   0:0] pe$042$y_unloader_rdy;
  wire   [   0:0] pe$042$blkdone_sig_rdy;
  wire   [  31:0] pe$042$blkdone_ack_msg;
  wire   [   0:0] pe$042$blkdone_ack_val;
  wire   [   0:0] pe$042$pe_id_rdy;
  wire   [   0:0] pe$042$cm_rdy;
  wire   [   0:0] pe$042$a_feeder_in_rdy;
  wire   [  63:0] pe$042$a_feeder_out_msg;
  wire   [   0:0] pe$042$a_feeder_out_val;
  wire   [  31:0] pe$042$xbar_req_msg;
  wire   [   0:0] pe$042$xbar_req_val;
  wire   [   0:0] pe$042$xbar_resp_rdy;
  wire   [ 127:0] pe$042$y_unloader_msg;
  wire   [   0:0] pe$042$y_unloader_val;
  wire   [  31:0] pe$042$blkdone_sig_msg;
  wire   [   0:0] pe$042$blkdone_sig_val;
  wire   [   0:0] pe$042$blkdone_ack_rdy;

  SDPERTL_wrapped_0x5a96c41063a827a4 pe$042
  (
    .clk              ( pe$042$clk ),
    .reset            ( pe$042$reset ),
    .pe_id_msg        ( pe$042$pe_id_msg ),
    .pe_id_val        ( pe$042$pe_id_val ),
    .cm_msg           ( pe$042$cm_msg ),
    .cm_val           ( pe$042$cm_val ),
    .a_feeder_in_msg  ( pe$042$a_feeder_in_msg ),
    .a_feeder_in_val  ( pe$042$a_feeder_in_val ),
    .a_feeder_out_rdy ( pe$042$a_feeder_out_rdy ),
    .xbar_req_rdy     ( pe$042$xbar_req_rdy ),
    .xbar_resp_msg    ( pe$042$xbar_resp_msg ),
    .xbar_resp_val    ( pe$042$xbar_resp_val ),
    .y_unloader_rdy   ( pe$042$y_unloader_rdy ),
    .blkdone_sig_rdy  ( pe$042$blkdone_sig_rdy ),
    .blkdone_ack_msg  ( pe$042$blkdone_ack_msg ),
    .blkdone_ack_val  ( pe$042$blkdone_ack_val ),
    .pe_id_rdy        ( pe$042$pe_id_rdy ),
    .cm_rdy           ( pe$042$cm_rdy ),
    .a_feeder_in_rdy  ( pe$042$a_feeder_in_rdy ),
    .a_feeder_out_msg ( pe$042$a_feeder_out_msg ),
    .a_feeder_out_val ( pe$042$a_feeder_out_val ),
    .xbar_req_msg     ( pe$042$xbar_req_msg ),
    .xbar_req_val     ( pe$042$xbar_req_val ),
    .xbar_resp_rdy    ( pe$042$xbar_resp_rdy ),
    .y_unloader_msg   ( pe$042$y_unloader_msg ),
    .y_unloader_val   ( pe$042$y_unloader_val ),
    .blkdone_sig_msg  ( pe$042$blkdone_sig_msg ),
    .blkdone_sig_val  ( pe$042$blkdone_sig_val ),
    .blkdone_ack_rdy  ( pe$042$blkdone_ack_rdy )
  );

  // pe$043 temporaries
  wire   [   0:0] pe$043$clk;
  wire   [   0:0] pe$043$reset;
  wire   [  63:0] pe$043$pe_id_msg;
  wire   [   0:0] pe$043$pe_id_val;
  wire   [   0:0] pe$043$cm_msg;
  wire   [   0:0] pe$043$cm_val;
  wire   [  63:0] pe$043$a_feeder_in_msg;
  wire   [   0:0] pe$043$a_feeder_in_val;
  wire   [   0:0] pe$043$a_feeder_out_rdy;
  wire   [   0:0] pe$043$xbar_req_rdy;
  wire   [  63:0] pe$043$xbar_resp_msg;
  wire   [   0:0] pe$043$xbar_resp_val;
  wire   [   0:0] pe$043$y_unloader_rdy;
  wire   [   0:0] pe$043$blkdone_sig_rdy;
  wire   [  31:0] pe$043$blkdone_ack_msg;
  wire   [   0:0] pe$043$blkdone_ack_val;
  wire   [   0:0] pe$043$pe_id_rdy;
  wire   [   0:0] pe$043$cm_rdy;
  wire   [   0:0] pe$043$a_feeder_in_rdy;
  wire   [  63:0] pe$043$a_feeder_out_msg;
  wire   [   0:0] pe$043$a_feeder_out_val;
  wire   [  31:0] pe$043$xbar_req_msg;
  wire   [   0:0] pe$043$xbar_req_val;
  wire   [   0:0] pe$043$xbar_resp_rdy;
  wire   [ 127:0] pe$043$y_unloader_msg;
  wire   [   0:0] pe$043$y_unloader_val;
  wire   [  31:0] pe$043$blkdone_sig_msg;
  wire   [   0:0] pe$043$blkdone_sig_val;
  wire   [   0:0] pe$043$blkdone_ack_rdy;

  SDPERTL_wrapped_0x5a96c41063a827a4 pe$043
  (
    .clk              ( pe$043$clk ),
    .reset            ( pe$043$reset ),
    .pe_id_msg        ( pe$043$pe_id_msg ),
    .pe_id_val        ( pe$043$pe_id_val ),
    .cm_msg           ( pe$043$cm_msg ),
    .cm_val           ( pe$043$cm_val ),
    .a_feeder_in_msg  ( pe$043$a_feeder_in_msg ),
    .a_feeder_in_val  ( pe$043$a_feeder_in_val ),
    .a_feeder_out_rdy ( pe$043$a_feeder_out_rdy ),
    .xbar_req_rdy     ( pe$043$xbar_req_rdy ),
    .xbar_resp_msg    ( pe$043$xbar_resp_msg ),
    .xbar_resp_val    ( pe$043$xbar_resp_val ),
    .y_unloader_rdy   ( pe$043$y_unloader_rdy ),
    .blkdone_sig_rdy  ( pe$043$blkdone_sig_rdy ),
    .blkdone_ack_msg  ( pe$043$blkdone_ack_msg ),
    .blkdone_ack_val  ( pe$043$blkdone_ack_val ),
    .pe_id_rdy        ( pe$043$pe_id_rdy ),
    .cm_rdy           ( pe$043$cm_rdy ),
    .a_feeder_in_rdy  ( pe$043$a_feeder_in_rdy ),
    .a_feeder_out_msg ( pe$043$a_feeder_out_msg ),
    .a_feeder_out_val ( pe$043$a_feeder_out_val ),
    .xbar_req_msg     ( pe$043$xbar_req_msg ),
    .xbar_req_val     ( pe$043$xbar_req_val ),
    .xbar_resp_rdy    ( pe$043$xbar_resp_rdy ),
    .y_unloader_msg   ( pe$043$y_unloader_msg ),
    .y_unloader_val   ( pe$043$y_unloader_val ),
    .blkdone_sig_msg  ( pe$043$blkdone_sig_msg ),
    .blkdone_sig_val  ( pe$043$blkdone_sig_val ),
    .blkdone_ack_rdy  ( pe$043$blkdone_ack_rdy )
  );

  // pe$044 temporaries
  wire   [   0:0] pe$044$clk;
  wire   [   0:0] pe$044$reset;
  wire   [  63:0] pe$044$pe_id_msg;
  wire   [   0:0] pe$044$pe_id_val;
  wire   [   0:0] pe$044$cm_msg;
  wire   [   0:0] pe$044$cm_val;
  wire   [  63:0] pe$044$a_feeder_in_msg;
  wire   [   0:0] pe$044$a_feeder_in_val;
  wire   [   0:0] pe$044$a_feeder_out_rdy;
  wire   [   0:0] pe$044$xbar_req_rdy;
  wire   [  63:0] pe$044$xbar_resp_msg;
  wire   [   0:0] pe$044$xbar_resp_val;
  wire   [   0:0] pe$044$y_unloader_rdy;
  wire   [   0:0] pe$044$blkdone_sig_rdy;
  wire   [  31:0] pe$044$blkdone_ack_msg;
  wire   [   0:0] pe$044$blkdone_ack_val;
  wire   [   0:0] pe$044$pe_id_rdy;
  wire   [   0:0] pe$044$cm_rdy;
  wire   [   0:0] pe$044$a_feeder_in_rdy;
  wire   [  63:0] pe$044$a_feeder_out_msg;
  wire   [   0:0] pe$044$a_feeder_out_val;
  wire   [  31:0] pe$044$xbar_req_msg;
  wire   [   0:0] pe$044$xbar_req_val;
  wire   [   0:0] pe$044$xbar_resp_rdy;
  wire   [ 127:0] pe$044$y_unloader_msg;
  wire   [   0:0] pe$044$y_unloader_val;
  wire   [  31:0] pe$044$blkdone_sig_msg;
  wire   [   0:0] pe$044$blkdone_sig_val;
  wire   [   0:0] pe$044$blkdone_ack_rdy;

  SDPERTL_wrapped_0x5a96c41063a827a4 pe$044
  (
    .clk              ( pe$044$clk ),
    .reset            ( pe$044$reset ),
    .pe_id_msg        ( pe$044$pe_id_msg ),
    .pe_id_val        ( pe$044$pe_id_val ),
    .cm_msg           ( pe$044$cm_msg ),
    .cm_val           ( pe$044$cm_val ),
    .a_feeder_in_msg  ( pe$044$a_feeder_in_msg ),
    .a_feeder_in_val  ( pe$044$a_feeder_in_val ),
    .a_feeder_out_rdy ( pe$044$a_feeder_out_rdy ),
    .xbar_req_rdy     ( pe$044$xbar_req_rdy ),
    .xbar_resp_msg    ( pe$044$xbar_resp_msg ),
    .xbar_resp_val    ( pe$044$xbar_resp_val ),
    .y_unloader_rdy   ( pe$044$y_unloader_rdy ),
    .blkdone_sig_rdy  ( pe$044$blkdone_sig_rdy ),
    .blkdone_ack_msg  ( pe$044$blkdone_ack_msg ),
    .blkdone_ack_val  ( pe$044$blkdone_ack_val ),
    .pe_id_rdy        ( pe$044$pe_id_rdy ),
    .cm_rdy           ( pe$044$cm_rdy ),
    .a_feeder_in_rdy  ( pe$044$a_feeder_in_rdy ),
    .a_feeder_out_msg ( pe$044$a_feeder_out_msg ),
    .a_feeder_out_val ( pe$044$a_feeder_out_val ),
    .xbar_req_msg     ( pe$044$xbar_req_msg ),
    .xbar_req_val     ( pe$044$xbar_req_val ),
    .xbar_resp_rdy    ( pe$044$xbar_resp_rdy ),
    .y_unloader_msg   ( pe$044$y_unloader_msg ),
    .y_unloader_val   ( pe$044$y_unloader_val ),
    .blkdone_sig_msg  ( pe$044$blkdone_sig_msg ),
    .blkdone_sig_val  ( pe$044$blkdone_sig_val ),
    .blkdone_ack_rdy  ( pe$044$blkdone_ack_rdy )
  );

  // pe$045 temporaries
  wire   [   0:0] pe$045$clk;
  wire   [   0:0] pe$045$reset;
  wire   [  63:0] pe$045$pe_id_msg;
  wire   [   0:0] pe$045$pe_id_val;
  wire   [   0:0] pe$045$cm_msg;
  wire   [   0:0] pe$045$cm_val;
  wire   [  63:0] pe$045$a_feeder_in_msg;
  wire   [   0:0] pe$045$a_feeder_in_val;
  wire   [   0:0] pe$045$a_feeder_out_rdy;
  wire   [   0:0] pe$045$xbar_req_rdy;
  wire   [  63:0] pe$045$xbar_resp_msg;
  wire   [   0:0] pe$045$xbar_resp_val;
  wire   [   0:0] pe$045$y_unloader_rdy;
  wire   [   0:0] pe$045$blkdone_sig_rdy;
  wire   [  31:0] pe$045$blkdone_ack_msg;
  wire   [   0:0] pe$045$blkdone_ack_val;
  wire   [   0:0] pe$045$pe_id_rdy;
  wire   [   0:0] pe$045$cm_rdy;
  wire   [   0:0] pe$045$a_feeder_in_rdy;
  wire   [  63:0] pe$045$a_feeder_out_msg;
  wire   [   0:0] pe$045$a_feeder_out_val;
  wire   [  31:0] pe$045$xbar_req_msg;
  wire   [   0:0] pe$045$xbar_req_val;
  wire   [   0:0] pe$045$xbar_resp_rdy;
  wire   [ 127:0] pe$045$y_unloader_msg;
  wire   [   0:0] pe$045$y_unloader_val;
  wire   [  31:0] pe$045$blkdone_sig_msg;
  wire   [   0:0] pe$045$blkdone_sig_val;
  wire   [   0:0] pe$045$blkdone_ack_rdy;

  SDPERTL_wrapped_0x5a96c41063a827a4 pe$045
  (
    .clk              ( pe$045$clk ),
    .reset            ( pe$045$reset ),
    .pe_id_msg        ( pe$045$pe_id_msg ),
    .pe_id_val        ( pe$045$pe_id_val ),
    .cm_msg           ( pe$045$cm_msg ),
    .cm_val           ( pe$045$cm_val ),
    .a_feeder_in_msg  ( pe$045$a_feeder_in_msg ),
    .a_feeder_in_val  ( pe$045$a_feeder_in_val ),
    .a_feeder_out_rdy ( pe$045$a_feeder_out_rdy ),
    .xbar_req_rdy     ( pe$045$xbar_req_rdy ),
    .xbar_resp_msg    ( pe$045$xbar_resp_msg ),
    .xbar_resp_val    ( pe$045$xbar_resp_val ),
    .y_unloader_rdy   ( pe$045$y_unloader_rdy ),
    .blkdone_sig_rdy  ( pe$045$blkdone_sig_rdy ),
    .blkdone_ack_msg  ( pe$045$blkdone_ack_msg ),
    .blkdone_ack_val  ( pe$045$blkdone_ack_val ),
    .pe_id_rdy        ( pe$045$pe_id_rdy ),
    .cm_rdy           ( pe$045$cm_rdy ),
    .a_feeder_in_rdy  ( pe$045$a_feeder_in_rdy ),
    .a_feeder_out_msg ( pe$045$a_feeder_out_msg ),
    .a_feeder_out_val ( pe$045$a_feeder_out_val ),
    .xbar_req_msg     ( pe$045$xbar_req_msg ),
    .xbar_req_val     ( pe$045$xbar_req_val ),
    .xbar_resp_rdy    ( pe$045$xbar_resp_rdy ),
    .y_unloader_msg   ( pe$045$y_unloader_msg ),
    .y_unloader_val   ( pe$045$y_unloader_val ),
    .blkdone_sig_msg  ( pe$045$blkdone_sig_msg ),
    .blkdone_sig_val  ( pe$045$blkdone_sig_val ),
    .blkdone_ack_rdy  ( pe$045$blkdone_ack_rdy )
  );

  // pe$046 temporaries
  wire   [   0:0] pe$046$clk;
  wire   [   0:0] pe$046$reset;
  wire   [  63:0] pe$046$pe_id_msg;
  wire   [   0:0] pe$046$pe_id_val;
  wire   [   0:0] pe$046$cm_msg;
  wire   [   0:0] pe$046$cm_val;
  wire   [  63:0] pe$046$a_feeder_in_msg;
  wire   [   0:0] pe$046$a_feeder_in_val;
  wire   [   0:0] pe$046$a_feeder_out_rdy;
  wire   [   0:0] pe$046$xbar_req_rdy;
  wire   [  63:0] pe$046$xbar_resp_msg;
  wire   [   0:0] pe$046$xbar_resp_val;
  wire   [   0:0] pe$046$y_unloader_rdy;
  wire   [   0:0] pe$046$blkdone_sig_rdy;
  wire   [  31:0] pe$046$blkdone_ack_msg;
  wire   [   0:0] pe$046$blkdone_ack_val;
  wire   [   0:0] pe$046$pe_id_rdy;
  wire   [   0:0] pe$046$cm_rdy;
  wire   [   0:0] pe$046$a_feeder_in_rdy;
  wire   [  63:0] pe$046$a_feeder_out_msg;
  wire   [   0:0] pe$046$a_feeder_out_val;
  wire   [  31:0] pe$046$xbar_req_msg;
  wire   [   0:0] pe$046$xbar_req_val;
  wire   [   0:0] pe$046$xbar_resp_rdy;
  wire   [ 127:0] pe$046$y_unloader_msg;
  wire   [   0:0] pe$046$y_unloader_val;
  wire   [  31:0] pe$046$blkdone_sig_msg;
  wire   [   0:0] pe$046$blkdone_sig_val;
  wire   [   0:0] pe$046$blkdone_ack_rdy;

  SDPERTL_wrapped_0x5a96c41063a827a4 pe$046
  (
    .clk              ( pe$046$clk ),
    .reset            ( pe$046$reset ),
    .pe_id_msg        ( pe$046$pe_id_msg ),
    .pe_id_val        ( pe$046$pe_id_val ),
    .cm_msg           ( pe$046$cm_msg ),
    .cm_val           ( pe$046$cm_val ),
    .a_feeder_in_msg  ( pe$046$a_feeder_in_msg ),
    .a_feeder_in_val  ( pe$046$a_feeder_in_val ),
    .a_feeder_out_rdy ( pe$046$a_feeder_out_rdy ),
    .xbar_req_rdy     ( pe$046$xbar_req_rdy ),
    .xbar_resp_msg    ( pe$046$xbar_resp_msg ),
    .xbar_resp_val    ( pe$046$xbar_resp_val ),
    .y_unloader_rdy   ( pe$046$y_unloader_rdy ),
    .blkdone_sig_rdy  ( pe$046$blkdone_sig_rdy ),
    .blkdone_ack_msg  ( pe$046$blkdone_ack_msg ),
    .blkdone_ack_val  ( pe$046$blkdone_ack_val ),
    .pe_id_rdy        ( pe$046$pe_id_rdy ),
    .cm_rdy           ( pe$046$cm_rdy ),
    .a_feeder_in_rdy  ( pe$046$a_feeder_in_rdy ),
    .a_feeder_out_msg ( pe$046$a_feeder_out_msg ),
    .a_feeder_out_val ( pe$046$a_feeder_out_val ),
    .xbar_req_msg     ( pe$046$xbar_req_msg ),
    .xbar_req_val     ( pe$046$xbar_req_val ),
    .xbar_resp_rdy    ( pe$046$xbar_resp_rdy ),
    .y_unloader_msg   ( pe$046$y_unloader_msg ),
    .y_unloader_val   ( pe$046$y_unloader_val ),
    .blkdone_sig_msg  ( pe$046$blkdone_sig_msg ),
    .blkdone_sig_val  ( pe$046$blkdone_sig_val ),
    .blkdone_ack_rdy  ( pe$046$blkdone_ack_rdy )
  );

  // pe$047 temporaries
  wire   [   0:0] pe$047$clk;
  wire   [   0:0] pe$047$reset;
  wire   [  63:0] pe$047$pe_id_msg;
  wire   [   0:0] pe$047$pe_id_val;
  wire   [   0:0] pe$047$cm_msg;
  wire   [   0:0] pe$047$cm_val;
  wire   [  63:0] pe$047$a_feeder_in_msg;
  wire   [   0:0] pe$047$a_feeder_in_val;
  wire   [   0:0] pe$047$a_feeder_out_rdy;
  wire   [   0:0] pe$047$xbar_req_rdy;
  wire   [  63:0] pe$047$xbar_resp_msg;
  wire   [   0:0] pe$047$xbar_resp_val;
  wire   [   0:0] pe$047$y_unloader_rdy;
  wire   [   0:0] pe$047$blkdone_sig_rdy;
  wire   [  31:0] pe$047$blkdone_ack_msg;
  wire   [   0:0] pe$047$blkdone_ack_val;
  wire   [   0:0] pe$047$pe_id_rdy;
  wire   [   0:0] pe$047$cm_rdy;
  wire   [   0:0] pe$047$a_feeder_in_rdy;
  wire   [  63:0] pe$047$a_feeder_out_msg;
  wire   [   0:0] pe$047$a_feeder_out_val;
  wire   [  31:0] pe$047$xbar_req_msg;
  wire   [   0:0] pe$047$xbar_req_val;
  wire   [   0:0] pe$047$xbar_resp_rdy;
  wire   [ 127:0] pe$047$y_unloader_msg;
  wire   [   0:0] pe$047$y_unloader_val;
  wire   [  31:0] pe$047$blkdone_sig_msg;
  wire   [   0:0] pe$047$blkdone_sig_val;
  wire   [   0:0] pe$047$blkdone_ack_rdy;

  SDPERTL_wrapped_0x5a96c41063a827a4 pe$047
  (
    .clk              ( pe$047$clk ),
    .reset            ( pe$047$reset ),
    .pe_id_msg        ( pe$047$pe_id_msg ),
    .pe_id_val        ( pe$047$pe_id_val ),
    .cm_msg           ( pe$047$cm_msg ),
    .cm_val           ( pe$047$cm_val ),
    .a_feeder_in_msg  ( pe$047$a_feeder_in_msg ),
    .a_feeder_in_val  ( pe$047$a_feeder_in_val ),
    .a_feeder_out_rdy ( pe$047$a_feeder_out_rdy ),
    .xbar_req_rdy     ( pe$047$xbar_req_rdy ),
    .xbar_resp_msg    ( pe$047$xbar_resp_msg ),
    .xbar_resp_val    ( pe$047$xbar_resp_val ),
    .y_unloader_rdy   ( pe$047$y_unloader_rdy ),
    .blkdone_sig_rdy  ( pe$047$blkdone_sig_rdy ),
    .blkdone_ack_msg  ( pe$047$blkdone_ack_msg ),
    .blkdone_ack_val  ( pe$047$blkdone_ack_val ),
    .pe_id_rdy        ( pe$047$pe_id_rdy ),
    .cm_rdy           ( pe$047$cm_rdy ),
    .a_feeder_in_rdy  ( pe$047$a_feeder_in_rdy ),
    .a_feeder_out_msg ( pe$047$a_feeder_out_msg ),
    .a_feeder_out_val ( pe$047$a_feeder_out_val ),
    .xbar_req_msg     ( pe$047$xbar_req_msg ),
    .xbar_req_val     ( pe$047$xbar_req_val ),
    .xbar_resp_rdy    ( pe$047$xbar_resp_rdy ),
    .y_unloader_msg   ( pe$047$y_unloader_msg ),
    .y_unloader_val   ( pe$047$y_unloader_val ),
    .blkdone_sig_msg  ( pe$047$blkdone_sig_msg ),
    .blkdone_sig_val  ( pe$047$blkdone_sig_val ),
    .blkdone_ack_rdy  ( pe$047$blkdone_ack_rdy )
  );

  // pe$048 temporaries
  wire   [   0:0] pe$048$clk;
  wire   [   0:0] pe$048$reset;
  wire   [  63:0] pe$048$pe_id_msg;
  wire   [   0:0] pe$048$pe_id_val;
  wire   [   0:0] pe$048$cm_msg;
  wire   [   0:0] pe$048$cm_val;
  wire   [  63:0] pe$048$a_feeder_in_msg;
  wire   [   0:0] pe$048$a_feeder_in_val;
  wire   [   0:0] pe$048$a_feeder_out_rdy;
  wire   [   0:0] pe$048$xbar_req_rdy;
  wire   [  63:0] pe$048$xbar_resp_msg;
  wire   [   0:0] pe$048$xbar_resp_val;
  wire   [   0:0] pe$048$y_unloader_rdy;
  wire   [   0:0] pe$048$blkdone_sig_rdy;
  wire   [  31:0] pe$048$blkdone_ack_msg;
  wire   [   0:0] pe$048$blkdone_ack_val;
  wire   [   0:0] pe$048$pe_id_rdy;
  wire   [   0:0] pe$048$cm_rdy;
  wire   [   0:0] pe$048$a_feeder_in_rdy;
  wire   [  63:0] pe$048$a_feeder_out_msg;
  wire   [   0:0] pe$048$a_feeder_out_val;
  wire   [  31:0] pe$048$xbar_req_msg;
  wire   [   0:0] pe$048$xbar_req_val;
  wire   [   0:0] pe$048$xbar_resp_rdy;
  wire   [ 127:0] pe$048$y_unloader_msg;
  wire   [   0:0] pe$048$y_unloader_val;
  wire   [  31:0] pe$048$blkdone_sig_msg;
  wire   [   0:0] pe$048$blkdone_sig_val;
  wire   [   0:0] pe$048$blkdone_ack_rdy;

  SDPERTL_wrapped_0x5a96c41063a827a4 pe$048
  (
    .clk              ( pe$048$clk ),
    .reset            ( pe$048$reset ),
    .pe_id_msg        ( pe$048$pe_id_msg ),
    .pe_id_val        ( pe$048$pe_id_val ),
    .cm_msg           ( pe$048$cm_msg ),
    .cm_val           ( pe$048$cm_val ),
    .a_feeder_in_msg  ( pe$048$a_feeder_in_msg ),
    .a_feeder_in_val  ( pe$048$a_feeder_in_val ),
    .a_feeder_out_rdy ( pe$048$a_feeder_out_rdy ),
    .xbar_req_rdy     ( pe$048$xbar_req_rdy ),
    .xbar_resp_msg    ( pe$048$xbar_resp_msg ),
    .xbar_resp_val    ( pe$048$xbar_resp_val ),
    .y_unloader_rdy   ( pe$048$y_unloader_rdy ),
    .blkdone_sig_rdy  ( pe$048$blkdone_sig_rdy ),
    .blkdone_ack_msg  ( pe$048$blkdone_ack_msg ),
    .blkdone_ack_val  ( pe$048$blkdone_ack_val ),
    .pe_id_rdy        ( pe$048$pe_id_rdy ),
    .cm_rdy           ( pe$048$cm_rdy ),
    .a_feeder_in_rdy  ( pe$048$a_feeder_in_rdy ),
    .a_feeder_out_msg ( pe$048$a_feeder_out_msg ),
    .a_feeder_out_val ( pe$048$a_feeder_out_val ),
    .xbar_req_msg     ( pe$048$xbar_req_msg ),
    .xbar_req_val     ( pe$048$xbar_req_val ),
    .xbar_resp_rdy    ( pe$048$xbar_resp_rdy ),
    .y_unloader_msg   ( pe$048$y_unloader_msg ),
    .y_unloader_val   ( pe$048$y_unloader_val ),
    .blkdone_sig_msg  ( pe$048$blkdone_sig_msg ),
    .blkdone_sig_val  ( pe$048$blkdone_sig_val ),
    .blkdone_ack_rdy  ( pe$048$blkdone_ack_rdy )
  );

  // pe$049 temporaries
  wire   [   0:0] pe$049$clk;
  wire   [   0:0] pe$049$reset;
  wire   [  63:0] pe$049$pe_id_msg;
  wire   [   0:0] pe$049$pe_id_val;
  wire   [   0:0] pe$049$cm_msg;
  wire   [   0:0] pe$049$cm_val;
  wire   [  63:0] pe$049$a_feeder_in_msg;
  wire   [   0:0] pe$049$a_feeder_in_val;
  wire   [   0:0] pe$049$a_feeder_out_rdy;
  wire   [   0:0] pe$049$xbar_req_rdy;
  wire   [  63:0] pe$049$xbar_resp_msg;
  wire   [   0:0] pe$049$xbar_resp_val;
  wire   [   0:0] pe$049$y_unloader_rdy;
  wire   [   0:0] pe$049$blkdone_sig_rdy;
  wire   [  31:0] pe$049$blkdone_ack_msg;
  wire   [   0:0] pe$049$blkdone_ack_val;
  wire   [   0:0] pe$049$pe_id_rdy;
  wire   [   0:0] pe$049$cm_rdy;
  wire   [   0:0] pe$049$a_feeder_in_rdy;
  wire   [  63:0] pe$049$a_feeder_out_msg;
  wire   [   0:0] pe$049$a_feeder_out_val;
  wire   [  31:0] pe$049$xbar_req_msg;
  wire   [   0:0] pe$049$xbar_req_val;
  wire   [   0:0] pe$049$xbar_resp_rdy;
  wire   [ 127:0] pe$049$y_unloader_msg;
  wire   [   0:0] pe$049$y_unloader_val;
  wire   [  31:0] pe$049$blkdone_sig_msg;
  wire   [   0:0] pe$049$blkdone_sig_val;
  wire   [   0:0] pe$049$blkdone_ack_rdy;

  SDPERTL_wrapped_0x5a96c41063a827a4 pe$049
  (
    .clk              ( pe$049$clk ),
    .reset            ( pe$049$reset ),
    .pe_id_msg        ( pe$049$pe_id_msg ),
    .pe_id_val        ( pe$049$pe_id_val ),
    .cm_msg           ( pe$049$cm_msg ),
    .cm_val           ( pe$049$cm_val ),
    .a_feeder_in_msg  ( pe$049$a_feeder_in_msg ),
    .a_feeder_in_val  ( pe$049$a_feeder_in_val ),
    .a_feeder_out_rdy ( pe$049$a_feeder_out_rdy ),
    .xbar_req_rdy     ( pe$049$xbar_req_rdy ),
    .xbar_resp_msg    ( pe$049$xbar_resp_msg ),
    .xbar_resp_val    ( pe$049$xbar_resp_val ),
    .y_unloader_rdy   ( pe$049$y_unloader_rdy ),
    .blkdone_sig_rdy  ( pe$049$blkdone_sig_rdy ),
    .blkdone_ack_msg  ( pe$049$blkdone_ack_msg ),
    .blkdone_ack_val  ( pe$049$blkdone_ack_val ),
    .pe_id_rdy        ( pe$049$pe_id_rdy ),
    .cm_rdy           ( pe$049$cm_rdy ),
    .a_feeder_in_rdy  ( pe$049$a_feeder_in_rdy ),
    .a_feeder_out_msg ( pe$049$a_feeder_out_msg ),
    .a_feeder_out_val ( pe$049$a_feeder_out_val ),
    .xbar_req_msg     ( pe$049$xbar_req_msg ),
    .xbar_req_val     ( pe$049$xbar_req_val ),
    .xbar_resp_rdy    ( pe$049$xbar_resp_rdy ),
    .y_unloader_msg   ( pe$049$y_unloader_msg ),
    .y_unloader_val   ( pe$049$y_unloader_val ),
    .blkdone_sig_msg  ( pe$049$blkdone_sig_msg ),
    .blkdone_sig_val  ( pe$049$blkdone_sig_val ),
    .blkdone_ack_rdy  ( pe$049$blkdone_ack_rdy )
  );

  // pe$050 temporaries
  wire   [   0:0] pe$050$clk;
  wire   [   0:0] pe$050$reset;
  wire   [  63:0] pe$050$pe_id_msg;
  wire   [   0:0] pe$050$pe_id_val;
  wire   [   0:0] pe$050$cm_msg;
  wire   [   0:0] pe$050$cm_val;
  wire   [  63:0] pe$050$a_feeder_in_msg;
  wire   [   0:0] pe$050$a_feeder_in_val;
  wire   [   0:0] pe$050$a_feeder_out_rdy;
  wire   [   0:0] pe$050$xbar_req_rdy;
  wire   [  63:0] pe$050$xbar_resp_msg;
  wire   [   0:0] pe$050$xbar_resp_val;
  wire   [   0:0] pe$050$y_unloader_rdy;
  wire   [   0:0] pe$050$blkdone_sig_rdy;
  wire   [  31:0] pe$050$blkdone_ack_msg;
  wire   [   0:0] pe$050$blkdone_ack_val;
  wire   [   0:0] pe$050$pe_id_rdy;
  wire   [   0:0] pe$050$cm_rdy;
  wire   [   0:0] pe$050$a_feeder_in_rdy;
  wire   [  63:0] pe$050$a_feeder_out_msg;
  wire   [   0:0] pe$050$a_feeder_out_val;
  wire   [  31:0] pe$050$xbar_req_msg;
  wire   [   0:0] pe$050$xbar_req_val;
  wire   [   0:0] pe$050$xbar_resp_rdy;
  wire   [ 127:0] pe$050$y_unloader_msg;
  wire   [   0:0] pe$050$y_unloader_val;
  wire   [  31:0] pe$050$blkdone_sig_msg;
  wire   [   0:0] pe$050$blkdone_sig_val;
  wire   [   0:0] pe$050$blkdone_ack_rdy;

  SDPERTL_wrapped_0x5a96c41063a827a4 pe$050
  (
    .clk              ( pe$050$clk ),
    .reset            ( pe$050$reset ),
    .pe_id_msg        ( pe$050$pe_id_msg ),
    .pe_id_val        ( pe$050$pe_id_val ),
    .cm_msg           ( pe$050$cm_msg ),
    .cm_val           ( pe$050$cm_val ),
    .a_feeder_in_msg  ( pe$050$a_feeder_in_msg ),
    .a_feeder_in_val  ( pe$050$a_feeder_in_val ),
    .a_feeder_out_rdy ( pe$050$a_feeder_out_rdy ),
    .xbar_req_rdy     ( pe$050$xbar_req_rdy ),
    .xbar_resp_msg    ( pe$050$xbar_resp_msg ),
    .xbar_resp_val    ( pe$050$xbar_resp_val ),
    .y_unloader_rdy   ( pe$050$y_unloader_rdy ),
    .blkdone_sig_rdy  ( pe$050$blkdone_sig_rdy ),
    .blkdone_ack_msg  ( pe$050$blkdone_ack_msg ),
    .blkdone_ack_val  ( pe$050$blkdone_ack_val ),
    .pe_id_rdy        ( pe$050$pe_id_rdy ),
    .cm_rdy           ( pe$050$cm_rdy ),
    .a_feeder_in_rdy  ( pe$050$a_feeder_in_rdy ),
    .a_feeder_out_msg ( pe$050$a_feeder_out_msg ),
    .a_feeder_out_val ( pe$050$a_feeder_out_val ),
    .xbar_req_msg     ( pe$050$xbar_req_msg ),
    .xbar_req_val     ( pe$050$xbar_req_val ),
    .xbar_resp_rdy    ( pe$050$xbar_resp_rdy ),
    .y_unloader_msg   ( pe$050$y_unloader_msg ),
    .y_unloader_val   ( pe$050$y_unloader_val ),
    .blkdone_sig_msg  ( pe$050$blkdone_sig_msg ),
    .blkdone_sig_val  ( pe$050$blkdone_sig_val ),
    .blkdone_ack_rdy  ( pe$050$blkdone_ack_rdy )
  );

  // pe$051 temporaries
  wire   [   0:0] pe$051$clk;
  wire   [   0:0] pe$051$reset;
  wire   [  63:0] pe$051$pe_id_msg;
  wire   [   0:0] pe$051$pe_id_val;
  wire   [   0:0] pe$051$cm_msg;
  wire   [   0:0] pe$051$cm_val;
  wire   [  63:0] pe$051$a_feeder_in_msg;
  wire   [   0:0] pe$051$a_feeder_in_val;
  wire   [   0:0] pe$051$a_feeder_out_rdy;
  wire   [   0:0] pe$051$xbar_req_rdy;
  wire   [  63:0] pe$051$xbar_resp_msg;
  wire   [   0:0] pe$051$xbar_resp_val;
  wire   [   0:0] pe$051$y_unloader_rdy;
  wire   [   0:0] pe$051$blkdone_sig_rdy;
  wire   [  31:0] pe$051$blkdone_ack_msg;
  wire   [   0:0] pe$051$blkdone_ack_val;
  wire   [   0:0] pe$051$pe_id_rdy;
  wire   [   0:0] pe$051$cm_rdy;
  wire   [   0:0] pe$051$a_feeder_in_rdy;
  wire   [  63:0] pe$051$a_feeder_out_msg;
  wire   [   0:0] pe$051$a_feeder_out_val;
  wire   [  31:0] pe$051$xbar_req_msg;
  wire   [   0:0] pe$051$xbar_req_val;
  wire   [   0:0] pe$051$xbar_resp_rdy;
  wire   [ 127:0] pe$051$y_unloader_msg;
  wire   [   0:0] pe$051$y_unloader_val;
  wire   [  31:0] pe$051$blkdone_sig_msg;
  wire   [   0:0] pe$051$blkdone_sig_val;
  wire   [   0:0] pe$051$blkdone_ack_rdy;

  SDPERTL_wrapped_0x5a96c41063a827a4 pe$051
  (
    .clk              ( pe$051$clk ),
    .reset            ( pe$051$reset ),
    .pe_id_msg        ( pe$051$pe_id_msg ),
    .pe_id_val        ( pe$051$pe_id_val ),
    .cm_msg           ( pe$051$cm_msg ),
    .cm_val           ( pe$051$cm_val ),
    .a_feeder_in_msg  ( pe$051$a_feeder_in_msg ),
    .a_feeder_in_val  ( pe$051$a_feeder_in_val ),
    .a_feeder_out_rdy ( pe$051$a_feeder_out_rdy ),
    .xbar_req_rdy     ( pe$051$xbar_req_rdy ),
    .xbar_resp_msg    ( pe$051$xbar_resp_msg ),
    .xbar_resp_val    ( pe$051$xbar_resp_val ),
    .y_unloader_rdy   ( pe$051$y_unloader_rdy ),
    .blkdone_sig_rdy  ( pe$051$blkdone_sig_rdy ),
    .blkdone_ack_msg  ( pe$051$blkdone_ack_msg ),
    .blkdone_ack_val  ( pe$051$blkdone_ack_val ),
    .pe_id_rdy        ( pe$051$pe_id_rdy ),
    .cm_rdy           ( pe$051$cm_rdy ),
    .a_feeder_in_rdy  ( pe$051$a_feeder_in_rdy ),
    .a_feeder_out_msg ( pe$051$a_feeder_out_msg ),
    .a_feeder_out_val ( pe$051$a_feeder_out_val ),
    .xbar_req_msg     ( pe$051$xbar_req_msg ),
    .xbar_req_val     ( pe$051$xbar_req_val ),
    .xbar_resp_rdy    ( pe$051$xbar_resp_rdy ),
    .y_unloader_msg   ( pe$051$y_unloader_msg ),
    .y_unloader_val   ( pe$051$y_unloader_val ),
    .blkdone_sig_msg  ( pe$051$blkdone_sig_msg ),
    .blkdone_sig_val  ( pe$051$blkdone_sig_val ),
    .blkdone_ack_rdy  ( pe$051$blkdone_ack_rdy )
  );

  // pe$052 temporaries
  wire   [   0:0] pe$052$clk;
  wire   [   0:0] pe$052$reset;
  wire   [  63:0] pe$052$pe_id_msg;
  wire   [   0:0] pe$052$pe_id_val;
  wire   [   0:0] pe$052$cm_msg;
  wire   [   0:0] pe$052$cm_val;
  wire   [  63:0] pe$052$a_feeder_in_msg;
  wire   [   0:0] pe$052$a_feeder_in_val;
  wire   [   0:0] pe$052$a_feeder_out_rdy;
  wire   [   0:0] pe$052$xbar_req_rdy;
  wire   [  63:0] pe$052$xbar_resp_msg;
  wire   [   0:0] pe$052$xbar_resp_val;
  wire   [   0:0] pe$052$y_unloader_rdy;
  wire   [   0:0] pe$052$blkdone_sig_rdy;
  wire   [  31:0] pe$052$blkdone_ack_msg;
  wire   [   0:0] pe$052$blkdone_ack_val;
  wire   [   0:0] pe$052$pe_id_rdy;
  wire   [   0:0] pe$052$cm_rdy;
  wire   [   0:0] pe$052$a_feeder_in_rdy;
  wire   [  63:0] pe$052$a_feeder_out_msg;
  wire   [   0:0] pe$052$a_feeder_out_val;
  wire   [  31:0] pe$052$xbar_req_msg;
  wire   [   0:0] pe$052$xbar_req_val;
  wire   [   0:0] pe$052$xbar_resp_rdy;
  wire   [ 127:0] pe$052$y_unloader_msg;
  wire   [   0:0] pe$052$y_unloader_val;
  wire   [  31:0] pe$052$blkdone_sig_msg;
  wire   [   0:0] pe$052$blkdone_sig_val;
  wire   [   0:0] pe$052$blkdone_ack_rdy;

  SDPERTL_wrapped_0x5a96c41063a827a4 pe$052
  (
    .clk              ( pe$052$clk ),
    .reset            ( pe$052$reset ),
    .pe_id_msg        ( pe$052$pe_id_msg ),
    .pe_id_val        ( pe$052$pe_id_val ),
    .cm_msg           ( pe$052$cm_msg ),
    .cm_val           ( pe$052$cm_val ),
    .a_feeder_in_msg  ( pe$052$a_feeder_in_msg ),
    .a_feeder_in_val  ( pe$052$a_feeder_in_val ),
    .a_feeder_out_rdy ( pe$052$a_feeder_out_rdy ),
    .xbar_req_rdy     ( pe$052$xbar_req_rdy ),
    .xbar_resp_msg    ( pe$052$xbar_resp_msg ),
    .xbar_resp_val    ( pe$052$xbar_resp_val ),
    .y_unloader_rdy   ( pe$052$y_unloader_rdy ),
    .blkdone_sig_rdy  ( pe$052$blkdone_sig_rdy ),
    .blkdone_ack_msg  ( pe$052$blkdone_ack_msg ),
    .blkdone_ack_val  ( pe$052$blkdone_ack_val ),
    .pe_id_rdy        ( pe$052$pe_id_rdy ),
    .cm_rdy           ( pe$052$cm_rdy ),
    .a_feeder_in_rdy  ( pe$052$a_feeder_in_rdy ),
    .a_feeder_out_msg ( pe$052$a_feeder_out_msg ),
    .a_feeder_out_val ( pe$052$a_feeder_out_val ),
    .xbar_req_msg     ( pe$052$xbar_req_msg ),
    .xbar_req_val     ( pe$052$xbar_req_val ),
    .xbar_resp_rdy    ( pe$052$xbar_resp_rdy ),
    .y_unloader_msg   ( pe$052$y_unloader_msg ),
    .y_unloader_val   ( pe$052$y_unloader_val ),
    .blkdone_sig_msg  ( pe$052$blkdone_sig_msg ),
    .blkdone_sig_val  ( pe$052$blkdone_sig_val ),
    .blkdone_ack_rdy  ( pe$052$blkdone_ack_rdy )
  );

  // pe$053 temporaries
  wire   [   0:0] pe$053$clk;
  wire   [   0:0] pe$053$reset;
  wire   [  63:0] pe$053$pe_id_msg;
  wire   [   0:0] pe$053$pe_id_val;
  wire   [   0:0] pe$053$cm_msg;
  wire   [   0:0] pe$053$cm_val;
  wire   [  63:0] pe$053$a_feeder_in_msg;
  wire   [   0:0] pe$053$a_feeder_in_val;
  wire   [   0:0] pe$053$a_feeder_out_rdy;
  wire   [   0:0] pe$053$xbar_req_rdy;
  wire   [  63:0] pe$053$xbar_resp_msg;
  wire   [   0:0] pe$053$xbar_resp_val;
  wire   [   0:0] pe$053$y_unloader_rdy;
  wire   [   0:0] pe$053$blkdone_sig_rdy;
  wire   [  31:0] pe$053$blkdone_ack_msg;
  wire   [   0:0] pe$053$blkdone_ack_val;
  wire   [   0:0] pe$053$pe_id_rdy;
  wire   [   0:0] pe$053$cm_rdy;
  wire   [   0:0] pe$053$a_feeder_in_rdy;
  wire   [  63:0] pe$053$a_feeder_out_msg;
  wire   [   0:0] pe$053$a_feeder_out_val;
  wire   [  31:0] pe$053$xbar_req_msg;
  wire   [   0:0] pe$053$xbar_req_val;
  wire   [   0:0] pe$053$xbar_resp_rdy;
  wire   [ 127:0] pe$053$y_unloader_msg;
  wire   [   0:0] pe$053$y_unloader_val;
  wire   [  31:0] pe$053$blkdone_sig_msg;
  wire   [   0:0] pe$053$blkdone_sig_val;
  wire   [   0:0] pe$053$blkdone_ack_rdy;

  SDPERTL_wrapped_0x5a96c41063a827a4 pe$053
  (
    .clk              ( pe$053$clk ),
    .reset            ( pe$053$reset ),
    .pe_id_msg        ( pe$053$pe_id_msg ),
    .pe_id_val        ( pe$053$pe_id_val ),
    .cm_msg           ( pe$053$cm_msg ),
    .cm_val           ( pe$053$cm_val ),
    .a_feeder_in_msg  ( pe$053$a_feeder_in_msg ),
    .a_feeder_in_val  ( pe$053$a_feeder_in_val ),
    .a_feeder_out_rdy ( pe$053$a_feeder_out_rdy ),
    .xbar_req_rdy     ( pe$053$xbar_req_rdy ),
    .xbar_resp_msg    ( pe$053$xbar_resp_msg ),
    .xbar_resp_val    ( pe$053$xbar_resp_val ),
    .y_unloader_rdy   ( pe$053$y_unloader_rdy ),
    .blkdone_sig_rdy  ( pe$053$blkdone_sig_rdy ),
    .blkdone_ack_msg  ( pe$053$blkdone_ack_msg ),
    .blkdone_ack_val  ( pe$053$blkdone_ack_val ),
    .pe_id_rdy        ( pe$053$pe_id_rdy ),
    .cm_rdy           ( pe$053$cm_rdy ),
    .a_feeder_in_rdy  ( pe$053$a_feeder_in_rdy ),
    .a_feeder_out_msg ( pe$053$a_feeder_out_msg ),
    .a_feeder_out_val ( pe$053$a_feeder_out_val ),
    .xbar_req_msg     ( pe$053$xbar_req_msg ),
    .xbar_req_val     ( pe$053$xbar_req_val ),
    .xbar_resp_rdy    ( pe$053$xbar_resp_rdy ),
    .y_unloader_msg   ( pe$053$y_unloader_msg ),
    .y_unloader_val   ( pe$053$y_unloader_val ),
    .blkdone_sig_msg  ( pe$053$blkdone_sig_msg ),
    .blkdone_sig_val  ( pe$053$blkdone_sig_val ),
    .blkdone_ack_rdy  ( pe$053$blkdone_ack_rdy )
  );

  // pe$054 temporaries
  wire   [   0:0] pe$054$clk;
  wire   [   0:0] pe$054$reset;
  wire   [  63:0] pe$054$pe_id_msg;
  wire   [   0:0] pe$054$pe_id_val;
  wire   [   0:0] pe$054$cm_msg;
  wire   [   0:0] pe$054$cm_val;
  wire   [  63:0] pe$054$a_feeder_in_msg;
  wire   [   0:0] pe$054$a_feeder_in_val;
  wire   [   0:0] pe$054$a_feeder_out_rdy;
  wire   [   0:0] pe$054$xbar_req_rdy;
  wire   [  63:0] pe$054$xbar_resp_msg;
  wire   [   0:0] pe$054$xbar_resp_val;
  wire   [   0:0] pe$054$y_unloader_rdy;
  wire   [   0:0] pe$054$blkdone_sig_rdy;
  wire   [  31:0] pe$054$blkdone_ack_msg;
  wire   [   0:0] pe$054$blkdone_ack_val;
  wire   [   0:0] pe$054$pe_id_rdy;
  wire   [   0:0] pe$054$cm_rdy;
  wire   [   0:0] pe$054$a_feeder_in_rdy;
  wire   [  63:0] pe$054$a_feeder_out_msg;
  wire   [   0:0] pe$054$a_feeder_out_val;
  wire   [  31:0] pe$054$xbar_req_msg;
  wire   [   0:0] pe$054$xbar_req_val;
  wire   [   0:0] pe$054$xbar_resp_rdy;
  wire   [ 127:0] pe$054$y_unloader_msg;
  wire   [   0:0] pe$054$y_unloader_val;
  wire   [  31:0] pe$054$blkdone_sig_msg;
  wire   [   0:0] pe$054$blkdone_sig_val;
  wire   [   0:0] pe$054$blkdone_ack_rdy;

  SDPERTL_wrapped_0x5a96c41063a827a4 pe$054
  (
    .clk              ( pe$054$clk ),
    .reset            ( pe$054$reset ),
    .pe_id_msg        ( pe$054$pe_id_msg ),
    .pe_id_val        ( pe$054$pe_id_val ),
    .cm_msg           ( pe$054$cm_msg ),
    .cm_val           ( pe$054$cm_val ),
    .a_feeder_in_msg  ( pe$054$a_feeder_in_msg ),
    .a_feeder_in_val  ( pe$054$a_feeder_in_val ),
    .a_feeder_out_rdy ( pe$054$a_feeder_out_rdy ),
    .xbar_req_rdy     ( pe$054$xbar_req_rdy ),
    .xbar_resp_msg    ( pe$054$xbar_resp_msg ),
    .xbar_resp_val    ( pe$054$xbar_resp_val ),
    .y_unloader_rdy   ( pe$054$y_unloader_rdy ),
    .blkdone_sig_rdy  ( pe$054$blkdone_sig_rdy ),
    .blkdone_ack_msg  ( pe$054$blkdone_ack_msg ),
    .blkdone_ack_val  ( pe$054$blkdone_ack_val ),
    .pe_id_rdy        ( pe$054$pe_id_rdy ),
    .cm_rdy           ( pe$054$cm_rdy ),
    .a_feeder_in_rdy  ( pe$054$a_feeder_in_rdy ),
    .a_feeder_out_msg ( pe$054$a_feeder_out_msg ),
    .a_feeder_out_val ( pe$054$a_feeder_out_val ),
    .xbar_req_msg     ( pe$054$xbar_req_msg ),
    .xbar_req_val     ( pe$054$xbar_req_val ),
    .xbar_resp_rdy    ( pe$054$xbar_resp_rdy ),
    .y_unloader_msg   ( pe$054$y_unloader_msg ),
    .y_unloader_val   ( pe$054$y_unloader_val ),
    .blkdone_sig_msg  ( pe$054$blkdone_sig_msg ),
    .blkdone_sig_val  ( pe$054$blkdone_sig_val ),
    .blkdone_ack_rdy  ( pe$054$blkdone_ack_rdy )
  );

  // pe$055 temporaries
  wire   [   0:0] pe$055$clk;
  wire   [   0:0] pe$055$reset;
  wire   [  63:0] pe$055$pe_id_msg;
  wire   [   0:0] pe$055$pe_id_val;
  wire   [   0:0] pe$055$cm_msg;
  wire   [   0:0] pe$055$cm_val;
  wire   [  63:0] pe$055$a_feeder_in_msg;
  wire   [   0:0] pe$055$a_feeder_in_val;
  wire   [   0:0] pe$055$a_feeder_out_rdy;
  wire   [   0:0] pe$055$xbar_req_rdy;
  wire   [  63:0] pe$055$xbar_resp_msg;
  wire   [   0:0] pe$055$xbar_resp_val;
  wire   [   0:0] pe$055$y_unloader_rdy;
  wire   [   0:0] pe$055$blkdone_sig_rdy;
  wire   [  31:0] pe$055$blkdone_ack_msg;
  wire   [   0:0] pe$055$blkdone_ack_val;
  wire   [   0:0] pe$055$pe_id_rdy;
  wire   [   0:0] pe$055$cm_rdy;
  wire   [   0:0] pe$055$a_feeder_in_rdy;
  wire   [  63:0] pe$055$a_feeder_out_msg;
  wire   [   0:0] pe$055$a_feeder_out_val;
  wire   [  31:0] pe$055$xbar_req_msg;
  wire   [   0:0] pe$055$xbar_req_val;
  wire   [   0:0] pe$055$xbar_resp_rdy;
  wire   [ 127:0] pe$055$y_unloader_msg;
  wire   [   0:0] pe$055$y_unloader_val;
  wire   [  31:0] pe$055$blkdone_sig_msg;
  wire   [   0:0] pe$055$blkdone_sig_val;
  wire   [   0:0] pe$055$blkdone_ack_rdy;

  SDPERTL_wrapped_0x5a96c41063a827a4 pe$055
  (
    .clk              ( pe$055$clk ),
    .reset            ( pe$055$reset ),
    .pe_id_msg        ( pe$055$pe_id_msg ),
    .pe_id_val        ( pe$055$pe_id_val ),
    .cm_msg           ( pe$055$cm_msg ),
    .cm_val           ( pe$055$cm_val ),
    .a_feeder_in_msg  ( pe$055$a_feeder_in_msg ),
    .a_feeder_in_val  ( pe$055$a_feeder_in_val ),
    .a_feeder_out_rdy ( pe$055$a_feeder_out_rdy ),
    .xbar_req_rdy     ( pe$055$xbar_req_rdy ),
    .xbar_resp_msg    ( pe$055$xbar_resp_msg ),
    .xbar_resp_val    ( pe$055$xbar_resp_val ),
    .y_unloader_rdy   ( pe$055$y_unloader_rdy ),
    .blkdone_sig_rdy  ( pe$055$blkdone_sig_rdy ),
    .blkdone_ack_msg  ( pe$055$blkdone_ack_msg ),
    .blkdone_ack_val  ( pe$055$blkdone_ack_val ),
    .pe_id_rdy        ( pe$055$pe_id_rdy ),
    .cm_rdy           ( pe$055$cm_rdy ),
    .a_feeder_in_rdy  ( pe$055$a_feeder_in_rdy ),
    .a_feeder_out_msg ( pe$055$a_feeder_out_msg ),
    .a_feeder_out_val ( pe$055$a_feeder_out_val ),
    .xbar_req_msg     ( pe$055$xbar_req_msg ),
    .xbar_req_val     ( pe$055$xbar_req_val ),
    .xbar_resp_rdy    ( pe$055$xbar_resp_rdy ),
    .y_unloader_msg   ( pe$055$y_unloader_msg ),
    .y_unloader_val   ( pe$055$y_unloader_val ),
    .blkdone_sig_msg  ( pe$055$blkdone_sig_msg ),
    .blkdone_sig_val  ( pe$055$blkdone_sig_val ),
    .blkdone_ack_rdy  ( pe$055$blkdone_ack_rdy )
  );

  // pe$056 temporaries
  wire   [   0:0] pe$056$clk;
  wire   [   0:0] pe$056$reset;
  wire   [  63:0] pe$056$pe_id_msg;
  wire   [   0:0] pe$056$pe_id_val;
  wire   [   0:0] pe$056$cm_msg;
  wire   [   0:0] pe$056$cm_val;
  wire   [  63:0] pe$056$a_feeder_in_msg;
  wire   [   0:0] pe$056$a_feeder_in_val;
  wire   [   0:0] pe$056$a_feeder_out_rdy;
  wire   [   0:0] pe$056$xbar_req_rdy;
  wire   [  63:0] pe$056$xbar_resp_msg;
  wire   [   0:0] pe$056$xbar_resp_val;
  wire   [   0:0] pe$056$y_unloader_rdy;
  wire   [   0:0] pe$056$blkdone_sig_rdy;
  wire   [  31:0] pe$056$blkdone_ack_msg;
  wire   [   0:0] pe$056$blkdone_ack_val;
  wire   [   0:0] pe$056$pe_id_rdy;
  wire   [   0:0] pe$056$cm_rdy;
  wire   [   0:0] pe$056$a_feeder_in_rdy;
  wire   [  63:0] pe$056$a_feeder_out_msg;
  wire   [   0:0] pe$056$a_feeder_out_val;
  wire   [  31:0] pe$056$xbar_req_msg;
  wire   [   0:0] pe$056$xbar_req_val;
  wire   [   0:0] pe$056$xbar_resp_rdy;
  wire   [ 127:0] pe$056$y_unloader_msg;
  wire   [   0:0] pe$056$y_unloader_val;
  wire   [  31:0] pe$056$blkdone_sig_msg;
  wire   [   0:0] pe$056$blkdone_sig_val;
  wire   [   0:0] pe$056$blkdone_ack_rdy;

  SDPERTL_wrapped_0x5a96c41063a827a4 pe$056
  (
    .clk              ( pe$056$clk ),
    .reset            ( pe$056$reset ),
    .pe_id_msg        ( pe$056$pe_id_msg ),
    .pe_id_val        ( pe$056$pe_id_val ),
    .cm_msg           ( pe$056$cm_msg ),
    .cm_val           ( pe$056$cm_val ),
    .a_feeder_in_msg  ( pe$056$a_feeder_in_msg ),
    .a_feeder_in_val  ( pe$056$a_feeder_in_val ),
    .a_feeder_out_rdy ( pe$056$a_feeder_out_rdy ),
    .xbar_req_rdy     ( pe$056$xbar_req_rdy ),
    .xbar_resp_msg    ( pe$056$xbar_resp_msg ),
    .xbar_resp_val    ( pe$056$xbar_resp_val ),
    .y_unloader_rdy   ( pe$056$y_unloader_rdy ),
    .blkdone_sig_rdy  ( pe$056$blkdone_sig_rdy ),
    .blkdone_ack_msg  ( pe$056$blkdone_ack_msg ),
    .blkdone_ack_val  ( pe$056$blkdone_ack_val ),
    .pe_id_rdy        ( pe$056$pe_id_rdy ),
    .cm_rdy           ( pe$056$cm_rdy ),
    .a_feeder_in_rdy  ( pe$056$a_feeder_in_rdy ),
    .a_feeder_out_msg ( pe$056$a_feeder_out_msg ),
    .a_feeder_out_val ( pe$056$a_feeder_out_val ),
    .xbar_req_msg     ( pe$056$xbar_req_msg ),
    .xbar_req_val     ( pe$056$xbar_req_val ),
    .xbar_resp_rdy    ( pe$056$xbar_resp_rdy ),
    .y_unloader_msg   ( pe$056$y_unloader_msg ),
    .y_unloader_val   ( pe$056$y_unloader_val ),
    .blkdone_sig_msg  ( pe$056$blkdone_sig_msg ),
    .blkdone_sig_val  ( pe$056$blkdone_sig_val ),
    .blkdone_ack_rdy  ( pe$056$blkdone_ack_rdy )
  );

  // pe$057 temporaries
  wire   [   0:0] pe$057$clk;
  wire   [   0:0] pe$057$reset;
  wire   [  63:0] pe$057$pe_id_msg;
  wire   [   0:0] pe$057$pe_id_val;
  wire   [   0:0] pe$057$cm_msg;
  wire   [   0:0] pe$057$cm_val;
  wire   [  63:0] pe$057$a_feeder_in_msg;
  wire   [   0:0] pe$057$a_feeder_in_val;
  wire   [   0:0] pe$057$a_feeder_out_rdy;
  wire   [   0:0] pe$057$xbar_req_rdy;
  wire   [  63:0] pe$057$xbar_resp_msg;
  wire   [   0:0] pe$057$xbar_resp_val;
  wire   [   0:0] pe$057$y_unloader_rdy;
  wire   [   0:0] pe$057$blkdone_sig_rdy;
  wire   [  31:0] pe$057$blkdone_ack_msg;
  wire   [   0:0] pe$057$blkdone_ack_val;
  wire   [   0:0] pe$057$pe_id_rdy;
  wire   [   0:0] pe$057$cm_rdy;
  wire   [   0:0] pe$057$a_feeder_in_rdy;
  wire   [  63:0] pe$057$a_feeder_out_msg;
  wire   [   0:0] pe$057$a_feeder_out_val;
  wire   [  31:0] pe$057$xbar_req_msg;
  wire   [   0:0] pe$057$xbar_req_val;
  wire   [   0:0] pe$057$xbar_resp_rdy;
  wire   [ 127:0] pe$057$y_unloader_msg;
  wire   [   0:0] pe$057$y_unloader_val;
  wire   [  31:0] pe$057$blkdone_sig_msg;
  wire   [   0:0] pe$057$blkdone_sig_val;
  wire   [   0:0] pe$057$blkdone_ack_rdy;

  SDPERTL_wrapped_0x5a96c41063a827a4 pe$057
  (
    .clk              ( pe$057$clk ),
    .reset            ( pe$057$reset ),
    .pe_id_msg        ( pe$057$pe_id_msg ),
    .pe_id_val        ( pe$057$pe_id_val ),
    .cm_msg           ( pe$057$cm_msg ),
    .cm_val           ( pe$057$cm_val ),
    .a_feeder_in_msg  ( pe$057$a_feeder_in_msg ),
    .a_feeder_in_val  ( pe$057$a_feeder_in_val ),
    .a_feeder_out_rdy ( pe$057$a_feeder_out_rdy ),
    .xbar_req_rdy     ( pe$057$xbar_req_rdy ),
    .xbar_resp_msg    ( pe$057$xbar_resp_msg ),
    .xbar_resp_val    ( pe$057$xbar_resp_val ),
    .y_unloader_rdy   ( pe$057$y_unloader_rdy ),
    .blkdone_sig_rdy  ( pe$057$blkdone_sig_rdy ),
    .blkdone_ack_msg  ( pe$057$blkdone_ack_msg ),
    .blkdone_ack_val  ( pe$057$blkdone_ack_val ),
    .pe_id_rdy        ( pe$057$pe_id_rdy ),
    .cm_rdy           ( pe$057$cm_rdy ),
    .a_feeder_in_rdy  ( pe$057$a_feeder_in_rdy ),
    .a_feeder_out_msg ( pe$057$a_feeder_out_msg ),
    .a_feeder_out_val ( pe$057$a_feeder_out_val ),
    .xbar_req_msg     ( pe$057$xbar_req_msg ),
    .xbar_req_val     ( pe$057$xbar_req_val ),
    .xbar_resp_rdy    ( pe$057$xbar_resp_rdy ),
    .y_unloader_msg   ( pe$057$y_unloader_msg ),
    .y_unloader_val   ( pe$057$y_unloader_val ),
    .blkdone_sig_msg  ( pe$057$blkdone_sig_msg ),
    .blkdone_sig_val  ( pe$057$blkdone_sig_val ),
    .blkdone_ack_rdy  ( pe$057$blkdone_ack_rdy )
  );

  // pe$058 temporaries
  wire   [   0:0] pe$058$clk;
  wire   [   0:0] pe$058$reset;
  wire   [  63:0] pe$058$pe_id_msg;
  wire   [   0:0] pe$058$pe_id_val;
  wire   [   0:0] pe$058$cm_msg;
  wire   [   0:0] pe$058$cm_val;
  wire   [  63:0] pe$058$a_feeder_in_msg;
  wire   [   0:0] pe$058$a_feeder_in_val;
  wire   [   0:0] pe$058$a_feeder_out_rdy;
  wire   [   0:0] pe$058$xbar_req_rdy;
  wire   [  63:0] pe$058$xbar_resp_msg;
  wire   [   0:0] pe$058$xbar_resp_val;
  wire   [   0:0] pe$058$y_unloader_rdy;
  wire   [   0:0] pe$058$blkdone_sig_rdy;
  wire   [  31:0] pe$058$blkdone_ack_msg;
  wire   [   0:0] pe$058$blkdone_ack_val;
  wire   [   0:0] pe$058$pe_id_rdy;
  wire   [   0:0] pe$058$cm_rdy;
  wire   [   0:0] pe$058$a_feeder_in_rdy;
  wire   [  63:0] pe$058$a_feeder_out_msg;
  wire   [   0:0] pe$058$a_feeder_out_val;
  wire   [  31:0] pe$058$xbar_req_msg;
  wire   [   0:0] pe$058$xbar_req_val;
  wire   [   0:0] pe$058$xbar_resp_rdy;
  wire   [ 127:0] pe$058$y_unloader_msg;
  wire   [   0:0] pe$058$y_unloader_val;
  wire   [  31:0] pe$058$blkdone_sig_msg;
  wire   [   0:0] pe$058$blkdone_sig_val;
  wire   [   0:0] pe$058$blkdone_ack_rdy;

  SDPERTL_wrapped_0x5a96c41063a827a4 pe$058
  (
    .clk              ( pe$058$clk ),
    .reset            ( pe$058$reset ),
    .pe_id_msg        ( pe$058$pe_id_msg ),
    .pe_id_val        ( pe$058$pe_id_val ),
    .cm_msg           ( pe$058$cm_msg ),
    .cm_val           ( pe$058$cm_val ),
    .a_feeder_in_msg  ( pe$058$a_feeder_in_msg ),
    .a_feeder_in_val  ( pe$058$a_feeder_in_val ),
    .a_feeder_out_rdy ( pe$058$a_feeder_out_rdy ),
    .xbar_req_rdy     ( pe$058$xbar_req_rdy ),
    .xbar_resp_msg    ( pe$058$xbar_resp_msg ),
    .xbar_resp_val    ( pe$058$xbar_resp_val ),
    .y_unloader_rdy   ( pe$058$y_unloader_rdy ),
    .blkdone_sig_rdy  ( pe$058$blkdone_sig_rdy ),
    .blkdone_ack_msg  ( pe$058$blkdone_ack_msg ),
    .blkdone_ack_val  ( pe$058$blkdone_ack_val ),
    .pe_id_rdy        ( pe$058$pe_id_rdy ),
    .cm_rdy           ( pe$058$cm_rdy ),
    .a_feeder_in_rdy  ( pe$058$a_feeder_in_rdy ),
    .a_feeder_out_msg ( pe$058$a_feeder_out_msg ),
    .a_feeder_out_val ( pe$058$a_feeder_out_val ),
    .xbar_req_msg     ( pe$058$xbar_req_msg ),
    .xbar_req_val     ( pe$058$xbar_req_val ),
    .xbar_resp_rdy    ( pe$058$xbar_resp_rdy ),
    .y_unloader_msg   ( pe$058$y_unloader_msg ),
    .y_unloader_val   ( pe$058$y_unloader_val ),
    .blkdone_sig_msg  ( pe$058$blkdone_sig_msg ),
    .blkdone_sig_val  ( pe$058$blkdone_sig_val ),
    .blkdone_ack_rdy  ( pe$058$blkdone_ack_rdy )
  );

  // pe$059 temporaries
  wire   [   0:0] pe$059$clk;
  wire   [   0:0] pe$059$reset;
  wire   [  63:0] pe$059$pe_id_msg;
  wire   [   0:0] pe$059$pe_id_val;
  wire   [   0:0] pe$059$cm_msg;
  wire   [   0:0] pe$059$cm_val;
  wire   [  63:0] pe$059$a_feeder_in_msg;
  wire   [   0:0] pe$059$a_feeder_in_val;
  wire   [   0:0] pe$059$a_feeder_out_rdy;
  wire   [   0:0] pe$059$xbar_req_rdy;
  wire   [  63:0] pe$059$xbar_resp_msg;
  wire   [   0:0] pe$059$xbar_resp_val;
  wire   [   0:0] pe$059$y_unloader_rdy;
  wire   [   0:0] pe$059$blkdone_sig_rdy;
  wire   [  31:0] pe$059$blkdone_ack_msg;
  wire   [   0:0] pe$059$blkdone_ack_val;
  wire   [   0:0] pe$059$pe_id_rdy;
  wire   [   0:0] pe$059$cm_rdy;
  wire   [   0:0] pe$059$a_feeder_in_rdy;
  wire   [  63:0] pe$059$a_feeder_out_msg;
  wire   [   0:0] pe$059$a_feeder_out_val;
  wire   [  31:0] pe$059$xbar_req_msg;
  wire   [   0:0] pe$059$xbar_req_val;
  wire   [   0:0] pe$059$xbar_resp_rdy;
  wire   [ 127:0] pe$059$y_unloader_msg;
  wire   [   0:0] pe$059$y_unloader_val;
  wire   [  31:0] pe$059$blkdone_sig_msg;
  wire   [   0:0] pe$059$blkdone_sig_val;
  wire   [   0:0] pe$059$blkdone_ack_rdy;

  SDPERTL_wrapped_0x5a96c41063a827a4 pe$059
  (
    .clk              ( pe$059$clk ),
    .reset            ( pe$059$reset ),
    .pe_id_msg        ( pe$059$pe_id_msg ),
    .pe_id_val        ( pe$059$pe_id_val ),
    .cm_msg           ( pe$059$cm_msg ),
    .cm_val           ( pe$059$cm_val ),
    .a_feeder_in_msg  ( pe$059$a_feeder_in_msg ),
    .a_feeder_in_val  ( pe$059$a_feeder_in_val ),
    .a_feeder_out_rdy ( pe$059$a_feeder_out_rdy ),
    .xbar_req_rdy     ( pe$059$xbar_req_rdy ),
    .xbar_resp_msg    ( pe$059$xbar_resp_msg ),
    .xbar_resp_val    ( pe$059$xbar_resp_val ),
    .y_unloader_rdy   ( pe$059$y_unloader_rdy ),
    .blkdone_sig_rdy  ( pe$059$blkdone_sig_rdy ),
    .blkdone_ack_msg  ( pe$059$blkdone_ack_msg ),
    .blkdone_ack_val  ( pe$059$blkdone_ack_val ),
    .pe_id_rdy        ( pe$059$pe_id_rdy ),
    .cm_rdy           ( pe$059$cm_rdy ),
    .a_feeder_in_rdy  ( pe$059$a_feeder_in_rdy ),
    .a_feeder_out_msg ( pe$059$a_feeder_out_msg ),
    .a_feeder_out_val ( pe$059$a_feeder_out_val ),
    .xbar_req_msg     ( pe$059$xbar_req_msg ),
    .xbar_req_val     ( pe$059$xbar_req_val ),
    .xbar_resp_rdy    ( pe$059$xbar_resp_rdy ),
    .y_unloader_msg   ( pe$059$y_unloader_msg ),
    .y_unloader_val   ( pe$059$y_unloader_val ),
    .blkdone_sig_msg  ( pe$059$blkdone_sig_msg ),
    .blkdone_sig_val  ( pe$059$blkdone_sig_val ),
    .blkdone_ack_rdy  ( pe$059$blkdone_ack_rdy )
  );

  // pe$060 temporaries
  wire   [   0:0] pe$060$clk;
  wire   [   0:0] pe$060$reset;
  wire   [  63:0] pe$060$pe_id_msg;
  wire   [   0:0] pe$060$pe_id_val;
  wire   [   0:0] pe$060$cm_msg;
  wire   [   0:0] pe$060$cm_val;
  wire   [  63:0] pe$060$a_feeder_in_msg;
  wire   [   0:0] pe$060$a_feeder_in_val;
  wire   [   0:0] pe$060$a_feeder_out_rdy;
  wire   [   0:0] pe$060$xbar_req_rdy;
  wire   [  63:0] pe$060$xbar_resp_msg;
  wire   [   0:0] pe$060$xbar_resp_val;
  wire   [   0:0] pe$060$y_unloader_rdy;
  wire   [   0:0] pe$060$blkdone_sig_rdy;
  wire   [  31:0] pe$060$blkdone_ack_msg;
  wire   [   0:0] pe$060$blkdone_ack_val;
  wire   [   0:0] pe$060$pe_id_rdy;
  wire   [   0:0] pe$060$cm_rdy;
  wire   [   0:0] pe$060$a_feeder_in_rdy;
  wire   [  63:0] pe$060$a_feeder_out_msg;
  wire   [   0:0] pe$060$a_feeder_out_val;
  wire   [  31:0] pe$060$xbar_req_msg;
  wire   [   0:0] pe$060$xbar_req_val;
  wire   [   0:0] pe$060$xbar_resp_rdy;
  wire   [ 127:0] pe$060$y_unloader_msg;
  wire   [   0:0] pe$060$y_unloader_val;
  wire   [  31:0] pe$060$blkdone_sig_msg;
  wire   [   0:0] pe$060$blkdone_sig_val;
  wire   [   0:0] pe$060$blkdone_ack_rdy;

  SDPERTL_wrapped_0x5a96c41063a827a4 pe$060
  (
    .clk              ( pe$060$clk ),
    .reset            ( pe$060$reset ),
    .pe_id_msg        ( pe$060$pe_id_msg ),
    .pe_id_val        ( pe$060$pe_id_val ),
    .cm_msg           ( pe$060$cm_msg ),
    .cm_val           ( pe$060$cm_val ),
    .a_feeder_in_msg  ( pe$060$a_feeder_in_msg ),
    .a_feeder_in_val  ( pe$060$a_feeder_in_val ),
    .a_feeder_out_rdy ( pe$060$a_feeder_out_rdy ),
    .xbar_req_rdy     ( pe$060$xbar_req_rdy ),
    .xbar_resp_msg    ( pe$060$xbar_resp_msg ),
    .xbar_resp_val    ( pe$060$xbar_resp_val ),
    .y_unloader_rdy   ( pe$060$y_unloader_rdy ),
    .blkdone_sig_rdy  ( pe$060$blkdone_sig_rdy ),
    .blkdone_ack_msg  ( pe$060$blkdone_ack_msg ),
    .blkdone_ack_val  ( pe$060$blkdone_ack_val ),
    .pe_id_rdy        ( pe$060$pe_id_rdy ),
    .cm_rdy           ( pe$060$cm_rdy ),
    .a_feeder_in_rdy  ( pe$060$a_feeder_in_rdy ),
    .a_feeder_out_msg ( pe$060$a_feeder_out_msg ),
    .a_feeder_out_val ( pe$060$a_feeder_out_val ),
    .xbar_req_msg     ( pe$060$xbar_req_msg ),
    .xbar_req_val     ( pe$060$xbar_req_val ),
    .xbar_resp_rdy    ( pe$060$xbar_resp_rdy ),
    .y_unloader_msg   ( pe$060$y_unloader_msg ),
    .y_unloader_val   ( pe$060$y_unloader_val ),
    .blkdone_sig_msg  ( pe$060$blkdone_sig_msg ),
    .blkdone_sig_val  ( pe$060$blkdone_sig_val ),
    .blkdone_ack_rdy  ( pe$060$blkdone_ack_rdy )
  );

  // pe$061 temporaries
  wire   [   0:0] pe$061$clk;
  wire   [   0:0] pe$061$reset;
  wire   [  63:0] pe$061$pe_id_msg;
  wire   [   0:0] pe$061$pe_id_val;
  wire   [   0:0] pe$061$cm_msg;
  wire   [   0:0] pe$061$cm_val;
  wire   [  63:0] pe$061$a_feeder_in_msg;
  wire   [   0:0] pe$061$a_feeder_in_val;
  wire   [   0:0] pe$061$a_feeder_out_rdy;
  wire   [   0:0] pe$061$xbar_req_rdy;
  wire   [  63:0] pe$061$xbar_resp_msg;
  wire   [   0:0] pe$061$xbar_resp_val;
  wire   [   0:0] pe$061$y_unloader_rdy;
  wire   [   0:0] pe$061$blkdone_sig_rdy;
  wire   [  31:0] pe$061$blkdone_ack_msg;
  wire   [   0:0] pe$061$blkdone_ack_val;
  wire   [   0:0] pe$061$pe_id_rdy;
  wire   [   0:0] pe$061$cm_rdy;
  wire   [   0:0] pe$061$a_feeder_in_rdy;
  wire   [  63:0] pe$061$a_feeder_out_msg;
  wire   [   0:0] pe$061$a_feeder_out_val;
  wire   [  31:0] pe$061$xbar_req_msg;
  wire   [   0:0] pe$061$xbar_req_val;
  wire   [   0:0] pe$061$xbar_resp_rdy;
  wire   [ 127:0] pe$061$y_unloader_msg;
  wire   [   0:0] pe$061$y_unloader_val;
  wire   [  31:0] pe$061$blkdone_sig_msg;
  wire   [   0:0] pe$061$blkdone_sig_val;
  wire   [   0:0] pe$061$blkdone_ack_rdy;

  SDPERTL_wrapped_0x5a96c41063a827a4 pe$061
  (
    .clk              ( pe$061$clk ),
    .reset            ( pe$061$reset ),
    .pe_id_msg        ( pe$061$pe_id_msg ),
    .pe_id_val        ( pe$061$pe_id_val ),
    .cm_msg           ( pe$061$cm_msg ),
    .cm_val           ( pe$061$cm_val ),
    .a_feeder_in_msg  ( pe$061$a_feeder_in_msg ),
    .a_feeder_in_val  ( pe$061$a_feeder_in_val ),
    .a_feeder_out_rdy ( pe$061$a_feeder_out_rdy ),
    .xbar_req_rdy     ( pe$061$xbar_req_rdy ),
    .xbar_resp_msg    ( pe$061$xbar_resp_msg ),
    .xbar_resp_val    ( pe$061$xbar_resp_val ),
    .y_unloader_rdy   ( pe$061$y_unloader_rdy ),
    .blkdone_sig_rdy  ( pe$061$blkdone_sig_rdy ),
    .blkdone_ack_msg  ( pe$061$blkdone_ack_msg ),
    .blkdone_ack_val  ( pe$061$blkdone_ack_val ),
    .pe_id_rdy        ( pe$061$pe_id_rdy ),
    .cm_rdy           ( pe$061$cm_rdy ),
    .a_feeder_in_rdy  ( pe$061$a_feeder_in_rdy ),
    .a_feeder_out_msg ( pe$061$a_feeder_out_msg ),
    .a_feeder_out_val ( pe$061$a_feeder_out_val ),
    .xbar_req_msg     ( pe$061$xbar_req_msg ),
    .xbar_req_val     ( pe$061$xbar_req_val ),
    .xbar_resp_rdy    ( pe$061$xbar_resp_rdy ),
    .y_unloader_msg   ( pe$061$y_unloader_msg ),
    .y_unloader_val   ( pe$061$y_unloader_val ),
    .blkdone_sig_msg  ( pe$061$blkdone_sig_msg ),
    .blkdone_sig_val  ( pe$061$blkdone_sig_val ),
    .blkdone_ack_rdy  ( pe$061$blkdone_ack_rdy )
  );

  // pe$062 temporaries
  wire   [   0:0] pe$062$clk;
  wire   [   0:0] pe$062$reset;
  wire   [  63:0] pe$062$pe_id_msg;
  wire   [   0:0] pe$062$pe_id_val;
  wire   [   0:0] pe$062$cm_msg;
  wire   [   0:0] pe$062$cm_val;
  wire   [  63:0] pe$062$a_feeder_in_msg;
  wire   [   0:0] pe$062$a_feeder_in_val;
  wire   [   0:0] pe$062$a_feeder_out_rdy;
  wire   [   0:0] pe$062$xbar_req_rdy;
  wire   [  63:0] pe$062$xbar_resp_msg;
  wire   [   0:0] pe$062$xbar_resp_val;
  wire   [   0:0] pe$062$y_unloader_rdy;
  wire   [   0:0] pe$062$blkdone_sig_rdy;
  wire   [  31:0] pe$062$blkdone_ack_msg;
  wire   [   0:0] pe$062$blkdone_ack_val;
  wire   [   0:0] pe$062$pe_id_rdy;
  wire   [   0:0] pe$062$cm_rdy;
  wire   [   0:0] pe$062$a_feeder_in_rdy;
  wire   [  63:0] pe$062$a_feeder_out_msg;
  wire   [   0:0] pe$062$a_feeder_out_val;
  wire   [  31:0] pe$062$xbar_req_msg;
  wire   [   0:0] pe$062$xbar_req_val;
  wire   [   0:0] pe$062$xbar_resp_rdy;
  wire   [ 127:0] pe$062$y_unloader_msg;
  wire   [   0:0] pe$062$y_unloader_val;
  wire   [  31:0] pe$062$blkdone_sig_msg;
  wire   [   0:0] pe$062$blkdone_sig_val;
  wire   [   0:0] pe$062$blkdone_ack_rdy;

  SDPERTL_wrapped_0x5a96c41063a827a4 pe$062
  (
    .clk              ( pe$062$clk ),
    .reset            ( pe$062$reset ),
    .pe_id_msg        ( pe$062$pe_id_msg ),
    .pe_id_val        ( pe$062$pe_id_val ),
    .cm_msg           ( pe$062$cm_msg ),
    .cm_val           ( pe$062$cm_val ),
    .a_feeder_in_msg  ( pe$062$a_feeder_in_msg ),
    .a_feeder_in_val  ( pe$062$a_feeder_in_val ),
    .a_feeder_out_rdy ( pe$062$a_feeder_out_rdy ),
    .xbar_req_rdy     ( pe$062$xbar_req_rdy ),
    .xbar_resp_msg    ( pe$062$xbar_resp_msg ),
    .xbar_resp_val    ( pe$062$xbar_resp_val ),
    .y_unloader_rdy   ( pe$062$y_unloader_rdy ),
    .blkdone_sig_rdy  ( pe$062$blkdone_sig_rdy ),
    .blkdone_ack_msg  ( pe$062$blkdone_ack_msg ),
    .blkdone_ack_val  ( pe$062$blkdone_ack_val ),
    .pe_id_rdy        ( pe$062$pe_id_rdy ),
    .cm_rdy           ( pe$062$cm_rdy ),
    .a_feeder_in_rdy  ( pe$062$a_feeder_in_rdy ),
    .a_feeder_out_msg ( pe$062$a_feeder_out_msg ),
    .a_feeder_out_val ( pe$062$a_feeder_out_val ),
    .xbar_req_msg     ( pe$062$xbar_req_msg ),
    .xbar_req_val     ( pe$062$xbar_req_val ),
    .xbar_resp_rdy    ( pe$062$xbar_resp_rdy ),
    .y_unloader_msg   ( pe$062$y_unloader_msg ),
    .y_unloader_val   ( pe$062$y_unloader_val ),
    .blkdone_sig_msg  ( pe$062$blkdone_sig_msg ),
    .blkdone_sig_val  ( pe$062$blkdone_sig_val ),
    .blkdone_ack_rdy  ( pe$062$blkdone_ack_rdy )
  );

  // pe$063 temporaries
  wire   [   0:0] pe$063$clk;
  wire   [   0:0] pe$063$reset;
  wire   [  63:0] pe$063$pe_id_msg;
  wire   [   0:0] pe$063$pe_id_val;
  wire   [   0:0] pe$063$cm_msg;
  wire   [   0:0] pe$063$cm_val;
  wire   [  63:0] pe$063$a_feeder_in_msg;
  wire   [   0:0] pe$063$a_feeder_in_val;
  wire   [   0:0] pe$063$a_feeder_out_rdy;
  wire   [   0:0] pe$063$xbar_req_rdy;
  wire   [  63:0] pe$063$xbar_resp_msg;
  wire   [   0:0] pe$063$xbar_resp_val;
  wire   [   0:0] pe$063$y_unloader_rdy;
  wire   [   0:0] pe$063$blkdone_sig_rdy;
  wire   [  31:0] pe$063$blkdone_ack_msg;
  wire   [   0:0] pe$063$blkdone_ack_val;
  wire   [   0:0] pe$063$pe_id_rdy;
  wire   [   0:0] pe$063$cm_rdy;
  wire   [   0:0] pe$063$a_feeder_in_rdy;
  wire   [  63:0] pe$063$a_feeder_out_msg;
  wire   [   0:0] pe$063$a_feeder_out_val;
  wire   [  31:0] pe$063$xbar_req_msg;
  wire   [   0:0] pe$063$xbar_req_val;
  wire   [   0:0] pe$063$xbar_resp_rdy;
  wire   [ 127:0] pe$063$y_unloader_msg;
  wire   [   0:0] pe$063$y_unloader_val;
  wire   [  31:0] pe$063$blkdone_sig_msg;
  wire   [   0:0] pe$063$blkdone_sig_val;
  wire   [   0:0] pe$063$blkdone_ack_rdy;

  SDPERTL_wrapped_0x5a96c41063a827a4 pe$063
  (
    .clk              ( pe$063$clk ),
    .reset            ( pe$063$reset ),
    .pe_id_msg        ( pe$063$pe_id_msg ),
    .pe_id_val        ( pe$063$pe_id_val ),
    .cm_msg           ( pe$063$cm_msg ),
    .cm_val           ( pe$063$cm_val ),
    .a_feeder_in_msg  ( pe$063$a_feeder_in_msg ),
    .a_feeder_in_val  ( pe$063$a_feeder_in_val ),
    .a_feeder_out_rdy ( pe$063$a_feeder_out_rdy ),
    .xbar_req_rdy     ( pe$063$xbar_req_rdy ),
    .xbar_resp_msg    ( pe$063$xbar_resp_msg ),
    .xbar_resp_val    ( pe$063$xbar_resp_val ),
    .y_unloader_rdy   ( pe$063$y_unloader_rdy ),
    .blkdone_sig_rdy  ( pe$063$blkdone_sig_rdy ),
    .blkdone_ack_msg  ( pe$063$blkdone_ack_msg ),
    .blkdone_ack_val  ( pe$063$blkdone_ack_val ),
    .pe_id_rdy        ( pe$063$pe_id_rdy ),
    .cm_rdy           ( pe$063$cm_rdy ),
    .a_feeder_in_rdy  ( pe$063$a_feeder_in_rdy ),
    .a_feeder_out_msg ( pe$063$a_feeder_out_msg ),
    .a_feeder_out_val ( pe$063$a_feeder_out_val ),
    .xbar_req_msg     ( pe$063$xbar_req_msg ),
    .xbar_req_val     ( pe$063$xbar_req_val ),
    .xbar_resp_rdy    ( pe$063$xbar_resp_rdy ),
    .y_unloader_msg   ( pe$063$y_unloader_msg ),
    .y_unloader_val   ( pe$063$y_unloader_val ),
    .blkdone_sig_msg  ( pe$063$blkdone_sig_msg ),
    .blkdone_sig_val  ( pe$063$blkdone_sig_val ),
    .blkdone_ack_rdy  ( pe$063$blkdone_ack_rdy )
  );

  // xbar$000 temporaries
  wire   [   0:0] xbar$000$clk;
  wire   [   0:0] xbar$000$reset;
  wire   [  31:0] xbar$000$xbar_req$000_msg;
  wire   [   0:0] xbar$000$xbar_req$000_val;
  wire   [  31:0] xbar$000$xbar_req$001_msg;
  wire   [   0:0] xbar$000$xbar_req$001_val;
  wire   [  31:0] xbar$000$xbar_req$002_msg;
  wire   [   0:0] xbar$000$xbar_req$002_val;
  wire   [  31:0] xbar$000$xbar_req$003_msg;
  wire   [   0:0] xbar$000$xbar_req$003_val;
  wire   [  31:0] xbar$000$xbar_req$004_msg;
  wire   [   0:0] xbar$000$xbar_req$004_val;
  wire   [  31:0] xbar$000$xbar_req$005_msg;
  wire   [   0:0] xbar$000$xbar_req$005_val;
  wire   [  31:0] xbar$000$xbar_req$006_msg;
  wire   [   0:0] xbar$000$xbar_req$006_val;
  wire   [  31:0] xbar$000$xbar_req$007_msg;
  wire   [   0:0] xbar$000$xbar_req$007_val;
  wire   [   0:0] xbar$000$xbar_resp$000_rdy;
  wire   [   0:0] xbar$000$xbar_resp$001_rdy;
  wire   [   0:0] xbar$000$xbar_resp$002_rdy;
  wire   [   0:0] xbar$000$xbar_resp$003_rdy;
  wire   [   0:0] xbar$000$xbar_resp$004_rdy;
  wire   [   0:0] xbar$000$xbar_resp$005_rdy;
  wire   [   0:0] xbar$000$xbar_resp$006_rdy;
  wire   [   0:0] xbar$000$xbar_resp$007_rdy;
  wire   [   0:0] xbar$000$bank_req$000_rdy;
  wire   [   0:0] xbar$000$bank_req$001_rdy;
  wire   [   0:0] xbar$000$bank_req$002_rdy;
  wire   [   0:0] xbar$000$bank_req$003_rdy;
  wire   [   0:0] xbar$000$bank_req$004_rdy;
  wire   [   0:0] xbar$000$bank_req$005_rdy;
  wire   [   0:0] xbar$000$bank_req$006_rdy;
  wire   [   0:0] xbar$000$bank_req$007_rdy;
  wire   [  63:0] xbar$000$bank_resp$000_msg;
  wire   [   0:0] xbar$000$bank_resp$000_val;
  wire   [  63:0] xbar$000$bank_resp$001_msg;
  wire   [   0:0] xbar$000$bank_resp$001_val;
  wire   [  63:0] xbar$000$bank_resp$002_msg;
  wire   [   0:0] xbar$000$bank_resp$002_val;
  wire   [  63:0] xbar$000$bank_resp$003_msg;
  wire   [   0:0] xbar$000$bank_resp$003_val;
  wire   [  63:0] xbar$000$bank_resp$004_msg;
  wire   [   0:0] xbar$000$bank_resp$004_val;
  wire   [  63:0] xbar$000$bank_resp$005_msg;
  wire   [   0:0] xbar$000$bank_resp$005_val;
  wire   [  63:0] xbar$000$bank_resp$006_msg;
  wire   [   0:0] xbar$000$bank_resp$006_val;
  wire   [  63:0] xbar$000$bank_resp$007_msg;
  wire   [   0:0] xbar$000$bank_resp$007_val;
  wire   [   0:0] xbar$000$xbar_req$000_rdy;
  wire   [   0:0] xbar$000$xbar_req$001_rdy;
  wire   [   0:0] xbar$000$xbar_req$002_rdy;
  wire   [   0:0] xbar$000$xbar_req$003_rdy;
  wire   [   0:0] xbar$000$xbar_req$004_rdy;
  wire   [   0:0] xbar$000$xbar_req$005_rdy;
  wire   [   0:0] xbar$000$xbar_req$006_rdy;
  wire   [   0:0] xbar$000$xbar_req$007_rdy;
  wire   [  63:0] xbar$000$xbar_resp$000_msg;
  wire   [   0:0] xbar$000$xbar_resp$000_val;
  wire   [  63:0] xbar$000$xbar_resp$001_msg;
  wire   [   0:0] xbar$000$xbar_resp$001_val;
  wire   [  63:0] xbar$000$xbar_resp$002_msg;
  wire   [   0:0] xbar$000$xbar_resp$002_val;
  wire   [  63:0] xbar$000$xbar_resp$003_msg;
  wire   [   0:0] xbar$000$xbar_resp$003_val;
  wire   [  63:0] xbar$000$xbar_resp$004_msg;
  wire   [   0:0] xbar$000$xbar_resp$004_val;
  wire   [  63:0] xbar$000$xbar_resp$005_msg;
  wire   [   0:0] xbar$000$xbar_resp$005_val;
  wire   [  63:0] xbar$000$xbar_resp$006_msg;
  wire   [   0:0] xbar$000$xbar_resp$006_val;
  wire   [  63:0] xbar$000$xbar_resp$007_msg;
  wire   [   0:0] xbar$000$xbar_resp$007_val;
  wire   [  31:0] xbar$000$bank_req$000_msg;
  wire   [   0:0] xbar$000$bank_req$000_val;
  wire   [  31:0] xbar$000$bank_req$001_msg;
  wire   [   0:0] xbar$000$bank_req$001_val;
  wire   [  31:0] xbar$000$bank_req$002_msg;
  wire   [   0:0] xbar$000$bank_req$002_val;
  wire   [  31:0] xbar$000$bank_req$003_msg;
  wire   [   0:0] xbar$000$bank_req$003_val;
  wire   [  31:0] xbar$000$bank_req$004_msg;
  wire   [   0:0] xbar$000$bank_req$004_val;
  wire   [  31:0] xbar$000$bank_req$005_msg;
  wire   [   0:0] xbar$000$bank_req$005_val;
  wire   [  31:0] xbar$000$bank_req$006_msg;
  wire   [   0:0] xbar$000$bank_req$006_val;
  wire   [  31:0] xbar$000$bank_req$007_msg;
  wire   [   0:0] xbar$000$bank_req$007_val;
  wire   [   0:0] xbar$000$bank_resp$000_rdy;
  wire   [   0:0] xbar$000$bank_resp$001_rdy;
  wire   [   0:0] xbar$000$bank_resp$002_rdy;
  wire   [   0:0] xbar$000$bank_resp$003_rdy;
  wire   [   0:0] xbar$000$bank_resp$004_rdy;
  wire   [   0:0] xbar$000$bank_resp$005_rdy;
  wire   [   0:0] xbar$000$bank_resp$006_rdy;
  wire   [   0:0] xbar$000$bank_resp$007_rdy;

  crossbar_0x48d3814e38ed84e5 xbar$000
  (
    .clk               ( xbar$000$clk ),
    .reset             ( xbar$000$reset ),
    .xbar_req$000_msg  ( xbar$000$xbar_req$000_msg ),
    .xbar_req$000_val  ( xbar$000$xbar_req$000_val ),
    .xbar_req$001_msg  ( xbar$000$xbar_req$001_msg ),
    .xbar_req$001_val  ( xbar$000$xbar_req$001_val ),
    .xbar_req$002_msg  ( xbar$000$xbar_req$002_msg ),
    .xbar_req$002_val  ( xbar$000$xbar_req$002_val ),
    .xbar_req$003_msg  ( xbar$000$xbar_req$003_msg ),
    .xbar_req$003_val  ( xbar$000$xbar_req$003_val ),
    .xbar_req$004_msg  ( xbar$000$xbar_req$004_msg ),
    .xbar_req$004_val  ( xbar$000$xbar_req$004_val ),
    .xbar_req$005_msg  ( xbar$000$xbar_req$005_msg ),
    .xbar_req$005_val  ( xbar$000$xbar_req$005_val ),
    .xbar_req$006_msg  ( xbar$000$xbar_req$006_msg ),
    .xbar_req$006_val  ( xbar$000$xbar_req$006_val ),
    .xbar_req$007_msg  ( xbar$000$xbar_req$007_msg ),
    .xbar_req$007_val  ( xbar$000$xbar_req$007_val ),
    .xbar_resp$000_rdy ( xbar$000$xbar_resp$000_rdy ),
    .xbar_resp$001_rdy ( xbar$000$xbar_resp$001_rdy ),
    .xbar_resp$002_rdy ( xbar$000$xbar_resp$002_rdy ),
    .xbar_resp$003_rdy ( xbar$000$xbar_resp$003_rdy ),
    .xbar_resp$004_rdy ( xbar$000$xbar_resp$004_rdy ),
    .xbar_resp$005_rdy ( xbar$000$xbar_resp$005_rdy ),
    .xbar_resp$006_rdy ( xbar$000$xbar_resp$006_rdy ),
    .xbar_resp$007_rdy ( xbar$000$xbar_resp$007_rdy ),
    .bank_req$000_rdy  ( xbar$000$bank_req$000_rdy ),
    .bank_req$001_rdy  ( xbar$000$bank_req$001_rdy ),
    .bank_req$002_rdy  ( xbar$000$bank_req$002_rdy ),
    .bank_req$003_rdy  ( xbar$000$bank_req$003_rdy ),
    .bank_req$004_rdy  ( xbar$000$bank_req$004_rdy ),
    .bank_req$005_rdy  ( xbar$000$bank_req$005_rdy ),
    .bank_req$006_rdy  ( xbar$000$bank_req$006_rdy ),
    .bank_req$007_rdy  ( xbar$000$bank_req$007_rdy ),
    .bank_resp$000_msg ( xbar$000$bank_resp$000_msg ),
    .bank_resp$000_val ( xbar$000$bank_resp$000_val ),
    .bank_resp$001_msg ( xbar$000$bank_resp$001_msg ),
    .bank_resp$001_val ( xbar$000$bank_resp$001_val ),
    .bank_resp$002_msg ( xbar$000$bank_resp$002_msg ),
    .bank_resp$002_val ( xbar$000$bank_resp$002_val ),
    .bank_resp$003_msg ( xbar$000$bank_resp$003_msg ),
    .bank_resp$003_val ( xbar$000$bank_resp$003_val ),
    .bank_resp$004_msg ( xbar$000$bank_resp$004_msg ),
    .bank_resp$004_val ( xbar$000$bank_resp$004_val ),
    .bank_resp$005_msg ( xbar$000$bank_resp$005_msg ),
    .bank_resp$005_val ( xbar$000$bank_resp$005_val ),
    .bank_resp$006_msg ( xbar$000$bank_resp$006_msg ),
    .bank_resp$006_val ( xbar$000$bank_resp$006_val ),
    .bank_resp$007_msg ( xbar$000$bank_resp$007_msg ),
    .bank_resp$007_val ( xbar$000$bank_resp$007_val ),
    .xbar_req$000_rdy  ( xbar$000$xbar_req$000_rdy ),
    .xbar_req$001_rdy  ( xbar$000$xbar_req$001_rdy ),
    .xbar_req$002_rdy  ( xbar$000$xbar_req$002_rdy ),
    .xbar_req$003_rdy  ( xbar$000$xbar_req$003_rdy ),
    .xbar_req$004_rdy  ( xbar$000$xbar_req$004_rdy ),
    .xbar_req$005_rdy  ( xbar$000$xbar_req$005_rdy ),
    .xbar_req$006_rdy  ( xbar$000$xbar_req$006_rdy ),
    .xbar_req$007_rdy  ( xbar$000$xbar_req$007_rdy ),
    .xbar_resp$000_msg ( xbar$000$xbar_resp$000_msg ),
    .xbar_resp$000_val ( xbar$000$xbar_resp$000_val ),
    .xbar_resp$001_msg ( xbar$000$xbar_resp$001_msg ),
    .xbar_resp$001_val ( xbar$000$xbar_resp$001_val ),
    .xbar_resp$002_msg ( xbar$000$xbar_resp$002_msg ),
    .xbar_resp$002_val ( xbar$000$xbar_resp$002_val ),
    .xbar_resp$003_msg ( xbar$000$xbar_resp$003_msg ),
    .xbar_resp$003_val ( xbar$000$xbar_resp$003_val ),
    .xbar_resp$004_msg ( xbar$000$xbar_resp$004_msg ),
    .xbar_resp$004_val ( xbar$000$xbar_resp$004_val ),
    .xbar_resp$005_msg ( xbar$000$xbar_resp$005_msg ),
    .xbar_resp$005_val ( xbar$000$xbar_resp$005_val ),
    .xbar_resp$006_msg ( xbar$000$xbar_resp$006_msg ),
    .xbar_resp$006_val ( xbar$000$xbar_resp$006_val ),
    .xbar_resp$007_msg ( xbar$000$xbar_resp$007_msg ),
    .xbar_resp$007_val ( xbar$000$xbar_resp$007_val ),
    .bank_req$000_msg  ( xbar$000$bank_req$000_msg ),
    .bank_req$000_val  ( xbar$000$bank_req$000_val ),
    .bank_req$001_msg  ( xbar$000$bank_req$001_msg ),
    .bank_req$001_val  ( xbar$000$bank_req$001_val ),
    .bank_req$002_msg  ( xbar$000$bank_req$002_msg ),
    .bank_req$002_val  ( xbar$000$bank_req$002_val ),
    .bank_req$003_msg  ( xbar$000$bank_req$003_msg ),
    .bank_req$003_val  ( xbar$000$bank_req$003_val ),
    .bank_req$004_msg  ( xbar$000$bank_req$004_msg ),
    .bank_req$004_val  ( xbar$000$bank_req$004_val ),
    .bank_req$005_msg  ( xbar$000$bank_req$005_msg ),
    .bank_req$005_val  ( xbar$000$bank_req$005_val ),
    .bank_req$006_msg  ( xbar$000$bank_req$006_msg ),
    .bank_req$006_val  ( xbar$000$bank_req$006_val ),
    .bank_req$007_msg  ( xbar$000$bank_req$007_msg ),
    .bank_req$007_val  ( xbar$000$bank_req$007_val ),
    .bank_resp$000_rdy ( xbar$000$bank_resp$000_rdy ),
    .bank_resp$001_rdy ( xbar$000$bank_resp$001_rdy ),
    .bank_resp$002_rdy ( xbar$000$bank_resp$002_rdy ),
    .bank_resp$003_rdy ( xbar$000$bank_resp$003_rdy ),
    .bank_resp$004_rdy ( xbar$000$bank_resp$004_rdy ),
    .bank_resp$005_rdy ( xbar$000$bank_resp$005_rdy ),
    .bank_resp$006_rdy ( xbar$000$bank_resp$006_rdy ),
    .bank_resp$007_rdy ( xbar$000$bank_resp$007_rdy )
  );

  // xbar$001 temporaries
  wire   [   0:0] xbar$001$clk;
  wire   [   0:0] xbar$001$reset;
  wire   [  31:0] xbar$001$xbar_req$000_msg;
  wire   [   0:0] xbar$001$xbar_req$000_val;
  wire   [  31:0] xbar$001$xbar_req$001_msg;
  wire   [   0:0] xbar$001$xbar_req$001_val;
  wire   [  31:0] xbar$001$xbar_req$002_msg;
  wire   [   0:0] xbar$001$xbar_req$002_val;
  wire   [  31:0] xbar$001$xbar_req$003_msg;
  wire   [   0:0] xbar$001$xbar_req$003_val;
  wire   [  31:0] xbar$001$xbar_req$004_msg;
  wire   [   0:0] xbar$001$xbar_req$004_val;
  wire   [  31:0] xbar$001$xbar_req$005_msg;
  wire   [   0:0] xbar$001$xbar_req$005_val;
  wire   [  31:0] xbar$001$xbar_req$006_msg;
  wire   [   0:0] xbar$001$xbar_req$006_val;
  wire   [  31:0] xbar$001$xbar_req$007_msg;
  wire   [   0:0] xbar$001$xbar_req$007_val;
  wire   [   0:0] xbar$001$xbar_resp$000_rdy;
  wire   [   0:0] xbar$001$xbar_resp$001_rdy;
  wire   [   0:0] xbar$001$xbar_resp$002_rdy;
  wire   [   0:0] xbar$001$xbar_resp$003_rdy;
  wire   [   0:0] xbar$001$xbar_resp$004_rdy;
  wire   [   0:0] xbar$001$xbar_resp$005_rdy;
  wire   [   0:0] xbar$001$xbar_resp$006_rdy;
  wire   [   0:0] xbar$001$xbar_resp$007_rdy;
  wire   [   0:0] xbar$001$bank_req$000_rdy;
  wire   [   0:0] xbar$001$bank_req$001_rdy;
  wire   [   0:0] xbar$001$bank_req$002_rdy;
  wire   [   0:0] xbar$001$bank_req$003_rdy;
  wire   [   0:0] xbar$001$bank_req$004_rdy;
  wire   [   0:0] xbar$001$bank_req$005_rdy;
  wire   [   0:0] xbar$001$bank_req$006_rdy;
  wire   [   0:0] xbar$001$bank_req$007_rdy;
  wire   [  63:0] xbar$001$bank_resp$000_msg;
  wire   [   0:0] xbar$001$bank_resp$000_val;
  wire   [  63:0] xbar$001$bank_resp$001_msg;
  wire   [   0:0] xbar$001$bank_resp$001_val;
  wire   [  63:0] xbar$001$bank_resp$002_msg;
  wire   [   0:0] xbar$001$bank_resp$002_val;
  wire   [  63:0] xbar$001$bank_resp$003_msg;
  wire   [   0:0] xbar$001$bank_resp$003_val;
  wire   [  63:0] xbar$001$bank_resp$004_msg;
  wire   [   0:0] xbar$001$bank_resp$004_val;
  wire   [  63:0] xbar$001$bank_resp$005_msg;
  wire   [   0:0] xbar$001$bank_resp$005_val;
  wire   [  63:0] xbar$001$bank_resp$006_msg;
  wire   [   0:0] xbar$001$bank_resp$006_val;
  wire   [  63:0] xbar$001$bank_resp$007_msg;
  wire   [   0:0] xbar$001$bank_resp$007_val;
  wire   [   0:0] xbar$001$xbar_req$000_rdy;
  wire   [   0:0] xbar$001$xbar_req$001_rdy;
  wire   [   0:0] xbar$001$xbar_req$002_rdy;
  wire   [   0:0] xbar$001$xbar_req$003_rdy;
  wire   [   0:0] xbar$001$xbar_req$004_rdy;
  wire   [   0:0] xbar$001$xbar_req$005_rdy;
  wire   [   0:0] xbar$001$xbar_req$006_rdy;
  wire   [   0:0] xbar$001$xbar_req$007_rdy;
  wire   [  63:0] xbar$001$xbar_resp$000_msg;
  wire   [   0:0] xbar$001$xbar_resp$000_val;
  wire   [  63:0] xbar$001$xbar_resp$001_msg;
  wire   [   0:0] xbar$001$xbar_resp$001_val;
  wire   [  63:0] xbar$001$xbar_resp$002_msg;
  wire   [   0:0] xbar$001$xbar_resp$002_val;
  wire   [  63:0] xbar$001$xbar_resp$003_msg;
  wire   [   0:0] xbar$001$xbar_resp$003_val;
  wire   [  63:0] xbar$001$xbar_resp$004_msg;
  wire   [   0:0] xbar$001$xbar_resp$004_val;
  wire   [  63:0] xbar$001$xbar_resp$005_msg;
  wire   [   0:0] xbar$001$xbar_resp$005_val;
  wire   [  63:0] xbar$001$xbar_resp$006_msg;
  wire   [   0:0] xbar$001$xbar_resp$006_val;
  wire   [  63:0] xbar$001$xbar_resp$007_msg;
  wire   [   0:0] xbar$001$xbar_resp$007_val;
  wire   [  31:0] xbar$001$bank_req$000_msg;
  wire   [   0:0] xbar$001$bank_req$000_val;
  wire   [  31:0] xbar$001$bank_req$001_msg;
  wire   [   0:0] xbar$001$bank_req$001_val;
  wire   [  31:0] xbar$001$bank_req$002_msg;
  wire   [   0:0] xbar$001$bank_req$002_val;
  wire   [  31:0] xbar$001$bank_req$003_msg;
  wire   [   0:0] xbar$001$bank_req$003_val;
  wire   [  31:0] xbar$001$bank_req$004_msg;
  wire   [   0:0] xbar$001$bank_req$004_val;
  wire   [  31:0] xbar$001$bank_req$005_msg;
  wire   [   0:0] xbar$001$bank_req$005_val;
  wire   [  31:0] xbar$001$bank_req$006_msg;
  wire   [   0:0] xbar$001$bank_req$006_val;
  wire   [  31:0] xbar$001$bank_req$007_msg;
  wire   [   0:0] xbar$001$bank_req$007_val;
  wire   [   0:0] xbar$001$bank_resp$000_rdy;
  wire   [   0:0] xbar$001$bank_resp$001_rdy;
  wire   [   0:0] xbar$001$bank_resp$002_rdy;
  wire   [   0:0] xbar$001$bank_resp$003_rdy;
  wire   [   0:0] xbar$001$bank_resp$004_rdy;
  wire   [   0:0] xbar$001$bank_resp$005_rdy;
  wire   [   0:0] xbar$001$bank_resp$006_rdy;
  wire   [   0:0] xbar$001$bank_resp$007_rdy;

  crossbar_0x48d3814e38ed84e5 xbar$001
  (
    .clk               ( xbar$001$clk ),
    .reset             ( xbar$001$reset ),
    .xbar_req$000_msg  ( xbar$001$xbar_req$000_msg ),
    .xbar_req$000_val  ( xbar$001$xbar_req$000_val ),
    .xbar_req$001_msg  ( xbar$001$xbar_req$001_msg ),
    .xbar_req$001_val  ( xbar$001$xbar_req$001_val ),
    .xbar_req$002_msg  ( xbar$001$xbar_req$002_msg ),
    .xbar_req$002_val  ( xbar$001$xbar_req$002_val ),
    .xbar_req$003_msg  ( xbar$001$xbar_req$003_msg ),
    .xbar_req$003_val  ( xbar$001$xbar_req$003_val ),
    .xbar_req$004_msg  ( xbar$001$xbar_req$004_msg ),
    .xbar_req$004_val  ( xbar$001$xbar_req$004_val ),
    .xbar_req$005_msg  ( xbar$001$xbar_req$005_msg ),
    .xbar_req$005_val  ( xbar$001$xbar_req$005_val ),
    .xbar_req$006_msg  ( xbar$001$xbar_req$006_msg ),
    .xbar_req$006_val  ( xbar$001$xbar_req$006_val ),
    .xbar_req$007_msg  ( xbar$001$xbar_req$007_msg ),
    .xbar_req$007_val  ( xbar$001$xbar_req$007_val ),
    .xbar_resp$000_rdy ( xbar$001$xbar_resp$000_rdy ),
    .xbar_resp$001_rdy ( xbar$001$xbar_resp$001_rdy ),
    .xbar_resp$002_rdy ( xbar$001$xbar_resp$002_rdy ),
    .xbar_resp$003_rdy ( xbar$001$xbar_resp$003_rdy ),
    .xbar_resp$004_rdy ( xbar$001$xbar_resp$004_rdy ),
    .xbar_resp$005_rdy ( xbar$001$xbar_resp$005_rdy ),
    .xbar_resp$006_rdy ( xbar$001$xbar_resp$006_rdy ),
    .xbar_resp$007_rdy ( xbar$001$xbar_resp$007_rdy ),
    .bank_req$000_rdy  ( xbar$001$bank_req$000_rdy ),
    .bank_req$001_rdy  ( xbar$001$bank_req$001_rdy ),
    .bank_req$002_rdy  ( xbar$001$bank_req$002_rdy ),
    .bank_req$003_rdy  ( xbar$001$bank_req$003_rdy ),
    .bank_req$004_rdy  ( xbar$001$bank_req$004_rdy ),
    .bank_req$005_rdy  ( xbar$001$bank_req$005_rdy ),
    .bank_req$006_rdy  ( xbar$001$bank_req$006_rdy ),
    .bank_req$007_rdy  ( xbar$001$bank_req$007_rdy ),
    .bank_resp$000_msg ( xbar$001$bank_resp$000_msg ),
    .bank_resp$000_val ( xbar$001$bank_resp$000_val ),
    .bank_resp$001_msg ( xbar$001$bank_resp$001_msg ),
    .bank_resp$001_val ( xbar$001$bank_resp$001_val ),
    .bank_resp$002_msg ( xbar$001$bank_resp$002_msg ),
    .bank_resp$002_val ( xbar$001$bank_resp$002_val ),
    .bank_resp$003_msg ( xbar$001$bank_resp$003_msg ),
    .bank_resp$003_val ( xbar$001$bank_resp$003_val ),
    .bank_resp$004_msg ( xbar$001$bank_resp$004_msg ),
    .bank_resp$004_val ( xbar$001$bank_resp$004_val ),
    .bank_resp$005_msg ( xbar$001$bank_resp$005_msg ),
    .bank_resp$005_val ( xbar$001$bank_resp$005_val ),
    .bank_resp$006_msg ( xbar$001$bank_resp$006_msg ),
    .bank_resp$006_val ( xbar$001$bank_resp$006_val ),
    .bank_resp$007_msg ( xbar$001$bank_resp$007_msg ),
    .bank_resp$007_val ( xbar$001$bank_resp$007_val ),
    .xbar_req$000_rdy  ( xbar$001$xbar_req$000_rdy ),
    .xbar_req$001_rdy  ( xbar$001$xbar_req$001_rdy ),
    .xbar_req$002_rdy  ( xbar$001$xbar_req$002_rdy ),
    .xbar_req$003_rdy  ( xbar$001$xbar_req$003_rdy ),
    .xbar_req$004_rdy  ( xbar$001$xbar_req$004_rdy ),
    .xbar_req$005_rdy  ( xbar$001$xbar_req$005_rdy ),
    .xbar_req$006_rdy  ( xbar$001$xbar_req$006_rdy ),
    .xbar_req$007_rdy  ( xbar$001$xbar_req$007_rdy ),
    .xbar_resp$000_msg ( xbar$001$xbar_resp$000_msg ),
    .xbar_resp$000_val ( xbar$001$xbar_resp$000_val ),
    .xbar_resp$001_msg ( xbar$001$xbar_resp$001_msg ),
    .xbar_resp$001_val ( xbar$001$xbar_resp$001_val ),
    .xbar_resp$002_msg ( xbar$001$xbar_resp$002_msg ),
    .xbar_resp$002_val ( xbar$001$xbar_resp$002_val ),
    .xbar_resp$003_msg ( xbar$001$xbar_resp$003_msg ),
    .xbar_resp$003_val ( xbar$001$xbar_resp$003_val ),
    .xbar_resp$004_msg ( xbar$001$xbar_resp$004_msg ),
    .xbar_resp$004_val ( xbar$001$xbar_resp$004_val ),
    .xbar_resp$005_msg ( xbar$001$xbar_resp$005_msg ),
    .xbar_resp$005_val ( xbar$001$xbar_resp$005_val ),
    .xbar_resp$006_msg ( xbar$001$xbar_resp$006_msg ),
    .xbar_resp$006_val ( xbar$001$xbar_resp$006_val ),
    .xbar_resp$007_msg ( xbar$001$xbar_resp$007_msg ),
    .xbar_resp$007_val ( xbar$001$xbar_resp$007_val ),
    .bank_req$000_msg  ( xbar$001$bank_req$000_msg ),
    .bank_req$000_val  ( xbar$001$bank_req$000_val ),
    .bank_req$001_msg  ( xbar$001$bank_req$001_msg ),
    .bank_req$001_val  ( xbar$001$bank_req$001_val ),
    .bank_req$002_msg  ( xbar$001$bank_req$002_msg ),
    .bank_req$002_val  ( xbar$001$bank_req$002_val ),
    .bank_req$003_msg  ( xbar$001$bank_req$003_msg ),
    .bank_req$003_val  ( xbar$001$bank_req$003_val ),
    .bank_req$004_msg  ( xbar$001$bank_req$004_msg ),
    .bank_req$004_val  ( xbar$001$bank_req$004_val ),
    .bank_req$005_msg  ( xbar$001$bank_req$005_msg ),
    .bank_req$005_val  ( xbar$001$bank_req$005_val ),
    .bank_req$006_msg  ( xbar$001$bank_req$006_msg ),
    .bank_req$006_val  ( xbar$001$bank_req$006_val ),
    .bank_req$007_msg  ( xbar$001$bank_req$007_msg ),
    .bank_req$007_val  ( xbar$001$bank_req$007_val ),
    .bank_resp$000_rdy ( xbar$001$bank_resp$000_rdy ),
    .bank_resp$001_rdy ( xbar$001$bank_resp$001_rdy ),
    .bank_resp$002_rdy ( xbar$001$bank_resp$002_rdy ),
    .bank_resp$003_rdy ( xbar$001$bank_resp$003_rdy ),
    .bank_resp$004_rdy ( xbar$001$bank_resp$004_rdy ),
    .bank_resp$005_rdy ( xbar$001$bank_resp$005_rdy ),
    .bank_resp$006_rdy ( xbar$001$bank_resp$006_rdy ),
    .bank_resp$007_rdy ( xbar$001$bank_resp$007_rdy )
  );

  // xbar$002 temporaries
  wire   [   0:0] xbar$002$clk;
  wire   [   0:0] xbar$002$reset;
  wire   [  31:0] xbar$002$xbar_req$000_msg;
  wire   [   0:0] xbar$002$xbar_req$000_val;
  wire   [  31:0] xbar$002$xbar_req$001_msg;
  wire   [   0:0] xbar$002$xbar_req$001_val;
  wire   [  31:0] xbar$002$xbar_req$002_msg;
  wire   [   0:0] xbar$002$xbar_req$002_val;
  wire   [  31:0] xbar$002$xbar_req$003_msg;
  wire   [   0:0] xbar$002$xbar_req$003_val;
  wire   [  31:0] xbar$002$xbar_req$004_msg;
  wire   [   0:0] xbar$002$xbar_req$004_val;
  wire   [  31:0] xbar$002$xbar_req$005_msg;
  wire   [   0:0] xbar$002$xbar_req$005_val;
  wire   [  31:0] xbar$002$xbar_req$006_msg;
  wire   [   0:0] xbar$002$xbar_req$006_val;
  wire   [  31:0] xbar$002$xbar_req$007_msg;
  wire   [   0:0] xbar$002$xbar_req$007_val;
  wire   [   0:0] xbar$002$xbar_resp$000_rdy;
  wire   [   0:0] xbar$002$xbar_resp$001_rdy;
  wire   [   0:0] xbar$002$xbar_resp$002_rdy;
  wire   [   0:0] xbar$002$xbar_resp$003_rdy;
  wire   [   0:0] xbar$002$xbar_resp$004_rdy;
  wire   [   0:0] xbar$002$xbar_resp$005_rdy;
  wire   [   0:0] xbar$002$xbar_resp$006_rdy;
  wire   [   0:0] xbar$002$xbar_resp$007_rdy;
  wire   [   0:0] xbar$002$bank_req$000_rdy;
  wire   [   0:0] xbar$002$bank_req$001_rdy;
  wire   [   0:0] xbar$002$bank_req$002_rdy;
  wire   [   0:0] xbar$002$bank_req$003_rdy;
  wire   [   0:0] xbar$002$bank_req$004_rdy;
  wire   [   0:0] xbar$002$bank_req$005_rdy;
  wire   [   0:0] xbar$002$bank_req$006_rdy;
  wire   [   0:0] xbar$002$bank_req$007_rdy;
  wire   [  63:0] xbar$002$bank_resp$000_msg;
  wire   [   0:0] xbar$002$bank_resp$000_val;
  wire   [  63:0] xbar$002$bank_resp$001_msg;
  wire   [   0:0] xbar$002$bank_resp$001_val;
  wire   [  63:0] xbar$002$bank_resp$002_msg;
  wire   [   0:0] xbar$002$bank_resp$002_val;
  wire   [  63:0] xbar$002$bank_resp$003_msg;
  wire   [   0:0] xbar$002$bank_resp$003_val;
  wire   [  63:0] xbar$002$bank_resp$004_msg;
  wire   [   0:0] xbar$002$bank_resp$004_val;
  wire   [  63:0] xbar$002$bank_resp$005_msg;
  wire   [   0:0] xbar$002$bank_resp$005_val;
  wire   [  63:0] xbar$002$bank_resp$006_msg;
  wire   [   0:0] xbar$002$bank_resp$006_val;
  wire   [  63:0] xbar$002$bank_resp$007_msg;
  wire   [   0:0] xbar$002$bank_resp$007_val;
  wire   [   0:0] xbar$002$xbar_req$000_rdy;
  wire   [   0:0] xbar$002$xbar_req$001_rdy;
  wire   [   0:0] xbar$002$xbar_req$002_rdy;
  wire   [   0:0] xbar$002$xbar_req$003_rdy;
  wire   [   0:0] xbar$002$xbar_req$004_rdy;
  wire   [   0:0] xbar$002$xbar_req$005_rdy;
  wire   [   0:0] xbar$002$xbar_req$006_rdy;
  wire   [   0:0] xbar$002$xbar_req$007_rdy;
  wire   [  63:0] xbar$002$xbar_resp$000_msg;
  wire   [   0:0] xbar$002$xbar_resp$000_val;
  wire   [  63:0] xbar$002$xbar_resp$001_msg;
  wire   [   0:0] xbar$002$xbar_resp$001_val;
  wire   [  63:0] xbar$002$xbar_resp$002_msg;
  wire   [   0:0] xbar$002$xbar_resp$002_val;
  wire   [  63:0] xbar$002$xbar_resp$003_msg;
  wire   [   0:0] xbar$002$xbar_resp$003_val;
  wire   [  63:0] xbar$002$xbar_resp$004_msg;
  wire   [   0:0] xbar$002$xbar_resp$004_val;
  wire   [  63:0] xbar$002$xbar_resp$005_msg;
  wire   [   0:0] xbar$002$xbar_resp$005_val;
  wire   [  63:0] xbar$002$xbar_resp$006_msg;
  wire   [   0:0] xbar$002$xbar_resp$006_val;
  wire   [  63:0] xbar$002$xbar_resp$007_msg;
  wire   [   0:0] xbar$002$xbar_resp$007_val;
  wire   [  31:0] xbar$002$bank_req$000_msg;
  wire   [   0:0] xbar$002$bank_req$000_val;
  wire   [  31:0] xbar$002$bank_req$001_msg;
  wire   [   0:0] xbar$002$bank_req$001_val;
  wire   [  31:0] xbar$002$bank_req$002_msg;
  wire   [   0:0] xbar$002$bank_req$002_val;
  wire   [  31:0] xbar$002$bank_req$003_msg;
  wire   [   0:0] xbar$002$bank_req$003_val;
  wire   [  31:0] xbar$002$bank_req$004_msg;
  wire   [   0:0] xbar$002$bank_req$004_val;
  wire   [  31:0] xbar$002$bank_req$005_msg;
  wire   [   0:0] xbar$002$bank_req$005_val;
  wire   [  31:0] xbar$002$bank_req$006_msg;
  wire   [   0:0] xbar$002$bank_req$006_val;
  wire   [  31:0] xbar$002$bank_req$007_msg;
  wire   [   0:0] xbar$002$bank_req$007_val;
  wire   [   0:0] xbar$002$bank_resp$000_rdy;
  wire   [   0:0] xbar$002$bank_resp$001_rdy;
  wire   [   0:0] xbar$002$bank_resp$002_rdy;
  wire   [   0:0] xbar$002$bank_resp$003_rdy;
  wire   [   0:0] xbar$002$bank_resp$004_rdy;
  wire   [   0:0] xbar$002$bank_resp$005_rdy;
  wire   [   0:0] xbar$002$bank_resp$006_rdy;
  wire   [   0:0] xbar$002$bank_resp$007_rdy;

  crossbar_0x48d3814e38ed84e5 xbar$002
  (
    .clk               ( xbar$002$clk ),
    .reset             ( xbar$002$reset ),
    .xbar_req$000_msg  ( xbar$002$xbar_req$000_msg ),
    .xbar_req$000_val  ( xbar$002$xbar_req$000_val ),
    .xbar_req$001_msg  ( xbar$002$xbar_req$001_msg ),
    .xbar_req$001_val  ( xbar$002$xbar_req$001_val ),
    .xbar_req$002_msg  ( xbar$002$xbar_req$002_msg ),
    .xbar_req$002_val  ( xbar$002$xbar_req$002_val ),
    .xbar_req$003_msg  ( xbar$002$xbar_req$003_msg ),
    .xbar_req$003_val  ( xbar$002$xbar_req$003_val ),
    .xbar_req$004_msg  ( xbar$002$xbar_req$004_msg ),
    .xbar_req$004_val  ( xbar$002$xbar_req$004_val ),
    .xbar_req$005_msg  ( xbar$002$xbar_req$005_msg ),
    .xbar_req$005_val  ( xbar$002$xbar_req$005_val ),
    .xbar_req$006_msg  ( xbar$002$xbar_req$006_msg ),
    .xbar_req$006_val  ( xbar$002$xbar_req$006_val ),
    .xbar_req$007_msg  ( xbar$002$xbar_req$007_msg ),
    .xbar_req$007_val  ( xbar$002$xbar_req$007_val ),
    .xbar_resp$000_rdy ( xbar$002$xbar_resp$000_rdy ),
    .xbar_resp$001_rdy ( xbar$002$xbar_resp$001_rdy ),
    .xbar_resp$002_rdy ( xbar$002$xbar_resp$002_rdy ),
    .xbar_resp$003_rdy ( xbar$002$xbar_resp$003_rdy ),
    .xbar_resp$004_rdy ( xbar$002$xbar_resp$004_rdy ),
    .xbar_resp$005_rdy ( xbar$002$xbar_resp$005_rdy ),
    .xbar_resp$006_rdy ( xbar$002$xbar_resp$006_rdy ),
    .xbar_resp$007_rdy ( xbar$002$xbar_resp$007_rdy ),
    .bank_req$000_rdy  ( xbar$002$bank_req$000_rdy ),
    .bank_req$001_rdy  ( xbar$002$bank_req$001_rdy ),
    .bank_req$002_rdy  ( xbar$002$bank_req$002_rdy ),
    .bank_req$003_rdy  ( xbar$002$bank_req$003_rdy ),
    .bank_req$004_rdy  ( xbar$002$bank_req$004_rdy ),
    .bank_req$005_rdy  ( xbar$002$bank_req$005_rdy ),
    .bank_req$006_rdy  ( xbar$002$bank_req$006_rdy ),
    .bank_req$007_rdy  ( xbar$002$bank_req$007_rdy ),
    .bank_resp$000_msg ( xbar$002$bank_resp$000_msg ),
    .bank_resp$000_val ( xbar$002$bank_resp$000_val ),
    .bank_resp$001_msg ( xbar$002$bank_resp$001_msg ),
    .bank_resp$001_val ( xbar$002$bank_resp$001_val ),
    .bank_resp$002_msg ( xbar$002$bank_resp$002_msg ),
    .bank_resp$002_val ( xbar$002$bank_resp$002_val ),
    .bank_resp$003_msg ( xbar$002$bank_resp$003_msg ),
    .bank_resp$003_val ( xbar$002$bank_resp$003_val ),
    .bank_resp$004_msg ( xbar$002$bank_resp$004_msg ),
    .bank_resp$004_val ( xbar$002$bank_resp$004_val ),
    .bank_resp$005_msg ( xbar$002$bank_resp$005_msg ),
    .bank_resp$005_val ( xbar$002$bank_resp$005_val ),
    .bank_resp$006_msg ( xbar$002$bank_resp$006_msg ),
    .bank_resp$006_val ( xbar$002$bank_resp$006_val ),
    .bank_resp$007_msg ( xbar$002$bank_resp$007_msg ),
    .bank_resp$007_val ( xbar$002$bank_resp$007_val ),
    .xbar_req$000_rdy  ( xbar$002$xbar_req$000_rdy ),
    .xbar_req$001_rdy  ( xbar$002$xbar_req$001_rdy ),
    .xbar_req$002_rdy  ( xbar$002$xbar_req$002_rdy ),
    .xbar_req$003_rdy  ( xbar$002$xbar_req$003_rdy ),
    .xbar_req$004_rdy  ( xbar$002$xbar_req$004_rdy ),
    .xbar_req$005_rdy  ( xbar$002$xbar_req$005_rdy ),
    .xbar_req$006_rdy  ( xbar$002$xbar_req$006_rdy ),
    .xbar_req$007_rdy  ( xbar$002$xbar_req$007_rdy ),
    .xbar_resp$000_msg ( xbar$002$xbar_resp$000_msg ),
    .xbar_resp$000_val ( xbar$002$xbar_resp$000_val ),
    .xbar_resp$001_msg ( xbar$002$xbar_resp$001_msg ),
    .xbar_resp$001_val ( xbar$002$xbar_resp$001_val ),
    .xbar_resp$002_msg ( xbar$002$xbar_resp$002_msg ),
    .xbar_resp$002_val ( xbar$002$xbar_resp$002_val ),
    .xbar_resp$003_msg ( xbar$002$xbar_resp$003_msg ),
    .xbar_resp$003_val ( xbar$002$xbar_resp$003_val ),
    .xbar_resp$004_msg ( xbar$002$xbar_resp$004_msg ),
    .xbar_resp$004_val ( xbar$002$xbar_resp$004_val ),
    .xbar_resp$005_msg ( xbar$002$xbar_resp$005_msg ),
    .xbar_resp$005_val ( xbar$002$xbar_resp$005_val ),
    .xbar_resp$006_msg ( xbar$002$xbar_resp$006_msg ),
    .xbar_resp$006_val ( xbar$002$xbar_resp$006_val ),
    .xbar_resp$007_msg ( xbar$002$xbar_resp$007_msg ),
    .xbar_resp$007_val ( xbar$002$xbar_resp$007_val ),
    .bank_req$000_msg  ( xbar$002$bank_req$000_msg ),
    .bank_req$000_val  ( xbar$002$bank_req$000_val ),
    .bank_req$001_msg  ( xbar$002$bank_req$001_msg ),
    .bank_req$001_val  ( xbar$002$bank_req$001_val ),
    .bank_req$002_msg  ( xbar$002$bank_req$002_msg ),
    .bank_req$002_val  ( xbar$002$bank_req$002_val ),
    .bank_req$003_msg  ( xbar$002$bank_req$003_msg ),
    .bank_req$003_val  ( xbar$002$bank_req$003_val ),
    .bank_req$004_msg  ( xbar$002$bank_req$004_msg ),
    .bank_req$004_val  ( xbar$002$bank_req$004_val ),
    .bank_req$005_msg  ( xbar$002$bank_req$005_msg ),
    .bank_req$005_val  ( xbar$002$bank_req$005_val ),
    .bank_req$006_msg  ( xbar$002$bank_req$006_msg ),
    .bank_req$006_val  ( xbar$002$bank_req$006_val ),
    .bank_req$007_msg  ( xbar$002$bank_req$007_msg ),
    .bank_req$007_val  ( xbar$002$bank_req$007_val ),
    .bank_resp$000_rdy ( xbar$002$bank_resp$000_rdy ),
    .bank_resp$001_rdy ( xbar$002$bank_resp$001_rdy ),
    .bank_resp$002_rdy ( xbar$002$bank_resp$002_rdy ),
    .bank_resp$003_rdy ( xbar$002$bank_resp$003_rdy ),
    .bank_resp$004_rdy ( xbar$002$bank_resp$004_rdy ),
    .bank_resp$005_rdy ( xbar$002$bank_resp$005_rdy ),
    .bank_resp$006_rdy ( xbar$002$bank_resp$006_rdy ),
    .bank_resp$007_rdy ( xbar$002$bank_resp$007_rdy )
  );

  // xbar$003 temporaries
  wire   [   0:0] xbar$003$clk;
  wire   [   0:0] xbar$003$reset;
  wire   [  31:0] xbar$003$xbar_req$000_msg;
  wire   [   0:0] xbar$003$xbar_req$000_val;
  wire   [  31:0] xbar$003$xbar_req$001_msg;
  wire   [   0:0] xbar$003$xbar_req$001_val;
  wire   [  31:0] xbar$003$xbar_req$002_msg;
  wire   [   0:0] xbar$003$xbar_req$002_val;
  wire   [  31:0] xbar$003$xbar_req$003_msg;
  wire   [   0:0] xbar$003$xbar_req$003_val;
  wire   [  31:0] xbar$003$xbar_req$004_msg;
  wire   [   0:0] xbar$003$xbar_req$004_val;
  wire   [  31:0] xbar$003$xbar_req$005_msg;
  wire   [   0:0] xbar$003$xbar_req$005_val;
  wire   [  31:0] xbar$003$xbar_req$006_msg;
  wire   [   0:0] xbar$003$xbar_req$006_val;
  wire   [  31:0] xbar$003$xbar_req$007_msg;
  wire   [   0:0] xbar$003$xbar_req$007_val;
  wire   [   0:0] xbar$003$xbar_resp$000_rdy;
  wire   [   0:0] xbar$003$xbar_resp$001_rdy;
  wire   [   0:0] xbar$003$xbar_resp$002_rdy;
  wire   [   0:0] xbar$003$xbar_resp$003_rdy;
  wire   [   0:0] xbar$003$xbar_resp$004_rdy;
  wire   [   0:0] xbar$003$xbar_resp$005_rdy;
  wire   [   0:0] xbar$003$xbar_resp$006_rdy;
  wire   [   0:0] xbar$003$xbar_resp$007_rdy;
  wire   [   0:0] xbar$003$bank_req$000_rdy;
  wire   [   0:0] xbar$003$bank_req$001_rdy;
  wire   [   0:0] xbar$003$bank_req$002_rdy;
  wire   [   0:0] xbar$003$bank_req$003_rdy;
  wire   [   0:0] xbar$003$bank_req$004_rdy;
  wire   [   0:0] xbar$003$bank_req$005_rdy;
  wire   [   0:0] xbar$003$bank_req$006_rdy;
  wire   [   0:0] xbar$003$bank_req$007_rdy;
  wire   [  63:0] xbar$003$bank_resp$000_msg;
  wire   [   0:0] xbar$003$bank_resp$000_val;
  wire   [  63:0] xbar$003$bank_resp$001_msg;
  wire   [   0:0] xbar$003$bank_resp$001_val;
  wire   [  63:0] xbar$003$bank_resp$002_msg;
  wire   [   0:0] xbar$003$bank_resp$002_val;
  wire   [  63:0] xbar$003$bank_resp$003_msg;
  wire   [   0:0] xbar$003$bank_resp$003_val;
  wire   [  63:0] xbar$003$bank_resp$004_msg;
  wire   [   0:0] xbar$003$bank_resp$004_val;
  wire   [  63:0] xbar$003$bank_resp$005_msg;
  wire   [   0:0] xbar$003$bank_resp$005_val;
  wire   [  63:0] xbar$003$bank_resp$006_msg;
  wire   [   0:0] xbar$003$bank_resp$006_val;
  wire   [  63:0] xbar$003$bank_resp$007_msg;
  wire   [   0:0] xbar$003$bank_resp$007_val;
  wire   [   0:0] xbar$003$xbar_req$000_rdy;
  wire   [   0:0] xbar$003$xbar_req$001_rdy;
  wire   [   0:0] xbar$003$xbar_req$002_rdy;
  wire   [   0:0] xbar$003$xbar_req$003_rdy;
  wire   [   0:0] xbar$003$xbar_req$004_rdy;
  wire   [   0:0] xbar$003$xbar_req$005_rdy;
  wire   [   0:0] xbar$003$xbar_req$006_rdy;
  wire   [   0:0] xbar$003$xbar_req$007_rdy;
  wire   [  63:0] xbar$003$xbar_resp$000_msg;
  wire   [   0:0] xbar$003$xbar_resp$000_val;
  wire   [  63:0] xbar$003$xbar_resp$001_msg;
  wire   [   0:0] xbar$003$xbar_resp$001_val;
  wire   [  63:0] xbar$003$xbar_resp$002_msg;
  wire   [   0:0] xbar$003$xbar_resp$002_val;
  wire   [  63:0] xbar$003$xbar_resp$003_msg;
  wire   [   0:0] xbar$003$xbar_resp$003_val;
  wire   [  63:0] xbar$003$xbar_resp$004_msg;
  wire   [   0:0] xbar$003$xbar_resp$004_val;
  wire   [  63:0] xbar$003$xbar_resp$005_msg;
  wire   [   0:0] xbar$003$xbar_resp$005_val;
  wire   [  63:0] xbar$003$xbar_resp$006_msg;
  wire   [   0:0] xbar$003$xbar_resp$006_val;
  wire   [  63:0] xbar$003$xbar_resp$007_msg;
  wire   [   0:0] xbar$003$xbar_resp$007_val;
  wire   [  31:0] xbar$003$bank_req$000_msg;
  wire   [   0:0] xbar$003$bank_req$000_val;
  wire   [  31:0] xbar$003$bank_req$001_msg;
  wire   [   0:0] xbar$003$bank_req$001_val;
  wire   [  31:0] xbar$003$bank_req$002_msg;
  wire   [   0:0] xbar$003$bank_req$002_val;
  wire   [  31:0] xbar$003$bank_req$003_msg;
  wire   [   0:0] xbar$003$bank_req$003_val;
  wire   [  31:0] xbar$003$bank_req$004_msg;
  wire   [   0:0] xbar$003$bank_req$004_val;
  wire   [  31:0] xbar$003$bank_req$005_msg;
  wire   [   0:0] xbar$003$bank_req$005_val;
  wire   [  31:0] xbar$003$bank_req$006_msg;
  wire   [   0:0] xbar$003$bank_req$006_val;
  wire   [  31:0] xbar$003$bank_req$007_msg;
  wire   [   0:0] xbar$003$bank_req$007_val;
  wire   [   0:0] xbar$003$bank_resp$000_rdy;
  wire   [   0:0] xbar$003$bank_resp$001_rdy;
  wire   [   0:0] xbar$003$bank_resp$002_rdy;
  wire   [   0:0] xbar$003$bank_resp$003_rdy;
  wire   [   0:0] xbar$003$bank_resp$004_rdy;
  wire   [   0:0] xbar$003$bank_resp$005_rdy;
  wire   [   0:0] xbar$003$bank_resp$006_rdy;
  wire   [   0:0] xbar$003$bank_resp$007_rdy;

  crossbar_0x48d3814e38ed84e5 xbar$003
  (
    .clk               ( xbar$003$clk ),
    .reset             ( xbar$003$reset ),
    .xbar_req$000_msg  ( xbar$003$xbar_req$000_msg ),
    .xbar_req$000_val  ( xbar$003$xbar_req$000_val ),
    .xbar_req$001_msg  ( xbar$003$xbar_req$001_msg ),
    .xbar_req$001_val  ( xbar$003$xbar_req$001_val ),
    .xbar_req$002_msg  ( xbar$003$xbar_req$002_msg ),
    .xbar_req$002_val  ( xbar$003$xbar_req$002_val ),
    .xbar_req$003_msg  ( xbar$003$xbar_req$003_msg ),
    .xbar_req$003_val  ( xbar$003$xbar_req$003_val ),
    .xbar_req$004_msg  ( xbar$003$xbar_req$004_msg ),
    .xbar_req$004_val  ( xbar$003$xbar_req$004_val ),
    .xbar_req$005_msg  ( xbar$003$xbar_req$005_msg ),
    .xbar_req$005_val  ( xbar$003$xbar_req$005_val ),
    .xbar_req$006_msg  ( xbar$003$xbar_req$006_msg ),
    .xbar_req$006_val  ( xbar$003$xbar_req$006_val ),
    .xbar_req$007_msg  ( xbar$003$xbar_req$007_msg ),
    .xbar_req$007_val  ( xbar$003$xbar_req$007_val ),
    .xbar_resp$000_rdy ( xbar$003$xbar_resp$000_rdy ),
    .xbar_resp$001_rdy ( xbar$003$xbar_resp$001_rdy ),
    .xbar_resp$002_rdy ( xbar$003$xbar_resp$002_rdy ),
    .xbar_resp$003_rdy ( xbar$003$xbar_resp$003_rdy ),
    .xbar_resp$004_rdy ( xbar$003$xbar_resp$004_rdy ),
    .xbar_resp$005_rdy ( xbar$003$xbar_resp$005_rdy ),
    .xbar_resp$006_rdy ( xbar$003$xbar_resp$006_rdy ),
    .xbar_resp$007_rdy ( xbar$003$xbar_resp$007_rdy ),
    .bank_req$000_rdy  ( xbar$003$bank_req$000_rdy ),
    .bank_req$001_rdy  ( xbar$003$bank_req$001_rdy ),
    .bank_req$002_rdy  ( xbar$003$bank_req$002_rdy ),
    .bank_req$003_rdy  ( xbar$003$bank_req$003_rdy ),
    .bank_req$004_rdy  ( xbar$003$bank_req$004_rdy ),
    .bank_req$005_rdy  ( xbar$003$bank_req$005_rdy ),
    .bank_req$006_rdy  ( xbar$003$bank_req$006_rdy ),
    .bank_req$007_rdy  ( xbar$003$bank_req$007_rdy ),
    .bank_resp$000_msg ( xbar$003$bank_resp$000_msg ),
    .bank_resp$000_val ( xbar$003$bank_resp$000_val ),
    .bank_resp$001_msg ( xbar$003$bank_resp$001_msg ),
    .bank_resp$001_val ( xbar$003$bank_resp$001_val ),
    .bank_resp$002_msg ( xbar$003$bank_resp$002_msg ),
    .bank_resp$002_val ( xbar$003$bank_resp$002_val ),
    .bank_resp$003_msg ( xbar$003$bank_resp$003_msg ),
    .bank_resp$003_val ( xbar$003$bank_resp$003_val ),
    .bank_resp$004_msg ( xbar$003$bank_resp$004_msg ),
    .bank_resp$004_val ( xbar$003$bank_resp$004_val ),
    .bank_resp$005_msg ( xbar$003$bank_resp$005_msg ),
    .bank_resp$005_val ( xbar$003$bank_resp$005_val ),
    .bank_resp$006_msg ( xbar$003$bank_resp$006_msg ),
    .bank_resp$006_val ( xbar$003$bank_resp$006_val ),
    .bank_resp$007_msg ( xbar$003$bank_resp$007_msg ),
    .bank_resp$007_val ( xbar$003$bank_resp$007_val ),
    .xbar_req$000_rdy  ( xbar$003$xbar_req$000_rdy ),
    .xbar_req$001_rdy  ( xbar$003$xbar_req$001_rdy ),
    .xbar_req$002_rdy  ( xbar$003$xbar_req$002_rdy ),
    .xbar_req$003_rdy  ( xbar$003$xbar_req$003_rdy ),
    .xbar_req$004_rdy  ( xbar$003$xbar_req$004_rdy ),
    .xbar_req$005_rdy  ( xbar$003$xbar_req$005_rdy ),
    .xbar_req$006_rdy  ( xbar$003$xbar_req$006_rdy ),
    .xbar_req$007_rdy  ( xbar$003$xbar_req$007_rdy ),
    .xbar_resp$000_msg ( xbar$003$xbar_resp$000_msg ),
    .xbar_resp$000_val ( xbar$003$xbar_resp$000_val ),
    .xbar_resp$001_msg ( xbar$003$xbar_resp$001_msg ),
    .xbar_resp$001_val ( xbar$003$xbar_resp$001_val ),
    .xbar_resp$002_msg ( xbar$003$xbar_resp$002_msg ),
    .xbar_resp$002_val ( xbar$003$xbar_resp$002_val ),
    .xbar_resp$003_msg ( xbar$003$xbar_resp$003_msg ),
    .xbar_resp$003_val ( xbar$003$xbar_resp$003_val ),
    .xbar_resp$004_msg ( xbar$003$xbar_resp$004_msg ),
    .xbar_resp$004_val ( xbar$003$xbar_resp$004_val ),
    .xbar_resp$005_msg ( xbar$003$xbar_resp$005_msg ),
    .xbar_resp$005_val ( xbar$003$xbar_resp$005_val ),
    .xbar_resp$006_msg ( xbar$003$xbar_resp$006_msg ),
    .xbar_resp$006_val ( xbar$003$xbar_resp$006_val ),
    .xbar_resp$007_msg ( xbar$003$xbar_resp$007_msg ),
    .xbar_resp$007_val ( xbar$003$xbar_resp$007_val ),
    .bank_req$000_msg  ( xbar$003$bank_req$000_msg ),
    .bank_req$000_val  ( xbar$003$bank_req$000_val ),
    .bank_req$001_msg  ( xbar$003$bank_req$001_msg ),
    .bank_req$001_val  ( xbar$003$bank_req$001_val ),
    .bank_req$002_msg  ( xbar$003$bank_req$002_msg ),
    .bank_req$002_val  ( xbar$003$bank_req$002_val ),
    .bank_req$003_msg  ( xbar$003$bank_req$003_msg ),
    .bank_req$003_val  ( xbar$003$bank_req$003_val ),
    .bank_req$004_msg  ( xbar$003$bank_req$004_msg ),
    .bank_req$004_val  ( xbar$003$bank_req$004_val ),
    .bank_req$005_msg  ( xbar$003$bank_req$005_msg ),
    .bank_req$005_val  ( xbar$003$bank_req$005_val ),
    .bank_req$006_msg  ( xbar$003$bank_req$006_msg ),
    .bank_req$006_val  ( xbar$003$bank_req$006_val ),
    .bank_req$007_msg  ( xbar$003$bank_req$007_msg ),
    .bank_req$007_val  ( xbar$003$bank_req$007_val ),
    .bank_resp$000_rdy ( xbar$003$bank_resp$000_rdy ),
    .bank_resp$001_rdy ( xbar$003$bank_resp$001_rdy ),
    .bank_resp$002_rdy ( xbar$003$bank_resp$002_rdy ),
    .bank_resp$003_rdy ( xbar$003$bank_resp$003_rdy ),
    .bank_resp$004_rdy ( xbar$003$bank_resp$004_rdy ),
    .bank_resp$005_rdy ( xbar$003$bank_resp$005_rdy ),
    .bank_resp$006_rdy ( xbar$003$bank_resp$006_rdy ),
    .bank_resp$007_rdy ( xbar$003$bank_resp$007_rdy )
  );

  // xbar$004 temporaries
  wire   [   0:0] xbar$004$clk;
  wire   [   0:0] xbar$004$reset;
  wire   [  31:0] xbar$004$xbar_req$000_msg;
  wire   [   0:0] xbar$004$xbar_req$000_val;
  wire   [  31:0] xbar$004$xbar_req$001_msg;
  wire   [   0:0] xbar$004$xbar_req$001_val;
  wire   [  31:0] xbar$004$xbar_req$002_msg;
  wire   [   0:0] xbar$004$xbar_req$002_val;
  wire   [  31:0] xbar$004$xbar_req$003_msg;
  wire   [   0:0] xbar$004$xbar_req$003_val;
  wire   [  31:0] xbar$004$xbar_req$004_msg;
  wire   [   0:0] xbar$004$xbar_req$004_val;
  wire   [  31:0] xbar$004$xbar_req$005_msg;
  wire   [   0:0] xbar$004$xbar_req$005_val;
  wire   [  31:0] xbar$004$xbar_req$006_msg;
  wire   [   0:0] xbar$004$xbar_req$006_val;
  wire   [  31:0] xbar$004$xbar_req$007_msg;
  wire   [   0:0] xbar$004$xbar_req$007_val;
  wire   [   0:0] xbar$004$xbar_resp$000_rdy;
  wire   [   0:0] xbar$004$xbar_resp$001_rdy;
  wire   [   0:0] xbar$004$xbar_resp$002_rdy;
  wire   [   0:0] xbar$004$xbar_resp$003_rdy;
  wire   [   0:0] xbar$004$xbar_resp$004_rdy;
  wire   [   0:0] xbar$004$xbar_resp$005_rdy;
  wire   [   0:0] xbar$004$xbar_resp$006_rdy;
  wire   [   0:0] xbar$004$xbar_resp$007_rdy;
  wire   [   0:0] xbar$004$bank_req$000_rdy;
  wire   [   0:0] xbar$004$bank_req$001_rdy;
  wire   [   0:0] xbar$004$bank_req$002_rdy;
  wire   [   0:0] xbar$004$bank_req$003_rdy;
  wire   [   0:0] xbar$004$bank_req$004_rdy;
  wire   [   0:0] xbar$004$bank_req$005_rdy;
  wire   [   0:0] xbar$004$bank_req$006_rdy;
  wire   [   0:0] xbar$004$bank_req$007_rdy;
  wire   [  63:0] xbar$004$bank_resp$000_msg;
  wire   [   0:0] xbar$004$bank_resp$000_val;
  wire   [  63:0] xbar$004$bank_resp$001_msg;
  wire   [   0:0] xbar$004$bank_resp$001_val;
  wire   [  63:0] xbar$004$bank_resp$002_msg;
  wire   [   0:0] xbar$004$bank_resp$002_val;
  wire   [  63:0] xbar$004$bank_resp$003_msg;
  wire   [   0:0] xbar$004$bank_resp$003_val;
  wire   [  63:0] xbar$004$bank_resp$004_msg;
  wire   [   0:0] xbar$004$bank_resp$004_val;
  wire   [  63:0] xbar$004$bank_resp$005_msg;
  wire   [   0:0] xbar$004$bank_resp$005_val;
  wire   [  63:0] xbar$004$bank_resp$006_msg;
  wire   [   0:0] xbar$004$bank_resp$006_val;
  wire   [  63:0] xbar$004$bank_resp$007_msg;
  wire   [   0:0] xbar$004$bank_resp$007_val;
  wire   [   0:0] xbar$004$xbar_req$000_rdy;
  wire   [   0:0] xbar$004$xbar_req$001_rdy;
  wire   [   0:0] xbar$004$xbar_req$002_rdy;
  wire   [   0:0] xbar$004$xbar_req$003_rdy;
  wire   [   0:0] xbar$004$xbar_req$004_rdy;
  wire   [   0:0] xbar$004$xbar_req$005_rdy;
  wire   [   0:0] xbar$004$xbar_req$006_rdy;
  wire   [   0:0] xbar$004$xbar_req$007_rdy;
  wire   [  63:0] xbar$004$xbar_resp$000_msg;
  wire   [   0:0] xbar$004$xbar_resp$000_val;
  wire   [  63:0] xbar$004$xbar_resp$001_msg;
  wire   [   0:0] xbar$004$xbar_resp$001_val;
  wire   [  63:0] xbar$004$xbar_resp$002_msg;
  wire   [   0:0] xbar$004$xbar_resp$002_val;
  wire   [  63:0] xbar$004$xbar_resp$003_msg;
  wire   [   0:0] xbar$004$xbar_resp$003_val;
  wire   [  63:0] xbar$004$xbar_resp$004_msg;
  wire   [   0:0] xbar$004$xbar_resp$004_val;
  wire   [  63:0] xbar$004$xbar_resp$005_msg;
  wire   [   0:0] xbar$004$xbar_resp$005_val;
  wire   [  63:0] xbar$004$xbar_resp$006_msg;
  wire   [   0:0] xbar$004$xbar_resp$006_val;
  wire   [  63:0] xbar$004$xbar_resp$007_msg;
  wire   [   0:0] xbar$004$xbar_resp$007_val;
  wire   [  31:0] xbar$004$bank_req$000_msg;
  wire   [   0:0] xbar$004$bank_req$000_val;
  wire   [  31:0] xbar$004$bank_req$001_msg;
  wire   [   0:0] xbar$004$bank_req$001_val;
  wire   [  31:0] xbar$004$bank_req$002_msg;
  wire   [   0:0] xbar$004$bank_req$002_val;
  wire   [  31:0] xbar$004$bank_req$003_msg;
  wire   [   0:0] xbar$004$bank_req$003_val;
  wire   [  31:0] xbar$004$bank_req$004_msg;
  wire   [   0:0] xbar$004$bank_req$004_val;
  wire   [  31:0] xbar$004$bank_req$005_msg;
  wire   [   0:0] xbar$004$bank_req$005_val;
  wire   [  31:0] xbar$004$bank_req$006_msg;
  wire   [   0:0] xbar$004$bank_req$006_val;
  wire   [  31:0] xbar$004$bank_req$007_msg;
  wire   [   0:0] xbar$004$bank_req$007_val;
  wire   [   0:0] xbar$004$bank_resp$000_rdy;
  wire   [   0:0] xbar$004$bank_resp$001_rdy;
  wire   [   0:0] xbar$004$bank_resp$002_rdy;
  wire   [   0:0] xbar$004$bank_resp$003_rdy;
  wire   [   0:0] xbar$004$bank_resp$004_rdy;
  wire   [   0:0] xbar$004$bank_resp$005_rdy;
  wire   [   0:0] xbar$004$bank_resp$006_rdy;
  wire   [   0:0] xbar$004$bank_resp$007_rdy;

  crossbar_0x48d3814e38ed84e5 xbar$004
  (
    .clk               ( xbar$004$clk ),
    .reset             ( xbar$004$reset ),
    .xbar_req$000_msg  ( xbar$004$xbar_req$000_msg ),
    .xbar_req$000_val  ( xbar$004$xbar_req$000_val ),
    .xbar_req$001_msg  ( xbar$004$xbar_req$001_msg ),
    .xbar_req$001_val  ( xbar$004$xbar_req$001_val ),
    .xbar_req$002_msg  ( xbar$004$xbar_req$002_msg ),
    .xbar_req$002_val  ( xbar$004$xbar_req$002_val ),
    .xbar_req$003_msg  ( xbar$004$xbar_req$003_msg ),
    .xbar_req$003_val  ( xbar$004$xbar_req$003_val ),
    .xbar_req$004_msg  ( xbar$004$xbar_req$004_msg ),
    .xbar_req$004_val  ( xbar$004$xbar_req$004_val ),
    .xbar_req$005_msg  ( xbar$004$xbar_req$005_msg ),
    .xbar_req$005_val  ( xbar$004$xbar_req$005_val ),
    .xbar_req$006_msg  ( xbar$004$xbar_req$006_msg ),
    .xbar_req$006_val  ( xbar$004$xbar_req$006_val ),
    .xbar_req$007_msg  ( xbar$004$xbar_req$007_msg ),
    .xbar_req$007_val  ( xbar$004$xbar_req$007_val ),
    .xbar_resp$000_rdy ( xbar$004$xbar_resp$000_rdy ),
    .xbar_resp$001_rdy ( xbar$004$xbar_resp$001_rdy ),
    .xbar_resp$002_rdy ( xbar$004$xbar_resp$002_rdy ),
    .xbar_resp$003_rdy ( xbar$004$xbar_resp$003_rdy ),
    .xbar_resp$004_rdy ( xbar$004$xbar_resp$004_rdy ),
    .xbar_resp$005_rdy ( xbar$004$xbar_resp$005_rdy ),
    .xbar_resp$006_rdy ( xbar$004$xbar_resp$006_rdy ),
    .xbar_resp$007_rdy ( xbar$004$xbar_resp$007_rdy ),
    .bank_req$000_rdy  ( xbar$004$bank_req$000_rdy ),
    .bank_req$001_rdy  ( xbar$004$bank_req$001_rdy ),
    .bank_req$002_rdy  ( xbar$004$bank_req$002_rdy ),
    .bank_req$003_rdy  ( xbar$004$bank_req$003_rdy ),
    .bank_req$004_rdy  ( xbar$004$bank_req$004_rdy ),
    .bank_req$005_rdy  ( xbar$004$bank_req$005_rdy ),
    .bank_req$006_rdy  ( xbar$004$bank_req$006_rdy ),
    .bank_req$007_rdy  ( xbar$004$bank_req$007_rdy ),
    .bank_resp$000_msg ( xbar$004$bank_resp$000_msg ),
    .bank_resp$000_val ( xbar$004$bank_resp$000_val ),
    .bank_resp$001_msg ( xbar$004$bank_resp$001_msg ),
    .bank_resp$001_val ( xbar$004$bank_resp$001_val ),
    .bank_resp$002_msg ( xbar$004$bank_resp$002_msg ),
    .bank_resp$002_val ( xbar$004$bank_resp$002_val ),
    .bank_resp$003_msg ( xbar$004$bank_resp$003_msg ),
    .bank_resp$003_val ( xbar$004$bank_resp$003_val ),
    .bank_resp$004_msg ( xbar$004$bank_resp$004_msg ),
    .bank_resp$004_val ( xbar$004$bank_resp$004_val ),
    .bank_resp$005_msg ( xbar$004$bank_resp$005_msg ),
    .bank_resp$005_val ( xbar$004$bank_resp$005_val ),
    .bank_resp$006_msg ( xbar$004$bank_resp$006_msg ),
    .bank_resp$006_val ( xbar$004$bank_resp$006_val ),
    .bank_resp$007_msg ( xbar$004$bank_resp$007_msg ),
    .bank_resp$007_val ( xbar$004$bank_resp$007_val ),
    .xbar_req$000_rdy  ( xbar$004$xbar_req$000_rdy ),
    .xbar_req$001_rdy  ( xbar$004$xbar_req$001_rdy ),
    .xbar_req$002_rdy  ( xbar$004$xbar_req$002_rdy ),
    .xbar_req$003_rdy  ( xbar$004$xbar_req$003_rdy ),
    .xbar_req$004_rdy  ( xbar$004$xbar_req$004_rdy ),
    .xbar_req$005_rdy  ( xbar$004$xbar_req$005_rdy ),
    .xbar_req$006_rdy  ( xbar$004$xbar_req$006_rdy ),
    .xbar_req$007_rdy  ( xbar$004$xbar_req$007_rdy ),
    .xbar_resp$000_msg ( xbar$004$xbar_resp$000_msg ),
    .xbar_resp$000_val ( xbar$004$xbar_resp$000_val ),
    .xbar_resp$001_msg ( xbar$004$xbar_resp$001_msg ),
    .xbar_resp$001_val ( xbar$004$xbar_resp$001_val ),
    .xbar_resp$002_msg ( xbar$004$xbar_resp$002_msg ),
    .xbar_resp$002_val ( xbar$004$xbar_resp$002_val ),
    .xbar_resp$003_msg ( xbar$004$xbar_resp$003_msg ),
    .xbar_resp$003_val ( xbar$004$xbar_resp$003_val ),
    .xbar_resp$004_msg ( xbar$004$xbar_resp$004_msg ),
    .xbar_resp$004_val ( xbar$004$xbar_resp$004_val ),
    .xbar_resp$005_msg ( xbar$004$xbar_resp$005_msg ),
    .xbar_resp$005_val ( xbar$004$xbar_resp$005_val ),
    .xbar_resp$006_msg ( xbar$004$xbar_resp$006_msg ),
    .xbar_resp$006_val ( xbar$004$xbar_resp$006_val ),
    .xbar_resp$007_msg ( xbar$004$xbar_resp$007_msg ),
    .xbar_resp$007_val ( xbar$004$xbar_resp$007_val ),
    .bank_req$000_msg  ( xbar$004$bank_req$000_msg ),
    .bank_req$000_val  ( xbar$004$bank_req$000_val ),
    .bank_req$001_msg  ( xbar$004$bank_req$001_msg ),
    .bank_req$001_val  ( xbar$004$bank_req$001_val ),
    .bank_req$002_msg  ( xbar$004$bank_req$002_msg ),
    .bank_req$002_val  ( xbar$004$bank_req$002_val ),
    .bank_req$003_msg  ( xbar$004$bank_req$003_msg ),
    .bank_req$003_val  ( xbar$004$bank_req$003_val ),
    .bank_req$004_msg  ( xbar$004$bank_req$004_msg ),
    .bank_req$004_val  ( xbar$004$bank_req$004_val ),
    .bank_req$005_msg  ( xbar$004$bank_req$005_msg ),
    .bank_req$005_val  ( xbar$004$bank_req$005_val ),
    .bank_req$006_msg  ( xbar$004$bank_req$006_msg ),
    .bank_req$006_val  ( xbar$004$bank_req$006_val ),
    .bank_req$007_msg  ( xbar$004$bank_req$007_msg ),
    .bank_req$007_val  ( xbar$004$bank_req$007_val ),
    .bank_resp$000_rdy ( xbar$004$bank_resp$000_rdy ),
    .bank_resp$001_rdy ( xbar$004$bank_resp$001_rdy ),
    .bank_resp$002_rdy ( xbar$004$bank_resp$002_rdy ),
    .bank_resp$003_rdy ( xbar$004$bank_resp$003_rdy ),
    .bank_resp$004_rdy ( xbar$004$bank_resp$004_rdy ),
    .bank_resp$005_rdy ( xbar$004$bank_resp$005_rdy ),
    .bank_resp$006_rdy ( xbar$004$bank_resp$006_rdy ),
    .bank_resp$007_rdy ( xbar$004$bank_resp$007_rdy )
  );

  // xbar$005 temporaries
  wire   [   0:0] xbar$005$clk;
  wire   [   0:0] xbar$005$reset;
  wire   [  31:0] xbar$005$xbar_req$000_msg;
  wire   [   0:0] xbar$005$xbar_req$000_val;
  wire   [  31:0] xbar$005$xbar_req$001_msg;
  wire   [   0:0] xbar$005$xbar_req$001_val;
  wire   [  31:0] xbar$005$xbar_req$002_msg;
  wire   [   0:0] xbar$005$xbar_req$002_val;
  wire   [  31:0] xbar$005$xbar_req$003_msg;
  wire   [   0:0] xbar$005$xbar_req$003_val;
  wire   [  31:0] xbar$005$xbar_req$004_msg;
  wire   [   0:0] xbar$005$xbar_req$004_val;
  wire   [  31:0] xbar$005$xbar_req$005_msg;
  wire   [   0:0] xbar$005$xbar_req$005_val;
  wire   [  31:0] xbar$005$xbar_req$006_msg;
  wire   [   0:0] xbar$005$xbar_req$006_val;
  wire   [  31:0] xbar$005$xbar_req$007_msg;
  wire   [   0:0] xbar$005$xbar_req$007_val;
  wire   [   0:0] xbar$005$xbar_resp$000_rdy;
  wire   [   0:0] xbar$005$xbar_resp$001_rdy;
  wire   [   0:0] xbar$005$xbar_resp$002_rdy;
  wire   [   0:0] xbar$005$xbar_resp$003_rdy;
  wire   [   0:0] xbar$005$xbar_resp$004_rdy;
  wire   [   0:0] xbar$005$xbar_resp$005_rdy;
  wire   [   0:0] xbar$005$xbar_resp$006_rdy;
  wire   [   0:0] xbar$005$xbar_resp$007_rdy;
  wire   [   0:0] xbar$005$bank_req$000_rdy;
  wire   [   0:0] xbar$005$bank_req$001_rdy;
  wire   [   0:0] xbar$005$bank_req$002_rdy;
  wire   [   0:0] xbar$005$bank_req$003_rdy;
  wire   [   0:0] xbar$005$bank_req$004_rdy;
  wire   [   0:0] xbar$005$bank_req$005_rdy;
  wire   [   0:0] xbar$005$bank_req$006_rdy;
  wire   [   0:0] xbar$005$bank_req$007_rdy;
  wire   [  63:0] xbar$005$bank_resp$000_msg;
  wire   [   0:0] xbar$005$bank_resp$000_val;
  wire   [  63:0] xbar$005$bank_resp$001_msg;
  wire   [   0:0] xbar$005$bank_resp$001_val;
  wire   [  63:0] xbar$005$bank_resp$002_msg;
  wire   [   0:0] xbar$005$bank_resp$002_val;
  wire   [  63:0] xbar$005$bank_resp$003_msg;
  wire   [   0:0] xbar$005$bank_resp$003_val;
  wire   [  63:0] xbar$005$bank_resp$004_msg;
  wire   [   0:0] xbar$005$bank_resp$004_val;
  wire   [  63:0] xbar$005$bank_resp$005_msg;
  wire   [   0:0] xbar$005$bank_resp$005_val;
  wire   [  63:0] xbar$005$bank_resp$006_msg;
  wire   [   0:0] xbar$005$bank_resp$006_val;
  wire   [  63:0] xbar$005$bank_resp$007_msg;
  wire   [   0:0] xbar$005$bank_resp$007_val;
  wire   [   0:0] xbar$005$xbar_req$000_rdy;
  wire   [   0:0] xbar$005$xbar_req$001_rdy;
  wire   [   0:0] xbar$005$xbar_req$002_rdy;
  wire   [   0:0] xbar$005$xbar_req$003_rdy;
  wire   [   0:0] xbar$005$xbar_req$004_rdy;
  wire   [   0:0] xbar$005$xbar_req$005_rdy;
  wire   [   0:0] xbar$005$xbar_req$006_rdy;
  wire   [   0:0] xbar$005$xbar_req$007_rdy;
  wire   [  63:0] xbar$005$xbar_resp$000_msg;
  wire   [   0:0] xbar$005$xbar_resp$000_val;
  wire   [  63:0] xbar$005$xbar_resp$001_msg;
  wire   [   0:0] xbar$005$xbar_resp$001_val;
  wire   [  63:0] xbar$005$xbar_resp$002_msg;
  wire   [   0:0] xbar$005$xbar_resp$002_val;
  wire   [  63:0] xbar$005$xbar_resp$003_msg;
  wire   [   0:0] xbar$005$xbar_resp$003_val;
  wire   [  63:0] xbar$005$xbar_resp$004_msg;
  wire   [   0:0] xbar$005$xbar_resp$004_val;
  wire   [  63:0] xbar$005$xbar_resp$005_msg;
  wire   [   0:0] xbar$005$xbar_resp$005_val;
  wire   [  63:0] xbar$005$xbar_resp$006_msg;
  wire   [   0:0] xbar$005$xbar_resp$006_val;
  wire   [  63:0] xbar$005$xbar_resp$007_msg;
  wire   [   0:0] xbar$005$xbar_resp$007_val;
  wire   [  31:0] xbar$005$bank_req$000_msg;
  wire   [   0:0] xbar$005$bank_req$000_val;
  wire   [  31:0] xbar$005$bank_req$001_msg;
  wire   [   0:0] xbar$005$bank_req$001_val;
  wire   [  31:0] xbar$005$bank_req$002_msg;
  wire   [   0:0] xbar$005$bank_req$002_val;
  wire   [  31:0] xbar$005$bank_req$003_msg;
  wire   [   0:0] xbar$005$bank_req$003_val;
  wire   [  31:0] xbar$005$bank_req$004_msg;
  wire   [   0:0] xbar$005$bank_req$004_val;
  wire   [  31:0] xbar$005$bank_req$005_msg;
  wire   [   0:0] xbar$005$bank_req$005_val;
  wire   [  31:0] xbar$005$bank_req$006_msg;
  wire   [   0:0] xbar$005$bank_req$006_val;
  wire   [  31:0] xbar$005$bank_req$007_msg;
  wire   [   0:0] xbar$005$bank_req$007_val;
  wire   [   0:0] xbar$005$bank_resp$000_rdy;
  wire   [   0:0] xbar$005$bank_resp$001_rdy;
  wire   [   0:0] xbar$005$bank_resp$002_rdy;
  wire   [   0:0] xbar$005$bank_resp$003_rdy;
  wire   [   0:0] xbar$005$bank_resp$004_rdy;
  wire   [   0:0] xbar$005$bank_resp$005_rdy;
  wire   [   0:0] xbar$005$bank_resp$006_rdy;
  wire   [   0:0] xbar$005$bank_resp$007_rdy;

  crossbar_0x48d3814e38ed84e5 xbar$005
  (
    .clk               ( xbar$005$clk ),
    .reset             ( xbar$005$reset ),
    .xbar_req$000_msg  ( xbar$005$xbar_req$000_msg ),
    .xbar_req$000_val  ( xbar$005$xbar_req$000_val ),
    .xbar_req$001_msg  ( xbar$005$xbar_req$001_msg ),
    .xbar_req$001_val  ( xbar$005$xbar_req$001_val ),
    .xbar_req$002_msg  ( xbar$005$xbar_req$002_msg ),
    .xbar_req$002_val  ( xbar$005$xbar_req$002_val ),
    .xbar_req$003_msg  ( xbar$005$xbar_req$003_msg ),
    .xbar_req$003_val  ( xbar$005$xbar_req$003_val ),
    .xbar_req$004_msg  ( xbar$005$xbar_req$004_msg ),
    .xbar_req$004_val  ( xbar$005$xbar_req$004_val ),
    .xbar_req$005_msg  ( xbar$005$xbar_req$005_msg ),
    .xbar_req$005_val  ( xbar$005$xbar_req$005_val ),
    .xbar_req$006_msg  ( xbar$005$xbar_req$006_msg ),
    .xbar_req$006_val  ( xbar$005$xbar_req$006_val ),
    .xbar_req$007_msg  ( xbar$005$xbar_req$007_msg ),
    .xbar_req$007_val  ( xbar$005$xbar_req$007_val ),
    .xbar_resp$000_rdy ( xbar$005$xbar_resp$000_rdy ),
    .xbar_resp$001_rdy ( xbar$005$xbar_resp$001_rdy ),
    .xbar_resp$002_rdy ( xbar$005$xbar_resp$002_rdy ),
    .xbar_resp$003_rdy ( xbar$005$xbar_resp$003_rdy ),
    .xbar_resp$004_rdy ( xbar$005$xbar_resp$004_rdy ),
    .xbar_resp$005_rdy ( xbar$005$xbar_resp$005_rdy ),
    .xbar_resp$006_rdy ( xbar$005$xbar_resp$006_rdy ),
    .xbar_resp$007_rdy ( xbar$005$xbar_resp$007_rdy ),
    .bank_req$000_rdy  ( xbar$005$bank_req$000_rdy ),
    .bank_req$001_rdy  ( xbar$005$bank_req$001_rdy ),
    .bank_req$002_rdy  ( xbar$005$bank_req$002_rdy ),
    .bank_req$003_rdy  ( xbar$005$bank_req$003_rdy ),
    .bank_req$004_rdy  ( xbar$005$bank_req$004_rdy ),
    .bank_req$005_rdy  ( xbar$005$bank_req$005_rdy ),
    .bank_req$006_rdy  ( xbar$005$bank_req$006_rdy ),
    .bank_req$007_rdy  ( xbar$005$bank_req$007_rdy ),
    .bank_resp$000_msg ( xbar$005$bank_resp$000_msg ),
    .bank_resp$000_val ( xbar$005$bank_resp$000_val ),
    .bank_resp$001_msg ( xbar$005$bank_resp$001_msg ),
    .bank_resp$001_val ( xbar$005$bank_resp$001_val ),
    .bank_resp$002_msg ( xbar$005$bank_resp$002_msg ),
    .bank_resp$002_val ( xbar$005$bank_resp$002_val ),
    .bank_resp$003_msg ( xbar$005$bank_resp$003_msg ),
    .bank_resp$003_val ( xbar$005$bank_resp$003_val ),
    .bank_resp$004_msg ( xbar$005$bank_resp$004_msg ),
    .bank_resp$004_val ( xbar$005$bank_resp$004_val ),
    .bank_resp$005_msg ( xbar$005$bank_resp$005_msg ),
    .bank_resp$005_val ( xbar$005$bank_resp$005_val ),
    .bank_resp$006_msg ( xbar$005$bank_resp$006_msg ),
    .bank_resp$006_val ( xbar$005$bank_resp$006_val ),
    .bank_resp$007_msg ( xbar$005$bank_resp$007_msg ),
    .bank_resp$007_val ( xbar$005$bank_resp$007_val ),
    .xbar_req$000_rdy  ( xbar$005$xbar_req$000_rdy ),
    .xbar_req$001_rdy  ( xbar$005$xbar_req$001_rdy ),
    .xbar_req$002_rdy  ( xbar$005$xbar_req$002_rdy ),
    .xbar_req$003_rdy  ( xbar$005$xbar_req$003_rdy ),
    .xbar_req$004_rdy  ( xbar$005$xbar_req$004_rdy ),
    .xbar_req$005_rdy  ( xbar$005$xbar_req$005_rdy ),
    .xbar_req$006_rdy  ( xbar$005$xbar_req$006_rdy ),
    .xbar_req$007_rdy  ( xbar$005$xbar_req$007_rdy ),
    .xbar_resp$000_msg ( xbar$005$xbar_resp$000_msg ),
    .xbar_resp$000_val ( xbar$005$xbar_resp$000_val ),
    .xbar_resp$001_msg ( xbar$005$xbar_resp$001_msg ),
    .xbar_resp$001_val ( xbar$005$xbar_resp$001_val ),
    .xbar_resp$002_msg ( xbar$005$xbar_resp$002_msg ),
    .xbar_resp$002_val ( xbar$005$xbar_resp$002_val ),
    .xbar_resp$003_msg ( xbar$005$xbar_resp$003_msg ),
    .xbar_resp$003_val ( xbar$005$xbar_resp$003_val ),
    .xbar_resp$004_msg ( xbar$005$xbar_resp$004_msg ),
    .xbar_resp$004_val ( xbar$005$xbar_resp$004_val ),
    .xbar_resp$005_msg ( xbar$005$xbar_resp$005_msg ),
    .xbar_resp$005_val ( xbar$005$xbar_resp$005_val ),
    .xbar_resp$006_msg ( xbar$005$xbar_resp$006_msg ),
    .xbar_resp$006_val ( xbar$005$xbar_resp$006_val ),
    .xbar_resp$007_msg ( xbar$005$xbar_resp$007_msg ),
    .xbar_resp$007_val ( xbar$005$xbar_resp$007_val ),
    .bank_req$000_msg  ( xbar$005$bank_req$000_msg ),
    .bank_req$000_val  ( xbar$005$bank_req$000_val ),
    .bank_req$001_msg  ( xbar$005$bank_req$001_msg ),
    .bank_req$001_val  ( xbar$005$bank_req$001_val ),
    .bank_req$002_msg  ( xbar$005$bank_req$002_msg ),
    .bank_req$002_val  ( xbar$005$bank_req$002_val ),
    .bank_req$003_msg  ( xbar$005$bank_req$003_msg ),
    .bank_req$003_val  ( xbar$005$bank_req$003_val ),
    .bank_req$004_msg  ( xbar$005$bank_req$004_msg ),
    .bank_req$004_val  ( xbar$005$bank_req$004_val ),
    .bank_req$005_msg  ( xbar$005$bank_req$005_msg ),
    .bank_req$005_val  ( xbar$005$bank_req$005_val ),
    .bank_req$006_msg  ( xbar$005$bank_req$006_msg ),
    .bank_req$006_val  ( xbar$005$bank_req$006_val ),
    .bank_req$007_msg  ( xbar$005$bank_req$007_msg ),
    .bank_req$007_val  ( xbar$005$bank_req$007_val ),
    .bank_resp$000_rdy ( xbar$005$bank_resp$000_rdy ),
    .bank_resp$001_rdy ( xbar$005$bank_resp$001_rdy ),
    .bank_resp$002_rdy ( xbar$005$bank_resp$002_rdy ),
    .bank_resp$003_rdy ( xbar$005$bank_resp$003_rdy ),
    .bank_resp$004_rdy ( xbar$005$bank_resp$004_rdy ),
    .bank_resp$005_rdy ( xbar$005$bank_resp$005_rdy ),
    .bank_resp$006_rdy ( xbar$005$bank_resp$006_rdy ),
    .bank_resp$007_rdy ( xbar$005$bank_resp$007_rdy )
  );

  // xbar$006 temporaries
  wire   [   0:0] xbar$006$clk;
  wire   [   0:0] xbar$006$reset;
  wire   [  31:0] xbar$006$xbar_req$000_msg;
  wire   [   0:0] xbar$006$xbar_req$000_val;
  wire   [  31:0] xbar$006$xbar_req$001_msg;
  wire   [   0:0] xbar$006$xbar_req$001_val;
  wire   [  31:0] xbar$006$xbar_req$002_msg;
  wire   [   0:0] xbar$006$xbar_req$002_val;
  wire   [  31:0] xbar$006$xbar_req$003_msg;
  wire   [   0:0] xbar$006$xbar_req$003_val;
  wire   [  31:0] xbar$006$xbar_req$004_msg;
  wire   [   0:0] xbar$006$xbar_req$004_val;
  wire   [  31:0] xbar$006$xbar_req$005_msg;
  wire   [   0:0] xbar$006$xbar_req$005_val;
  wire   [  31:0] xbar$006$xbar_req$006_msg;
  wire   [   0:0] xbar$006$xbar_req$006_val;
  wire   [  31:0] xbar$006$xbar_req$007_msg;
  wire   [   0:0] xbar$006$xbar_req$007_val;
  wire   [   0:0] xbar$006$xbar_resp$000_rdy;
  wire   [   0:0] xbar$006$xbar_resp$001_rdy;
  wire   [   0:0] xbar$006$xbar_resp$002_rdy;
  wire   [   0:0] xbar$006$xbar_resp$003_rdy;
  wire   [   0:0] xbar$006$xbar_resp$004_rdy;
  wire   [   0:0] xbar$006$xbar_resp$005_rdy;
  wire   [   0:0] xbar$006$xbar_resp$006_rdy;
  wire   [   0:0] xbar$006$xbar_resp$007_rdy;
  wire   [   0:0] xbar$006$bank_req$000_rdy;
  wire   [   0:0] xbar$006$bank_req$001_rdy;
  wire   [   0:0] xbar$006$bank_req$002_rdy;
  wire   [   0:0] xbar$006$bank_req$003_rdy;
  wire   [   0:0] xbar$006$bank_req$004_rdy;
  wire   [   0:0] xbar$006$bank_req$005_rdy;
  wire   [   0:0] xbar$006$bank_req$006_rdy;
  wire   [   0:0] xbar$006$bank_req$007_rdy;
  wire   [  63:0] xbar$006$bank_resp$000_msg;
  wire   [   0:0] xbar$006$bank_resp$000_val;
  wire   [  63:0] xbar$006$bank_resp$001_msg;
  wire   [   0:0] xbar$006$bank_resp$001_val;
  wire   [  63:0] xbar$006$bank_resp$002_msg;
  wire   [   0:0] xbar$006$bank_resp$002_val;
  wire   [  63:0] xbar$006$bank_resp$003_msg;
  wire   [   0:0] xbar$006$bank_resp$003_val;
  wire   [  63:0] xbar$006$bank_resp$004_msg;
  wire   [   0:0] xbar$006$bank_resp$004_val;
  wire   [  63:0] xbar$006$bank_resp$005_msg;
  wire   [   0:0] xbar$006$bank_resp$005_val;
  wire   [  63:0] xbar$006$bank_resp$006_msg;
  wire   [   0:0] xbar$006$bank_resp$006_val;
  wire   [  63:0] xbar$006$bank_resp$007_msg;
  wire   [   0:0] xbar$006$bank_resp$007_val;
  wire   [   0:0] xbar$006$xbar_req$000_rdy;
  wire   [   0:0] xbar$006$xbar_req$001_rdy;
  wire   [   0:0] xbar$006$xbar_req$002_rdy;
  wire   [   0:0] xbar$006$xbar_req$003_rdy;
  wire   [   0:0] xbar$006$xbar_req$004_rdy;
  wire   [   0:0] xbar$006$xbar_req$005_rdy;
  wire   [   0:0] xbar$006$xbar_req$006_rdy;
  wire   [   0:0] xbar$006$xbar_req$007_rdy;
  wire   [  63:0] xbar$006$xbar_resp$000_msg;
  wire   [   0:0] xbar$006$xbar_resp$000_val;
  wire   [  63:0] xbar$006$xbar_resp$001_msg;
  wire   [   0:0] xbar$006$xbar_resp$001_val;
  wire   [  63:0] xbar$006$xbar_resp$002_msg;
  wire   [   0:0] xbar$006$xbar_resp$002_val;
  wire   [  63:0] xbar$006$xbar_resp$003_msg;
  wire   [   0:0] xbar$006$xbar_resp$003_val;
  wire   [  63:0] xbar$006$xbar_resp$004_msg;
  wire   [   0:0] xbar$006$xbar_resp$004_val;
  wire   [  63:0] xbar$006$xbar_resp$005_msg;
  wire   [   0:0] xbar$006$xbar_resp$005_val;
  wire   [  63:0] xbar$006$xbar_resp$006_msg;
  wire   [   0:0] xbar$006$xbar_resp$006_val;
  wire   [  63:0] xbar$006$xbar_resp$007_msg;
  wire   [   0:0] xbar$006$xbar_resp$007_val;
  wire   [  31:0] xbar$006$bank_req$000_msg;
  wire   [   0:0] xbar$006$bank_req$000_val;
  wire   [  31:0] xbar$006$bank_req$001_msg;
  wire   [   0:0] xbar$006$bank_req$001_val;
  wire   [  31:0] xbar$006$bank_req$002_msg;
  wire   [   0:0] xbar$006$bank_req$002_val;
  wire   [  31:0] xbar$006$bank_req$003_msg;
  wire   [   0:0] xbar$006$bank_req$003_val;
  wire   [  31:0] xbar$006$bank_req$004_msg;
  wire   [   0:0] xbar$006$bank_req$004_val;
  wire   [  31:0] xbar$006$bank_req$005_msg;
  wire   [   0:0] xbar$006$bank_req$005_val;
  wire   [  31:0] xbar$006$bank_req$006_msg;
  wire   [   0:0] xbar$006$bank_req$006_val;
  wire   [  31:0] xbar$006$bank_req$007_msg;
  wire   [   0:0] xbar$006$bank_req$007_val;
  wire   [   0:0] xbar$006$bank_resp$000_rdy;
  wire   [   0:0] xbar$006$bank_resp$001_rdy;
  wire   [   0:0] xbar$006$bank_resp$002_rdy;
  wire   [   0:0] xbar$006$bank_resp$003_rdy;
  wire   [   0:0] xbar$006$bank_resp$004_rdy;
  wire   [   0:0] xbar$006$bank_resp$005_rdy;
  wire   [   0:0] xbar$006$bank_resp$006_rdy;
  wire   [   0:0] xbar$006$bank_resp$007_rdy;

  crossbar_0x48d3814e38ed84e5 xbar$006
  (
    .clk               ( xbar$006$clk ),
    .reset             ( xbar$006$reset ),
    .xbar_req$000_msg  ( xbar$006$xbar_req$000_msg ),
    .xbar_req$000_val  ( xbar$006$xbar_req$000_val ),
    .xbar_req$001_msg  ( xbar$006$xbar_req$001_msg ),
    .xbar_req$001_val  ( xbar$006$xbar_req$001_val ),
    .xbar_req$002_msg  ( xbar$006$xbar_req$002_msg ),
    .xbar_req$002_val  ( xbar$006$xbar_req$002_val ),
    .xbar_req$003_msg  ( xbar$006$xbar_req$003_msg ),
    .xbar_req$003_val  ( xbar$006$xbar_req$003_val ),
    .xbar_req$004_msg  ( xbar$006$xbar_req$004_msg ),
    .xbar_req$004_val  ( xbar$006$xbar_req$004_val ),
    .xbar_req$005_msg  ( xbar$006$xbar_req$005_msg ),
    .xbar_req$005_val  ( xbar$006$xbar_req$005_val ),
    .xbar_req$006_msg  ( xbar$006$xbar_req$006_msg ),
    .xbar_req$006_val  ( xbar$006$xbar_req$006_val ),
    .xbar_req$007_msg  ( xbar$006$xbar_req$007_msg ),
    .xbar_req$007_val  ( xbar$006$xbar_req$007_val ),
    .xbar_resp$000_rdy ( xbar$006$xbar_resp$000_rdy ),
    .xbar_resp$001_rdy ( xbar$006$xbar_resp$001_rdy ),
    .xbar_resp$002_rdy ( xbar$006$xbar_resp$002_rdy ),
    .xbar_resp$003_rdy ( xbar$006$xbar_resp$003_rdy ),
    .xbar_resp$004_rdy ( xbar$006$xbar_resp$004_rdy ),
    .xbar_resp$005_rdy ( xbar$006$xbar_resp$005_rdy ),
    .xbar_resp$006_rdy ( xbar$006$xbar_resp$006_rdy ),
    .xbar_resp$007_rdy ( xbar$006$xbar_resp$007_rdy ),
    .bank_req$000_rdy  ( xbar$006$bank_req$000_rdy ),
    .bank_req$001_rdy  ( xbar$006$bank_req$001_rdy ),
    .bank_req$002_rdy  ( xbar$006$bank_req$002_rdy ),
    .bank_req$003_rdy  ( xbar$006$bank_req$003_rdy ),
    .bank_req$004_rdy  ( xbar$006$bank_req$004_rdy ),
    .bank_req$005_rdy  ( xbar$006$bank_req$005_rdy ),
    .bank_req$006_rdy  ( xbar$006$bank_req$006_rdy ),
    .bank_req$007_rdy  ( xbar$006$bank_req$007_rdy ),
    .bank_resp$000_msg ( xbar$006$bank_resp$000_msg ),
    .bank_resp$000_val ( xbar$006$bank_resp$000_val ),
    .bank_resp$001_msg ( xbar$006$bank_resp$001_msg ),
    .bank_resp$001_val ( xbar$006$bank_resp$001_val ),
    .bank_resp$002_msg ( xbar$006$bank_resp$002_msg ),
    .bank_resp$002_val ( xbar$006$bank_resp$002_val ),
    .bank_resp$003_msg ( xbar$006$bank_resp$003_msg ),
    .bank_resp$003_val ( xbar$006$bank_resp$003_val ),
    .bank_resp$004_msg ( xbar$006$bank_resp$004_msg ),
    .bank_resp$004_val ( xbar$006$bank_resp$004_val ),
    .bank_resp$005_msg ( xbar$006$bank_resp$005_msg ),
    .bank_resp$005_val ( xbar$006$bank_resp$005_val ),
    .bank_resp$006_msg ( xbar$006$bank_resp$006_msg ),
    .bank_resp$006_val ( xbar$006$bank_resp$006_val ),
    .bank_resp$007_msg ( xbar$006$bank_resp$007_msg ),
    .bank_resp$007_val ( xbar$006$bank_resp$007_val ),
    .xbar_req$000_rdy  ( xbar$006$xbar_req$000_rdy ),
    .xbar_req$001_rdy  ( xbar$006$xbar_req$001_rdy ),
    .xbar_req$002_rdy  ( xbar$006$xbar_req$002_rdy ),
    .xbar_req$003_rdy  ( xbar$006$xbar_req$003_rdy ),
    .xbar_req$004_rdy  ( xbar$006$xbar_req$004_rdy ),
    .xbar_req$005_rdy  ( xbar$006$xbar_req$005_rdy ),
    .xbar_req$006_rdy  ( xbar$006$xbar_req$006_rdy ),
    .xbar_req$007_rdy  ( xbar$006$xbar_req$007_rdy ),
    .xbar_resp$000_msg ( xbar$006$xbar_resp$000_msg ),
    .xbar_resp$000_val ( xbar$006$xbar_resp$000_val ),
    .xbar_resp$001_msg ( xbar$006$xbar_resp$001_msg ),
    .xbar_resp$001_val ( xbar$006$xbar_resp$001_val ),
    .xbar_resp$002_msg ( xbar$006$xbar_resp$002_msg ),
    .xbar_resp$002_val ( xbar$006$xbar_resp$002_val ),
    .xbar_resp$003_msg ( xbar$006$xbar_resp$003_msg ),
    .xbar_resp$003_val ( xbar$006$xbar_resp$003_val ),
    .xbar_resp$004_msg ( xbar$006$xbar_resp$004_msg ),
    .xbar_resp$004_val ( xbar$006$xbar_resp$004_val ),
    .xbar_resp$005_msg ( xbar$006$xbar_resp$005_msg ),
    .xbar_resp$005_val ( xbar$006$xbar_resp$005_val ),
    .xbar_resp$006_msg ( xbar$006$xbar_resp$006_msg ),
    .xbar_resp$006_val ( xbar$006$xbar_resp$006_val ),
    .xbar_resp$007_msg ( xbar$006$xbar_resp$007_msg ),
    .xbar_resp$007_val ( xbar$006$xbar_resp$007_val ),
    .bank_req$000_msg  ( xbar$006$bank_req$000_msg ),
    .bank_req$000_val  ( xbar$006$bank_req$000_val ),
    .bank_req$001_msg  ( xbar$006$bank_req$001_msg ),
    .bank_req$001_val  ( xbar$006$bank_req$001_val ),
    .bank_req$002_msg  ( xbar$006$bank_req$002_msg ),
    .bank_req$002_val  ( xbar$006$bank_req$002_val ),
    .bank_req$003_msg  ( xbar$006$bank_req$003_msg ),
    .bank_req$003_val  ( xbar$006$bank_req$003_val ),
    .bank_req$004_msg  ( xbar$006$bank_req$004_msg ),
    .bank_req$004_val  ( xbar$006$bank_req$004_val ),
    .bank_req$005_msg  ( xbar$006$bank_req$005_msg ),
    .bank_req$005_val  ( xbar$006$bank_req$005_val ),
    .bank_req$006_msg  ( xbar$006$bank_req$006_msg ),
    .bank_req$006_val  ( xbar$006$bank_req$006_val ),
    .bank_req$007_msg  ( xbar$006$bank_req$007_msg ),
    .bank_req$007_val  ( xbar$006$bank_req$007_val ),
    .bank_resp$000_rdy ( xbar$006$bank_resp$000_rdy ),
    .bank_resp$001_rdy ( xbar$006$bank_resp$001_rdy ),
    .bank_resp$002_rdy ( xbar$006$bank_resp$002_rdy ),
    .bank_resp$003_rdy ( xbar$006$bank_resp$003_rdy ),
    .bank_resp$004_rdy ( xbar$006$bank_resp$004_rdy ),
    .bank_resp$005_rdy ( xbar$006$bank_resp$005_rdy ),
    .bank_resp$006_rdy ( xbar$006$bank_resp$006_rdy ),
    .bank_resp$007_rdy ( xbar$006$bank_resp$007_rdy )
  );

  // xbar$007 temporaries
  wire   [   0:0] xbar$007$clk;
  wire   [   0:0] xbar$007$reset;
  wire   [  31:0] xbar$007$xbar_req$000_msg;
  wire   [   0:0] xbar$007$xbar_req$000_val;
  wire   [  31:0] xbar$007$xbar_req$001_msg;
  wire   [   0:0] xbar$007$xbar_req$001_val;
  wire   [  31:0] xbar$007$xbar_req$002_msg;
  wire   [   0:0] xbar$007$xbar_req$002_val;
  wire   [  31:0] xbar$007$xbar_req$003_msg;
  wire   [   0:0] xbar$007$xbar_req$003_val;
  wire   [  31:0] xbar$007$xbar_req$004_msg;
  wire   [   0:0] xbar$007$xbar_req$004_val;
  wire   [  31:0] xbar$007$xbar_req$005_msg;
  wire   [   0:0] xbar$007$xbar_req$005_val;
  wire   [  31:0] xbar$007$xbar_req$006_msg;
  wire   [   0:0] xbar$007$xbar_req$006_val;
  wire   [  31:0] xbar$007$xbar_req$007_msg;
  wire   [   0:0] xbar$007$xbar_req$007_val;
  wire   [   0:0] xbar$007$xbar_resp$000_rdy;
  wire   [   0:0] xbar$007$xbar_resp$001_rdy;
  wire   [   0:0] xbar$007$xbar_resp$002_rdy;
  wire   [   0:0] xbar$007$xbar_resp$003_rdy;
  wire   [   0:0] xbar$007$xbar_resp$004_rdy;
  wire   [   0:0] xbar$007$xbar_resp$005_rdy;
  wire   [   0:0] xbar$007$xbar_resp$006_rdy;
  wire   [   0:0] xbar$007$xbar_resp$007_rdy;
  wire   [   0:0] xbar$007$bank_req$000_rdy;
  wire   [   0:0] xbar$007$bank_req$001_rdy;
  wire   [   0:0] xbar$007$bank_req$002_rdy;
  wire   [   0:0] xbar$007$bank_req$003_rdy;
  wire   [   0:0] xbar$007$bank_req$004_rdy;
  wire   [   0:0] xbar$007$bank_req$005_rdy;
  wire   [   0:0] xbar$007$bank_req$006_rdy;
  wire   [   0:0] xbar$007$bank_req$007_rdy;
  wire   [  63:0] xbar$007$bank_resp$000_msg;
  wire   [   0:0] xbar$007$bank_resp$000_val;
  wire   [  63:0] xbar$007$bank_resp$001_msg;
  wire   [   0:0] xbar$007$bank_resp$001_val;
  wire   [  63:0] xbar$007$bank_resp$002_msg;
  wire   [   0:0] xbar$007$bank_resp$002_val;
  wire   [  63:0] xbar$007$bank_resp$003_msg;
  wire   [   0:0] xbar$007$bank_resp$003_val;
  wire   [  63:0] xbar$007$bank_resp$004_msg;
  wire   [   0:0] xbar$007$bank_resp$004_val;
  wire   [  63:0] xbar$007$bank_resp$005_msg;
  wire   [   0:0] xbar$007$bank_resp$005_val;
  wire   [  63:0] xbar$007$bank_resp$006_msg;
  wire   [   0:0] xbar$007$bank_resp$006_val;
  wire   [  63:0] xbar$007$bank_resp$007_msg;
  wire   [   0:0] xbar$007$bank_resp$007_val;
  wire   [   0:0] xbar$007$xbar_req$000_rdy;
  wire   [   0:0] xbar$007$xbar_req$001_rdy;
  wire   [   0:0] xbar$007$xbar_req$002_rdy;
  wire   [   0:0] xbar$007$xbar_req$003_rdy;
  wire   [   0:0] xbar$007$xbar_req$004_rdy;
  wire   [   0:0] xbar$007$xbar_req$005_rdy;
  wire   [   0:0] xbar$007$xbar_req$006_rdy;
  wire   [   0:0] xbar$007$xbar_req$007_rdy;
  wire   [  63:0] xbar$007$xbar_resp$000_msg;
  wire   [   0:0] xbar$007$xbar_resp$000_val;
  wire   [  63:0] xbar$007$xbar_resp$001_msg;
  wire   [   0:0] xbar$007$xbar_resp$001_val;
  wire   [  63:0] xbar$007$xbar_resp$002_msg;
  wire   [   0:0] xbar$007$xbar_resp$002_val;
  wire   [  63:0] xbar$007$xbar_resp$003_msg;
  wire   [   0:0] xbar$007$xbar_resp$003_val;
  wire   [  63:0] xbar$007$xbar_resp$004_msg;
  wire   [   0:0] xbar$007$xbar_resp$004_val;
  wire   [  63:0] xbar$007$xbar_resp$005_msg;
  wire   [   0:0] xbar$007$xbar_resp$005_val;
  wire   [  63:0] xbar$007$xbar_resp$006_msg;
  wire   [   0:0] xbar$007$xbar_resp$006_val;
  wire   [  63:0] xbar$007$xbar_resp$007_msg;
  wire   [   0:0] xbar$007$xbar_resp$007_val;
  wire   [  31:0] xbar$007$bank_req$000_msg;
  wire   [   0:0] xbar$007$bank_req$000_val;
  wire   [  31:0] xbar$007$bank_req$001_msg;
  wire   [   0:0] xbar$007$bank_req$001_val;
  wire   [  31:0] xbar$007$bank_req$002_msg;
  wire   [   0:0] xbar$007$bank_req$002_val;
  wire   [  31:0] xbar$007$bank_req$003_msg;
  wire   [   0:0] xbar$007$bank_req$003_val;
  wire   [  31:0] xbar$007$bank_req$004_msg;
  wire   [   0:0] xbar$007$bank_req$004_val;
  wire   [  31:0] xbar$007$bank_req$005_msg;
  wire   [   0:0] xbar$007$bank_req$005_val;
  wire   [  31:0] xbar$007$bank_req$006_msg;
  wire   [   0:0] xbar$007$bank_req$006_val;
  wire   [  31:0] xbar$007$bank_req$007_msg;
  wire   [   0:0] xbar$007$bank_req$007_val;
  wire   [   0:0] xbar$007$bank_resp$000_rdy;
  wire   [   0:0] xbar$007$bank_resp$001_rdy;
  wire   [   0:0] xbar$007$bank_resp$002_rdy;
  wire   [   0:0] xbar$007$bank_resp$003_rdy;
  wire   [   0:0] xbar$007$bank_resp$004_rdy;
  wire   [   0:0] xbar$007$bank_resp$005_rdy;
  wire   [   0:0] xbar$007$bank_resp$006_rdy;
  wire   [   0:0] xbar$007$bank_resp$007_rdy;

  crossbar_0x48d3814e38ed84e5 xbar$007
  (
    .clk               ( xbar$007$clk ),
    .reset             ( xbar$007$reset ),
    .xbar_req$000_msg  ( xbar$007$xbar_req$000_msg ),
    .xbar_req$000_val  ( xbar$007$xbar_req$000_val ),
    .xbar_req$001_msg  ( xbar$007$xbar_req$001_msg ),
    .xbar_req$001_val  ( xbar$007$xbar_req$001_val ),
    .xbar_req$002_msg  ( xbar$007$xbar_req$002_msg ),
    .xbar_req$002_val  ( xbar$007$xbar_req$002_val ),
    .xbar_req$003_msg  ( xbar$007$xbar_req$003_msg ),
    .xbar_req$003_val  ( xbar$007$xbar_req$003_val ),
    .xbar_req$004_msg  ( xbar$007$xbar_req$004_msg ),
    .xbar_req$004_val  ( xbar$007$xbar_req$004_val ),
    .xbar_req$005_msg  ( xbar$007$xbar_req$005_msg ),
    .xbar_req$005_val  ( xbar$007$xbar_req$005_val ),
    .xbar_req$006_msg  ( xbar$007$xbar_req$006_msg ),
    .xbar_req$006_val  ( xbar$007$xbar_req$006_val ),
    .xbar_req$007_msg  ( xbar$007$xbar_req$007_msg ),
    .xbar_req$007_val  ( xbar$007$xbar_req$007_val ),
    .xbar_resp$000_rdy ( xbar$007$xbar_resp$000_rdy ),
    .xbar_resp$001_rdy ( xbar$007$xbar_resp$001_rdy ),
    .xbar_resp$002_rdy ( xbar$007$xbar_resp$002_rdy ),
    .xbar_resp$003_rdy ( xbar$007$xbar_resp$003_rdy ),
    .xbar_resp$004_rdy ( xbar$007$xbar_resp$004_rdy ),
    .xbar_resp$005_rdy ( xbar$007$xbar_resp$005_rdy ),
    .xbar_resp$006_rdy ( xbar$007$xbar_resp$006_rdy ),
    .xbar_resp$007_rdy ( xbar$007$xbar_resp$007_rdy ),
    .bank_req$000_rdy  ( xbar$007$bank_req$000_rdy ),
    .bank_req$001_rdy  ( xbar$007$bank_req$001_rdy ),
    .bank_req$002_rdy  ( xbar$007$bank_req$002_rdy ),
    .bank_req$003_rdy  ( xbar$007$bank_req$003_rdy ),
    .bank_req$004_rdy  ( xbar$007$bank_req$004_rdy ),
    .bank_req$005_rdy  ( xbar$007$bank_req$005_rdy ),
    .bank_req$006_rdy  ( xbar$007$bank_req$006_rdy ),
    .bank_req$007_rdy  ( xbar$007$bank_req$007_rdy ),
    .bank_resp$000_msg ( xbar$007$bank_resp$000_msg ),
    .bank_resp$000_val ( xbar$007$bank_resp$000_val ),
    .bank_resp$001_msg ( xbar$007$bank_resp$001_msg ),
    .bank_resp$001_val ( xbar$007$bank_resp$001_val ),
    .bank_resp$002_msg ( xbar$007$bank_resp$002_msg ),
    .bank_resp$002_val ( xbar$007$bank_resp$002_val ),
    .bank_resp$003_msg ( xbar$007$bank_resp$003_msg ),
    .bank_resp$003_val ( xbar$007$bank_resp$003_val ),
    .bank_resp$004_msg ( xbar$007$bank_resp$004_msg ),
    .bank_resp$004_val ( xbar$007$bank_resp$004_val ),
    .bank_resp$005_msg ( xbar$007$bank_resp$005_msg ),
    .bank_resp$005_val ( xbar$007$bank_resp$005_val ),
    .bank_resp$006_msg ( xbar$007$bank_resp$006_msg ),
    .bank_resp$006_val ( xbar$007$bank_resp$006_val ),
    .bank_resp$007_msg ( xbar$007$bank_resp$007_msg ),
    .bank_resp$007_val ( xbar$007$bank_resp$007_val ),
    .xbar_req$000_rdy  ( xbar$007$xbar_req$000_rdy ),
    .xbar_req$001_rdy  ( xbar$007$xbar_req$001_rdy ),
    .xbar_req$002_rdy  ( xbar$007$xbar_req$002_rdy ),
    .xbar_req$003_rdy  ( xbar$007$xbar_req$003_rdy ),
    .xbar_req$004_rdy  ( xbar$007$xbar_req$004_rdy ),
    .xbar_req$005_rdy  ( xbar$007$xbar_req$005_rdy ),
    .xbar_req$006_rdy  ( xbar$007$xbar_req$006_rdy ),
    .xbar_req$007_rdy  ( xbar$007$xbar_req$007_rdy ),
    .xbar_resp$000_msg ( xbar$007$xbar_resp$000_msg ),
    .xbar_resp$000_val ( xbar$007$xbar_resp$000_val ),
    .xbar_resp$001_msg ( xbar$007$xbar_resp$001_msg ),
    .xbar_resp$001_val ( xbar$007$xbar_resp$001_val ),
    .xbar_resp$002_msg ( xbar$007$xbar_resp$002_msg ),
    .xbar_resp$002_val ( xbar$007$xbar_resp$002_val ),
    .xbar_resp$003_msg ( xbar$007$xbar_resp$003_msg ),
    .xbar_resp$003_val ( xbar$007$xbar_resp$003_val ),
    .xbar_resp$004_msg ( xbar$007$xbar_resp$004_msg ),
    .xbar_resp$004_val ( xbar$007$xbar_resp$004_val ),
    .xbar_resp$005_msg ( xbar$007$xbar_resp$005_msg ),
    .xbar_resp$005_val ( xbar$007$xbar_resp$005_val ),
    .xbar_resp$006_msg ( xbar$007$xbar_resp$006_msg ),
    .xbar_resp$006_val ( xbar$007$xbar_resp$006_val ),
    .xbar_resp$007_msg ( xbar$007$xbar_resp$007_msg ),
    .xbar_resp$007_val ( xbar$007$xbar_resp$007_val ),
    .bank_req$000_msg  ( xbar$007$bank_req$000_msg ),
    .bank_req$000_val  ( xbar$007$bank_req$000_val ),
    .bank_req$001_msg  ( xbar$007$bank_req$001_msg ),
    .bank_req$001_val  ( xbar$007$bank_req$001_val ),
    .bank_req$002_msg  ( xbar$007$bank_req$002_msg ),
    .bank_req$002_val  ( xbar$007$bank_req$002_val ),
    .bank_req$003_msg  ( xbar$007$bank_req$003_msg ),
    .bank_req$003_val  ( xbar$007$bank_req$003_val ),
    .bank_req$004_msg  ( xbar$007$bank_req$004_msg ),
    .bank_req$004_val  ( xbar$007$bank_req$004_val ),
    .bank_req$005_msg  ( xbar$007$bank_req$005_msg ),
    .bank_req$005_val  ( xbar$007$bank_req$005_val ),
    .bank_req$006_msg  ( xbar$007$bank_req$006_msg ),
    .bank_req$006_val  ( xbar$007$bank_req$006_val ),
    .bank_req$007_msg  ( xbar$007$bank_req$007_msg ),
    .bank_req$007_val  ( xbar$007$bank_req$007_val ),
    .bank_resp$000_rdy ( xbar$007$bank_resp$000_rdy ),
    .bank_resp$001_rdy ( xbar$007$bank_resp$001_rdy ),
    .bank_resp$002_rdy ( xbar$007$bank_resp$002_rdy ),
    .bank_resp$003_rdy ( xbar$007$bank_resp$003_rdy ),
    .bank_resp$004_rdy ( xbar$007$bank_resp$004_rdy ),
    .bank_resp$005_rdy ( xbar$007$bank_resp$005_rdy ),
    .bank_resp$006_rdy ( xbar$007$bank_resp$006_rdy ),
    .bank_resp$007_rdy ( xbar$007$bank_resp$007_rdy )
  );

  // signal connections
  assign a_feeder_in$000_rdy        = pe$000$a_feeder_in_rdy;
  assign a_feeder_in$001_rdy        = pe$001$a_feeder_in_rdy;
  assign a_feeder_in$002_rdy        = pe$002$a_feeder_in_rdy;
  assign a_feeder_in$003_rdy        = pe$003$a_feeder_in_rdy;
  assign a_feeder_in$004_rdy        = pe$004$a_feeder_in_rdy;
  assign a_feeder_in$005_rdy        = pe$005$a_feeder_in_rdy;
  assign a_feeder_in$006_rdy        = pe$006$a_feeder_in_rdy;
  assign a_feeder_in$007_rdy        = pe$007$a_feeder_in_rdy;
  assign a_feeder_out$000_msg       = pe$056$a_feeder_out_msg;
  assign a_feeder_out$000_val       = pe$056$a_feeder_out_val;
  assign a_feeder_out$001_msg       = pe$057$a_feeder_out_msg;
  assign a_feeder_out$001_val       = pe$057$a_feeder_out_val;
  assign a_feeder_out$002_msg       = pe$058$a_feeder_out_msg;
  assign a_feeder_out$002_val       = pe$058$a_feeder_out_val;
  assign a_feeder_out$003_msg       = pe$059$a_feeder_out_msg;
  assign a_feeder_out$003_val       = pe$059$a_feeder_out_val;
  assign a_feeder_out$004_msg       = pe$060$a_feeder_out_msg;
  assign a_feeder_out$004_val       = pe$060$a_feeder_out_val;
  assign a_feeder_out$005_msg       = pe$061$a_feeder_out_msg;
  assign a_feeder_out$005_val       = pe$061$a_feeder_out_val;
  assign a_feeder_out$006_msg       = pe$062$a_feeder_out_msg;
  assign a_feeder_out$006_val       = pe$062$a_feeder_out_val;
  assign a_feeder_out$007_msg       = pe$063$a_feeder_out_msg;
  assign a_feeder_out$007_val       = pe$063$a_feeder_out_val;
  assign blkdone_ack$000_rdy        = pe$000$blkdone_ack_rdy;
  assign blkdone_ack$001_rdy        = pe$001$blkdone_ack_rdy;
  assign blkdone_ack$002_rdy        = pe$002$blkdone_ack_rdy;
  assign blkdone_ack$003_rdy        = pe$003$blkdone_ack_rdy;
  assign blkdone_ack$004_rdy        = pe$004$blkdone_ack_rdy;
  assign blkdone_ack$005_rdy        = pe$005$blkdone_ack_rdy;
  assign blkdone_ack$006_rdy        = pe$006$blkdone_ack_rdy;
  assign blkdone_ack$007_rdy        = pe$007$blkdone_ack_rdy;
  assign blkdone_ack$008_rdy        = pe$008$blkdone_ack_rdy;
  assign blkdone_ack$009_rdy        = pe$009$blkdone_ack_rdy;
  assign blkdone_ack$010_rdy        = pe$010$blkdone_ack_rdy;
  assign blkdone_ack$011_rdy        = pe$011$blkdone_ack_rdy;
  assign blkdone_ack$012_rdy        = pe$012$blkdone_ack_rdy;
  assign blkdone_ack$013_rdy        = pe$013$blkdone_ack_rdy;
  assign blkdone_ack$014_rdy        = pe$014$blkdone_ack_rdy;
  assign blkdone_ack$015_rdy        = pe$015$blkdone_ack_rdy;
  assign blkdone_ack$016_rdy        = pe$016$blkdone_ack_rdy;
  assign blkdone_ack$017_rdy        = pe$017$blkdone_ack_rdy;
  assign blkdone_ack$018_rdy        = pe$018$blkdone_ack_rdy;
  assign blkdone_ack$019_rdy        = pe$019$blkdone_ack_rdy;
  assign blkdone_ack$020_rdy        = pe$020$blkdone_ack_rdy;
  assign blkdone_ack$021_rdy        = pe$021$blkdone_ack_rdy;
  assign blkdone_ack$022_rdy        = pe$022$blkdone_ack_rdy;
  assign blkdone_ack$023_rdy        = pe$023$blkdone_ack_rdy;
  assign blkdone_ack$024_rdy        = pe$024$blkdone_ack_rdy;
  assign blkdone_ack$025_rdy        = pe$025$blkdone_ack_rdy;
  assign blkdone_ack$026_rdy        = pe$026$blkdone_ack_rdy;
  assign blkdone_ack$027_rdy        = pe$027$blkdone_ack_rdy;
  assign blkdone_ack$028_rdy        = pe$028$blkdone_ack_rdy;
  assign blkdone_ack$029_rdy        = pe$029$blkdone_ack_rdy;
  assign blkdone_ack$030_rdy        = pe$030$blkdone_ack_rdy;
  assign blkdone_ack$031_rdy        = pe$031$blkdone_ack_rdy;
  assign blkdone_ack$032_rdy        = pe$032$blkdone_ack_rdy;
  assign blkdone_ack$033_rdy        = pe$033$blkdone_ack_rdy;
  assign blkdone_ack$034_rdy        = pe$034$blkdone_ack_rdy;
  assign blkdone_ack$035_rdy        = pe$035$blkdone_ack_rdy;
  assign blkdone_ack$036_rdy        = pe$036$blkdone_ack_rdy;
  assign blkdone_ack$037_rdy        = pe$037$blkdone_ack_rdy;
  assign blkdone_ack$038_rdy        = pe$038$blkdone_ack_rdy;
  assign blkdone_ack$039_rdy        = pe$039$blkdone_ack_rdy;
  assign blkdone_ack$040_rdy        = pe$040$blkdone_ack_rdy;
  assign blkdone_ack$041_rdy        = pe$041$blkdone_ack_rdy;
  assign blkdone_ack$042_rdy        = pe$042$blkdone_ack_rdy;
  assign blkdone_ack$043_rdy        = pe$043$blkdone_ack_rdy;
  assign blkdone_ack$044_rdy        = pe$044$blkdone_ack_rdy;
  assign blkdone_ack$045_rdy        = pe$045$blkdone_ack_rdy;
  assign blkdone_ack$046_rdy        = pe$046$blkdone_ack_rdy;
  assign blkdone_ack$047_rdy        = pe$047$blkdone_ack_rdy;
  assign blkdone_ack$048_rdy        = pe$048$blkdone_ack_rdy;
  assign blkdone_ack$049_rdy        = pe$049$blkdone_ack_rdy;
  assign blkdone_ack$050_rdy        = pe$050$blkdone_ack_rdy;
  assign blkdone_ack$051_rdy        = pe$051$blkdone_ack_rdy;
  assign blkdone_ack$052_rdy        = pe$052$blkdone_ack_rdy;
  assign blkdone_ack$053_rdy        = pe$053$blkdone_ack_rdy;
  assign blkdone_ack$054_rdy        = pe$054$blkdone_ack_rdy;
  assign blkdone_ack$055_rdy        = pe$055$blkdone_ack_rdy;
  assign blkdone_ack$056_rdy        = pe$056$blkdone_ack_rdy;
  assign blkdone_ack$057_rdy        = pe$057$blkdone_ack_rdy;
  assign blkdone_ack$058_rdy        = pe$058$blkdone_ack_rdy;
  assign blkdone_ack$059_rdy        = pe$059$blkdone_ack_rdy;
  assign blkdone_ack$060_rdy        = pe$060$blkdone_ack_rdy;
  assign blkdone_ack$061_rdy        = pe$061$blkdone_ack_rdy;
  assign blkdone_ack$062_rdy        = pe$062$blkdone_ack_rdy;
  assign blkdone_ack$063_rdy        = pe$063$blkdone_ack_rdy;
  assign blkdone_sig$000_msg        = pe$000$blkdone_sig_msg;
  assign blkdone_sig$000_val        = pe$000$blkdone_sig_val;
  assign blkdone_sig$001_msg        = pe$001$blkdone_sig_msg;
  assign blkdone_sig$001_val        = pe$001$blkdone_sig_val;
  assign blkdone_sig$002_msg        = pe$002$blkdone_sig_msg;
  assign blkdone_sig$002_val        = pe$002$blkdone_sig_val;
  assign blkdone_sig$003_msg        = pe$003$blkdone_sig_msg;
  assign blkdone_sig$003_val        = pe$003$blkdone_sig_val;
  assign blkdone_sig$004_msg        = pe$004$blkdone_sig_msg;
  assign blkdone_sig$004_val        = pe$004$blkdone_sig_val;
  assign blkdone_sig$005_msg        = pe$005$blkdone_sig_msg;
  assign blkdone_sig$005_val        = pe$005$blkdone_sig_val;
  assign blkdone_sig$006_msg        = pe$006$blkdone_sig_msg;
  assign blkdone_sig$006_val        = pe$006$blkdone_sig_val;
  assign blkdone_sig$007_msg        = pe$007$blkdone_sig_msg;
  assign blkdone_sig$007_val        = pe$007$blkdone_sig_val;
  assign blkdone_sig$008_msg        = pe$008$blkdone_sig_msg;
  assign blkdone_sig$008_val        = pe$008$blkdone_sig_val;
  assign blkdone_sig$009_msg        = pe$009$blkdone_sig_msg;
  assign blkdone_sig$009_val        = pe$009$blkdone_sig_val;
  assign blkdone_sig$010_msg        = pe$010$blkdone_sig_msg;
  assign blkdone_sig$010_val        = pe$010$blkdone_sig_val;
  assign blkdone_sig$011_msg        = pe$011$blkdone_sig_msg;
  assign blkdone_sig$011_val        = pe$011$blkdone_sig_val;
  assign blkdone_sig$012_msg        = pe$012$blkdone_sig_msg;
  assign blkdone_sig$012_val        = pe$012$blkdone_sig_val;
  assign blkdone_sig$013_msg        = pe$013$blkdone_sig_msg;
  assign blkdone_sig$013_val        = pe$013$blkdone_sig_val;
  assign blkdone_sig$014_msg        = pe$014$blkdone_sig_msg;
  assign blkdone_sig$014_val        = pe$014$blkdone_sig_val;
  assign blkdone_sig$015_msg        = pe$015$blkdone_sig_msg;
  assign blkdone_sig$015_val        = pe$015$blkdone_sig_val;
  assign blkdone_sig$016_msg        = pe$016$blkdone_sig_msg;
  assign blkdone_sig$016_val        = pe$016$blkdone_sig_val;
  assign blkdone_sig$017_msg        = pe$017$blkdone_sig_msg;
  assign blkdone_sig$017_val        = pe$017$blkdone_sig_val;
  assign blkdone_sig$018_msg        = pe$018$blkdone_sig_msg;
  assign blkdone_sig$018_val        = pe$018$blkdone_sig_val;
  assign blkdone_sig$019_msg        = pe$019$blkdone_sig_msg;
  assign blkdone_sig$019_val        = pe$019$blkdone_sig_val;
  assign blkdone_sig$020_msg        = pe$020$blkdone_sig_msg;
  assign blkdone_sig$020_val        = pe$020$blkdone_sig_val;
  assign blkdone_sig$021_msg        = pe$021$blkdone_sig_msg;
  assign blkdone_sig$021_val        = pe$021$blkdone_sig_val;
  assign blkdone_sig$022_msg        = pe$022$blkdone_sig_msg;
  assign blkdone_sig$022_val        = pe$022$blkdone_sig_val;
  assign blkdone_sig$023_msg        = pe$023$blkdone_sig_msg;
  assign blkdone_sig$023_val        = pe$023$blkdone_sig_val;
  assign blkdone_sig$024_msg        = pe$024$blkdone_sig_msg;
  assign blkdone_sig$024_val        = pe$024$blkdone_sig_val;
  assign blkdone_sig$025_msg        = pe$025$blkdone_sig_msg;
  assign blkdone_sig$025_val        = pe$025$blkdone_sig_val;
  assign blkdone_sig$026_msg        = pe$026$blkdone_sig_msg;
  assign blkdone_sig$026_val        = pe$026$blkdone_sig_val;
  assign blkdone_sig$027_msg        = pe$027$blkdone_sig_msg;
  assign blkdone_sig$027_val        = pe$027$blkdone_sig_val;
  assign blkdone_sig$028_msg        = pe$028$blkdone_sig_msg;
  assign blkdone_sig$028_val        = pe$028$blkdone_sig_val;
  assign blkdone_sig$029_msg        = pe$029$blkdone_sig_msg;
  assign blkdone_sig$029_val        = pe$029$blkdone_sig_val;
  assign blkdone_sig$030_msg        = pe$030$blkdone_sig_msg;
  assign blkdone_sig$030_val        = pe$030$blkdone_sig_val;
  assign blkdone_sig$031_msg        = pe$031$blkdone_sig_msg;
  assign blkdone_sig$031_val        = pe$031$blkdone_sig_val;
  assign blkdone_sig$032_msg        = pe$032$blkdone_sig_msg;
  assign blkdone_sig$032_val        = pe$032$blkdone_sig_val;
  assign blkdone_sig$033_msg        = pe$033$blkdone_sig_msg;
  assign blkdone_sig$033_val        = pe$033$blkdone_sig_val;
  assign blkdone_sig$034_msg        = pe$034$blkdone_sig_msg;
  assign blkdone_sig$034_val        = pe$034$blkdone_sig_val;
  assign blkdone_sig$035_msg        = pe$035$blkdone_sig_msg;
  assign blkdone_sig$035_val        = pe$035$blkdone_sig_val;
  assign blkdone_sig$036_msg        = pe$036$blkdone_sig_msg;
  assign blkdone_sig$036_val        = pe$036$blkdone_sig_val;
  assign blkdone_sig$037_msg        = pe$037$blkdone_sig_msg;
  assign blkdone_sig$037_val        = pe$037$blkdone_sig_val;
  assign blkdone_sig$038_msg        = pe$038$blkdone_sig_msg;
  assign blkdone_sig$038_val        = pe$038$blkdone_sig_val;
  assign blkdone_sig$039_msg        = pe$039$blkdone_sig_msg;
  assign blkdone_sig$039_val        = pe$039$blkdone_sig_val;
  assign blkdone_sig$040_msg        = pe$040$blkdone_sig_msg;
  assign blkdone_sig$040_val        = pe$040$blkdone_sig_val;
  assign blkdone_sig$041_msg        = pe$041$blkdone_sig_msg;
  assign blkdone_sig$041_val        = pe$041$blkdone_sig_val;
  assign blkdone_sig$042_msg        = pe$042$blkdone_sig_msg;
  assign blkdone_sig$042_val        = pe$042$blkdone_sig_val;
  assign blkdone_sig$043_msg        = pe$043$blkdone_sig_msg;
  assign blkdone_sig$043_val        = pe$043$blkdone_sig_val;
  assign blkdone_sig$044_msg        = pe$044$blkdone_sig_msg;
  assign blkdone_sig$044_val        = pe$044$blkdone_sig_val;
  assign blkdone_sig$045_msg        = pe$045$blkdone_sig_msg;
  assign blkdone_sig$045_val        = pe$045$blkdone_sig_val;
  assign blkdone_sig$046_msg        = pe$046$blkdone_sig_msg;
  assign blkdone_sig$046_val        = pe$046$blkdone_sig_val;
  assign blkdone_sig$047_msg        = pe$047$blkdone_sig_msg;
  assign blkdone_sig$047_val        = pe$047$blkdone_sig_val;
  assign blkdone_sig$048_msg        = pe$048$blkdone_sig_msg;
  assign blkdone_sig$048_val        = pe$048$blkdone_sig_val;
  assign blkdone_sig$049_msg        = pe$049$blkdone_sig_msg;
  assign blkdone_sig$049_val        = pe$049$blkdone_sig_val;
  assign blkdone_sig$050_msg        = pe$050$blkdone_sig_msg;
  assign blkdone_sig$050_val        = pe$050$blkdone_sig_val;
  assign blkdone_sig$051_msg        = pe$051$blkdone_sig_msg;
  assign blkdone_sig$051_val        = pe$051$blkdone_sig_val;
  assign blkdone_sig$052_msg        = pe$052$blkdone_sig_msg;
  assign blkdone_sig$052_val        = pe$052$blkdone_sig_val;
  assign blkdone_sig$053_msg        = pe$053$blkdone_sig_msg;
  assign blkdone_sig$053_val        = pe$053$blkdone_sig_val;
  assign blkdone_sig$054_msg        = pe$054$blkdone_sig_msg;
  assign blkdone_sig$054_val        = pe$054$blkdone_sig_val;
  assign blkdone_sig$055_msg        = pe$055$blkdone_sig_msg;
  assign blkdone_sig$055_val        = pe$055$blkdone_sig_val;
  assign blkdone_sig$056_msg        = pe$056$blkdone_sig_msg;
  assign blkdone_sig$056_val        = pe$056$blkdone_sig_val;
  assign blkdone_sig$057_msg        = pe$057$blkdone_sig_msg;
  assign blkdone_sig$057_val        = pe$057$blkdone_sig_val;
  assign blkdone_sig$058_msg        = pe$058$blkdone_sig_msg;
  assign blkdone_sig$058_val        = pe$058$blkdone_sig_val;
  assign blkdone_sig$059_msg        = pe$059$blkdone_sig_msg;
  assign blkdone_sig$059_val        = pe$059$blkdone_sig_val;
  assign blkdone_sig$060_msg        = pe$060$blkdone_sig_msg;
  assign blkdone_sig$060_val        = pe$060$blkdone_sig_val;
  assign blkdone_sig$061_msg        = pe$061$blkdone_sig_msg;
  assign blkdone_sig$061_val        = pe$061$blkdone_sig_val;
  assign blkdone_sig$062_msg        = pe$062$blkdone_sig_msg;
  assign blkdone_sig$062_val        = pe$062$blkdone_sig_val;
  assign blkdone_sig$063_msg        = pe$063$blkdone_sig_msg;
  assign blkdone_sig$063_val        = pe$063$blkdone_sig_val;
  assign cm_rdy_l$000               = pe$000$cm_rdy;
  assign cm_rdy_l$001               = pe$001$cm_rdy;
  assign cm_rdy_l$002               = pe$002$cm_rdy;
  assign cm_rdy_l$003               = pe$003$cm_rdy;
  assign cm_rdy_l$004               = pe$004$cm_rdy;
  assign cm_rdy_l$005               = pe$005$cm_rdy;
  assign cm_rdy_l$006               = pe$006$cm_rdy;
  assign cm_rdy_l$007               = pe$007$cm_rdy;
  assign cm_rdy_l$008               = pe$008$cm_rdy;
  assign cm_rdy_l$009               = pe$009$cm_rdy;
  assign cm_rdy_l$010               = pe$010$cm_rdy;
  assign cm_rdy_l$011               = pe$011$cm_rdy;
  assign cm_rdy_l$012               = pe$012$cm_rdy;
  assign cm_rdy_l$013               = pe$013$cm_rdy;
  assign cm_rdy_l$014               = pe$014$cm_rdy;
  assign cm_rdy_l$015               = pe$015$cm_rdy;
  assign cm_rdy_l$016               = pe$016$cm_rdy;
  assign cm_rdy_l$017               = pe$017$cm_rdy;
  assign cm_rdy_l$018               = pe$018$cm_rdy;
  assign cm_rdy_l$019               = pe$019$cm_rdy;
  assign cm_rdy_l$020               = pe$020$cm_rdy;
  assign cm_rdy_l$021               = pe$021$cm_rdy;
  assign cm_rdy_l$022               = pe$022$cm_rdy;
  assign cm_rdy_l$023               = pe$023$cm_rdy;
  assign cm_rdy_l$024               = pe$024$cm_rdy;
  assign cm_rdy_l$025               = pe$025$cm_rdy;
  assign cm_rdy_l$026               = pe$026$cm_rdy;
  assign cm_rdy_l$027               = pe$027$cm_rdy;
  assign cm_rdy_l$028               = pe$028$cm_rdy;
  assign cm_rdy_l$029               = pe$029$cm_rdy;
  assign cm_rdy_l$030               = pe$030$cm_rdy;
  assign cm_rdy_l$031               = pe$031$cm_rdy;
  assign cm_rdy_l$032               = pe$032$cm_rdy;
  assign cm_rdy_l$033               = pe$033$cm_rdy;
  assign cm_rdy_l$034               = pe$034$cm_rdy;
  assign cm_rdy_l$035               = pe$035$cm_rdy;
  assign cm_rdy_l$036               = pe$036$cm_rdy;
  assign cm_rdy_l$037               = pe$037$cm_rdy;
  assign cm_rdy_l$038               = pe$038$cm_rdy;
  assign cm_rdy_l$039               = pe$039$cm_rdy;
  assign cm_rdy_l$040               = pe$040$cm_rdy;
  assign cm_rdy_l$041               = pe$041$cm_rdy;
  assign cm_rdy_l$042               = pe$042$cm_rdy;
  assign cm_rdy_l$043               = pe$043$cm_rdy;
  assign cm_rdy_l$044               = pe$044$cm_rdy;
  assign cm_rdy_l$045               = pe$045$cm_rdy;
  assign cm_rdy_l$046               = pe$046$cm_rdy;
  assign cm_rdy_l$047               = pe$047$cm_rdy;
  assign cm_rdy_l$048               = pe$048$cm_rdy;
  assign cm_rdy_l$049               = pe$049$cm_rdy;
  assign cm_rdy_l$050               = pe$050$cm_rdy;
  assign cm_rdy_l$051               = pe$051$cm_rdy;
  assign cm_rdy_l$052               = pe$052$cm_rdy;
  assign cm_rdy_l$053               = pe$053$cm_rdy;
  assign cm_rdy_l$054               = pe$054$cm_rdy;
  assign cm_rdy_l$055               = pe$055$cm_rdy;
  assign cm_rdy_l$056               = pe$056$cm_rdy;
  assign cm_rdy_l$057               = pe$057$cm_rdy;
  assign cm_rdy_l$058               = pe$058$cm_rdy;
  assign cm_rdy_l$059               = pe$059$cm_rdy;
  assign cm_rdy_l$060               = pe$060$cm_rdy;
  assign cm_rdy_l$061               = pe$061$cm_rdy;
  assign cm_rdy_l$062               = pe$062$cm_rdy;
  assign cm_rdy_l$063               = pe$063$cm_rdy;


  assign pe$000$a_feeder_in_msg     = a_feeder_in$000_msg;
  assign pe$000$a_feeder_in_val     = a_feeder_in$000_val;
  assign pe$000$a_feeder_out_rdy    = pe$008$a_feeder_in_rdy;
  assign pe$000$blkdone_ack_msg     = blkdone_ack$000_msg;
  assign pe$000$blkdone_ack_val     = blkdone_ack$000_val;
  assign pe$000$blkdone_sig_rdy     = blkdone_sig$000_rdy;
  assign pe$000$clk                 = clk;
  assign pe$000$cm_msg              = cm_msg;
  assign pe$000$cm_val              = cm_val;
  assign pe$000$pe_id_msg           = pe_id$000_msg;
  assign pe$000$pe_id_val           = pe_id$000_val;
  assign pe$000$reset               = reset;
  assign pe$000$xbar_req_rdy        = xbar$000$xbar_req$000_rdy;
  assign pe$000$xbar_resp_msg       = xbar$000$xbar_resp$000_msg;
  assign pe$000$xbar_resp_val       = xbar$000$xbar_resp$000_val;
  assign pe$000$y_unloader_rdy      = y_unloader$000_rdy;
  assign pe$001$a_feeder_in_msg     = a_feeder_in$001_msg;
  assign pe$001$a_feeder_in_val     = a_feeder_in$001_val;
  assign pe$001$a_feeder_out_rdy    = pe$009$a_feeder_in_rdy;
  assign pe$001$blkdone_ack_msg     = blkdone_ack$001_msg;
  assign pe$001$blkdone_ack_val     = blkdone_ack$001_val;
  assign pe$001$blkdone_sig_rdy     = blkdone_sig$001_rdy;
  assign pe$001$clk                 = clk;
  assign pe$001$cm_msg              = cm_msg;
  assign pe$001$cm_val              = cm_val;
  assign pe$001$pe_id_msg           = pe_id$001_msg;
  assign pe$001$pe_id_val           = pe_id$001_val;
  assign pe$001$reset               = reset;
  assign pe$001$xbar_req_rdy        = xbar$000$xbar_req$001_rdy;
  assign pe$001$xbar_resp_msg       = xbar$000$xbar_resp$001_msg;
  assign pe$001$xbar_resp_val       = xbar$000$xbar_resp$001_val;
  assign pe$001$y_unloader_rdy      = y_unloader$001_rdy;
  assign pe$002$a_feeder_in_msg     = a_feeder_in$002_msg;
  assign pe$002$a_feeder_in_val     = a_feeder_in$002_val;
  assign pe$002$a_feeder_out_rdy    = pe$010$a_feeder_in_rdy;
  assign pe$002$blkdone_ack_msg     = blkdone_ack$002_msg;
  assign pe$002$blkdone_ack_val     = blkdone_ack$002_val;
  assign pe$002$blkdone_sig_rdy     = blkdone_sig$002_rdy;
  assign pe$002$clk                 = clk;
  assign pe$002$cm_msg              = cm_msg;
  assign pe$002$cm_val              = cm_val;
  assign pe$002$pe_id_msg           = pe_id$002_msg;
  assign pe$002$pe_id_val           = pe_id$002_val;
  assign pe$002$reset               = reset;
  assign pe$002$xbar_req_rdy        = xbar$000$xbar_req$002_rdy;
  assign pe$002$xbar_resp_msg       = xbar$000$xbar_resp$002_msg;
  assign pe$002$xbar_resp_val       = xbar$000$xbar_resp$002_val;
  assign pe$002$y_unloader_rdy      = y_unloader$002_rdy;
  assign pe$003$a_feeder_in_msg     = a_feeder_in$003_msg;
  assign pe$003$a_feeder_in_val     = a_feeder_in$003_val;
  assign pe$003$a_feeder_out_rdy    = pe$011$a_feeder_in_rdy;
  assign pe$003$blkdone_ack_msg     = blkdone_ack$003_msg;
  assign pe$003$blkdone_ack_val     = blkdone_ack$003_val;
  assign pe$003$blkdone_sig_rdy     = blkdone_sig$003_rdy;
  assign pe$003$clk                 = clk;
  assign pe$003$cm_msg              = cm_msg;
  assign pe$003$cm_val              = cm_val;
  assign pe$003$pe_id_msg           = pe_id$003_msg;
  assign pe$003$pe_id_val           = pe_id$003_val;
  assign pe$003$reset               = reset;
  assign pe$003$xbar_req_rdy        = xbar$000$xbar_req$003_rdy;
  assign pe$003$xbar_resp_msg       = xbar$000$xbar_resp$003_msg;
  assign pe$003$xbar_resp_val       = xbar$000$xbar_resp$003_val;
  assign pe$003$y_unloader_rdy      = y_unloader$003_rdy;
  assign pe$004$a_feeder_in_msg     = a_feeder_in$004_msg;
  assign pe$004$a_feeder_in_val     = a_feeder_in$004_val;
  assign pe$004$a_feeder_out_rdy    = pe$012$a_feeder_in_rdy;
  assign pe$004$blkdone_ack_msg     = blkdone_ack$004_msg;
  assign pe$004$blkdone_ack_val     = blkdone_ack$004_val;
  assign pe$004$blkdone_sig_rdy     = blkdone_sig$004_rdy;
  assign pe$004$clk                 = clk;
  assign pe$004$cm_msg              = cm_msg;
  assign pe$004$cm_val              = cm_val;
  assign pe$004$pe_id_msg           = pe_id$004_msg;
  assign pe$004$pe_id_val           = pe_id$004_val;
  assign pe$004$reset               = reset;
  assign pe$004$xbar_req_rdy        = xbar$000$xbar_req$004_rdy;
  assign pe$004$xbar_resp_msg       = xbar$000$xbar_resp$004_msg;
  assign pe$004$xbar_resp_val       = xbar$000$xbar_resp$004_val;
  assign pe$004$y_unloader_rdy      = y_unloader$004_rdy;
  assign pe$005$a_feeder_in_msg     = a_feeder_in$005_msg;
  assign pe$005$a_feeder_in_val     = a_feeder_in$005_val;
  assign pe$005$a_feeder_out_rdy    = pe$013$a_feeder_in_rdy;
  assign pe$005$blkdone_ack_msg     = blkdone_ack$005_msg;
  assign pe$005$blkdone_ack_val     = blkdone_ack$005_val;
  assign pe$005$blkdone_sig_rdy     = blkdone_sig$005_rdy;
  assign pe$005$clk                 = clk;
  assign pe$005$cm_msg              = cm_msg;
  assign pe$005$cm_val              = cm_val;
  assign pe$005$pe_id_msg           = pe_id$005_msg;
  assign pe$005$pe_id_val           = pe_id$005_val;
  assign pe$005$reset               = reset;
  assign pe$005$xbar_req_rdy        = xbar$000$xbar_req$005_rdy;
  assign pe$005$xbar_resp_msg       = xbar$000$xbar_resp$005_msg;
  assign pe$005$xbar_resp_val       = xbar$000$xbar_resp$005_val;
  assign pe$005$y_unloader_rdy      = y_unloader$005_rdy;
  assign pe$006$a_feeder_in_msg     = a_feeder_in$006_msg;
  assign pe$006$a_feeder_in_val     = a_feeder_in$006_val;
  assign pe$006$a_feeder_out_rdy    = pe$014$a_feeder_in_rdy;
  assign pe$006$blkdone_ack_msg     = blkdone_ack$006_msg;
  assign pe$006$blkdone_ack_val     = blkdone_ack$006_val;
  assign pe$006$blkdone_sig_rdy     = blkdone_sig$006_rdy;
  assign pe$006$clk                 = clk;
  assign pe$006$cm_msg              = cm_msg;
  assign pe$006$cm_val              = cm_val;
  assign pe$006$pe_id_msg           = pe_id$006_msg;
  assign pe$006$pe_id_val           = pe_id$006_val;
  assign pe$006$reset               = reset;
  assign pe$006$xbar_req_rdy        = xbar$000$xbar_req$006_rdy;
  assign pe$006$xbar_resp_msg       = xbar$000$xbar_resp$006_msg;
  assign pe$006$xbar_resp_val       = xbar$000$xbar_resp$006_val;
  assign pe$006$y_unloader_rdy      = y_unloader$006_rdy;
  assign pe$007$a_feeder_in_msg     = a_feeder_in$007_msg;
  assign pe$007$a_feeder_in_val     = a_feeder_in$007_val;
  assign pe$007$a_feeder_out_rdy    = pe$015$a_feeder_in_rdy;
  assign pe$007$blkdone_ack_msg     = blkdone_ack$007_msg;
  assign pe$007$blkdone_ack_val     = blkdone_ack$007_val;
  assign pe$007$blkdone_sig_rdy     = blkdone_sig$007_rdy;
  assign pe$007$clk                 = clk;
  assign pe$007$cm_msg              = cm_msg;
  assign pe$007$cm_val              = cm_val;
  assign pe$007$pe_id_msg           = pe_id$007_msg;
  assign pe$007$pe_id_val           = pe_id$007_val;
  assign pe$007$reset               = reset;
  assign pe$007$xbar_req_rdy        = xbar$000$xbar_req$007_rdy;
  assign pe$007$xbar_resp_msg       = xbar$000$xbar_resp$007_msg;
  assign pe$007$xbar_resp_val       = xbar$000$xbar_resp$007_val;
  assign pe$007$y_unloader_rdy      = y_unloader$007_rdy;
  assign pe$008$a_feeder_in_msg     = pe$000$a_feeder_out_msg;
  assign pe$008$a_feeder_in_val     = pe$000$a_feeder_out_val;
  assign pe$008$a_feeder_out_rdy    = pe$016$a_feeder_in_rdy;
  assign pe$008$blkdone_ack_msg     = blkdone_ack$008_msg;
  assign pe$008$blkdone_ack_val     = blkdone_ack$008_val;
  assign pe$008$blkdone_sig_rdy     = blkdone_sig$008_rdy;
  assign pe$008$clk                 = clk;
  assign pe$008$cm_msg              = cm_msg;
  assign pe$008$cm_val              = cm_val;
  assign pe$008$pe_id_msg           = pe_id$008_msg;
  assign pe$008$pe_id_val           = pe_id$008_val;
  assign pe$008$reset               = reset;
  assign pe$008$xbar_req_rdy        = xbar$001$xbar_req$000_rdy;
  assign pe$008$xbar_resp_msg       = xbar$001$xbar_resp$000_msg;
  assign pe$008$xbar_resp_val       = xbar$001$xbar_resp$000_val;
  assign pe$008$y_unloader_rdy      = y_unloader$008_rdy;
  assign pe$009$a_feeder_in_msg     = pe$001$a_feeder_out_msg;
  assign pe$009$a_feeder_in_val     = pe$001$a_feeder_out_val;
  assign pe$009$a_feeder_out_rdy    = pe$017$a_feeder_in_rdy;
  assign pe$009$blkdone_ack_msg     = blkdone_ack$009_msg;
  assign pe$009$blkdone_ack_val     = blkdone_ack$009_val;
  assign pe$009$blkdone_sig_rdy     = blkdone_sig$009_rdy;
  assign pe$009$clk                 = clk;
  assign pe$009$cm_msg              = cm_msg;
  assign pe$009$cm_val              = cm_val;
  assign pe$009$pe_id_msg           = pe_id$009_msg;
  assign pe$009$pe_id_val           = pe_id$009_val;
  assign pe$009$reset               = reset;
  assign pe$009$xbar_req_rdy        = xbar$001$xbar_req$001_rdy;
  assign pe$009$xbar_resp_msg       = xbar$001$xbar_resp$001_msg;
  assign pe$009$xbar_resp_val       = xbar$001$xbar_resp$001_val;
  assign pe$009$y_unloader_rdy      = y_unloader$009_rdy;
  assign pe$010$a_feeder_in_msg     = pe$002$a_feeder_out_msg;
  assign pe$010$a_feeder_in_val     = pe$002$a_feeder_out_val;
  assign pe$010$a_feeder_out_rdy    = pe$018$a_feeder_in_rdy;
  assign pe$010$blkdone_ack_msg     = blkdone_ack$010_msg;
  assign pe$010$blkdone_ack_val     = blkdone_ack$010_val;
  assign pe$010$blkdone_sig_rdy     = blkdone_sig$010_rdy;
  assign pe$010$clk                 = clk;
  assign pe$010$cm_msg              = cm_msg;
  assign pe$010$cm_val              = cm_val;
  assign pe$010$pe_id_msg           = pe_id$010_msg;
  assign pe$010$pe_id_val           = pe_id$010_val;
  assign pe$010$reset               = reset;
  assign pe$010$xbar_req_rdy        = xbar$001$xbar_req$002_rdy;
  assign pe$010$xbar_resp_msg       = xbar$001$xbar_resp$002_msg;
  assign pe$010$xbar_resp_val       = xbar$001$xbar_resp$002_val;
  assign pe$010$y_unloader_rdy      = y_unloader$010_rdy;
  assign pe$011$a_feeder_in_msg     = pe$003$a_feeder_out_msg;
  assign pe$011$a_feeder_in_val     = pe$003$a_feeder_out_val;
  assign pe$011$a_feeder_out_rdy    = pe$019$a_feeder_in_rdy;
  assign pe$011$blkdone_ack_msg     = blkdone_ack$011_msg;
  assign pe$011$blkdone_ack_val     = blkdone_ack$011_val;
  assign pe$011$blkdone_sig_rdy     = blkdone_sig$011_rdy;
  assign pe$011$clk                 = clk;
  assign pe$011$cm_msg              = cm_msg;
  assign pe$011$cm_val              = cm_val;
  assign pe$011$pe_id_msg           = pe_id$011_msg;
  assign pe$011$pe_id_val           = pe_id$011_val;
  assign pe$011$reset               = reset;
  assign pe$011$xbar_req_rdy        = xbar$001$xbar_req$003_rdy;
  assign pe$011$xbar_resp_msg       = xbar$001$xbar_resp$003_msg;
  assign pe$011$xbar_resp_val       = xbar$001$xbar_resp$003_val;
  assign pe$011$y_unloader_rdy      = y_unloader$011_rdy;
  assign pe$012$a_feeder_in_msg     = pe$004$a_feeder_out_msg;
  assign pe$012$a_feeder_in_val     = pe$004$a_feeder_out_val;
  assign pe$012$a_feeder_out_rdy    = pe$020$a_feeder_in_rdy;
  assign pe$012$blkdone_ack_msg     = blkdone_ack$012_msg;
  assign pe$012$blkdone_ack_val     = blkdone_ack$012_val;
  assign pe$012$blkdone_sig_rdy     = blkdone_sig$012_rdy;
  assign pe$012$clk                 = clk;
  assign pe$012$cm_msg              = cm_msg;
  assign pe$012$cm_val              = cm_val;
  assign pe$012$pe_id_msg           = pe_id$012_msg;
  assign pe$012$pe_id_val           = pe_id$012_val;
  assign pe$012$reset               = reset;
  assign pe$012$xbar_req_rdy        = xbar$001$xbar_req$004_rdy;
  assign pe$012$xbar_resp_msg       = xbar$001$xbar_resp$004_msg;
  assign pe$012$xbar_resp_val       = xbar$001$xbar_resp$004_val;
  assign pe$012$y_unloader_rdy      = y_unloader$012_rdy;
  assign pe$013$a_feeder_in_msg     = pe$005$a_feeder_out_msg;
  assign pe$013$a_feeder_in_val     = pe$005$a_feeder_out_val;
  assign pe$013$a_feeder_out_rdy    = pe$021$a_feeder_in_rdy;
  assign pe$013$blkdone_ack_msg     = blkdone_ack$013_msg;
  assign pe$013$blkdone_ack_val     = blkdone_ack$013_val;
  assign pe$013$blkdone_sig_rdy     = blkdone_sig$013_rdy;
  assign pe$013$clk                 = clk;
  assign pe$013$cm_msg              = cm_msg;
  assign pe$013$cm_val              = cm_val;
  assign pe$013$pe_id_msg           = pe_id$013_msg;
  assign pe$013$pe_id_val           = pe_id$013_val;
  assign pe$013$reset               = reset;
  assign pe$013$xbar_req_rdy        = xbar$001$xbar_req$005_rdy;
  assign pe$013$xbar_resp_msg       = xbar$001$xbar_resp$005_msg;
  assign pe$013$xbar_resp_val       = xbar$001$xbar_resp$005_val;
  assign pe$013$y_unloader_rdy      = y_unloader$013_rdy;
  assign pe$014$a_feeder_in_msg     = pe$006$a_feeder_out_msg;
  assign pe$014$a_feeder_in_val     = pe$006$a_feeder_out_val;
  assign pe$014$a_feeder_out_rdy    = pe$022$a_feeder_in_rdy;
  assign pe$014$blkdone_ack_msg     = blkdone_ack$014_msg;
  assign pe$014$blkdone_ack_val     = blkdone_ack$014_val;
  assign pe$014$blkdone_sig_rdy     = blkdone_sig$014_rdy;
  assign pe$014$clk                 = clk;
  assign pe$014$cm_msg              = cm_msg;
  assign pe$014$cm_val              = cm_val;
  assign pe$014$pe_id_msg           = pe_id$014_msg;
  assign pe$014$pe_id_val           = pe_id$014_val;
  assign pe$014$reset               = reset;
  assign pe$014$xbar_req_rdy        = xbar$001$xbar_req$006_rdy;
  assign pe$014$xbar_resp_msg       = xbar$001$xbar_resp$006_msg;
  assign pe$014$xbar_resp_val       = xbar$001$xbar_resp$006_val;
  assign pe$014$y_unloader_rdy      = y_unloader$014_rdy;
  assign pe$015$a_feeder_in_msg     = pe$007$a_feeder_out_msg;
  assign pe$015$a_feeder_in_val     = pe$007$a_feeder_out_val;
  assign pe$015$a_feeder_out_rdy    = pe$023$a_feeder_in_rdy;
  assign pe$015$blkdone_ack_msg     = blkdone_ack$015_msg;
  assign pe$015$blkdone_ack_val     = blkdone_ack$015_val;
  assign pe$015$blkdone_sig_rdy     = blkdone_sig$015_rdy;
  assign pe$015$clk                 = clk;
  assign pe$015$cm_msg              = cm_msg;
  assign pe$015$cm_val              = cm_val;
  assign pe$015$pe_id_msg           = pe_id$015_msg;
  assign pe$015$pe_id_val           = pe_id$015_val;
  assign pe$015$reset               = reset;
  assign pe$015$xbar_req_rdy        = xbar$001$xbar_req$007_rdy;
  assign pe$015$xbar_resp_msg       = xbar$001$xbar_resp$007_msg;
  assign pe$015$xbar_resp_val       = xbar$001$xbar_resp$007_val;
  assign pe$015$y_unloader_rdy      = y_unloader$015_rdy;
  assign pe$016$a_feeder_in_msg     = pe$008$a_feeder_out_msg;
  assign pe$016$a_feeder_in_val     = pe$008$a_feeder_out_val;
  assign pe$016$a_feeder_out_rdy    = pe$024$a_feeder_in_rdy;
  assign pe$016$blkdone_ack_msg     = blkdone_ack$016_msg;
  assign pe$016$blkdone_ack_val     = blkdone_ack$016_val;
  assign pe$016$blkdone_sig_rdy     = blkdone_sig$016_rdy;
  assign pe$016$clk                 = clk;
  assign pe$016$cm_msg              = cm_msg;
  assign pe$016$cm_val              = cm_val;
  assign pe$016$pe_id_msg           = pe_id$016_msg;
  assign pe$016$pe_id_val           = pe_id$016_val;
  assign pe$016$reset               = reset;
  assign pe$016$xbar_req_rdy        = xbar$002$xbar_req$000_rdy;
  assign pe$016$xbar_resp_msg       = xbar$002$xbar_resp$000_msg;
  assign pe$016$xbar_resp_val       = xbar$002$xbar_resp$000_val;
  assign pe$016$y_unloader_rdy      = y_unloader$016_rdy;
  assign pe$017$a_feeder_in_msg     = pe$009$a_feeder_out_msg;
  assign pe$017$a_feeder_in_val     = pe$009$a_feeder_out_val;
  assign pe$017$a_feeder_out_rdy    = pe$025$a_feeder_in_rdy;
  assign pe$017$blkdone_ack_msg     = blkdone_ack$017_msg;
  assign pe$017$blkdone_ack_val     = blkdone_ack$017_val;
  assign pe$017$blkdone_sig_rdy     = blkdone_sig$017_rdy;
  assign pe$017$clk                 = clk;
  assign pe$017$cm_msg              = cm_msg;
  assign pe$017$cm_val              = cm_val;
  assign pe$017$pe_id_msg           = pe_id$017_msg;
  assign pe$017$pe_id_val           = pe_id$017_val;
  assign pe$017$reset               = reset;
  assign pe$017$xbar_req_rdy        = xbar$002$xbar_req$001_rdy;
  assign pe$017$xbar_resp_msg       = xbar$002$xbar_resp$001_msg;
  assign pe$017$xbar_resp_val       = xbar$002$xbar_resp$001_val;
  assign pe$017$y_unloader_rdy      = y_unloader$017_rdy;
  assign pe$018$a_feeder_in_msg     = pe$010$a_feeder_out_msg;
  assign pe$018$a_feeder_in_val     = pe$010$a_feeder_out_val;
  assign pe$018$a_feeder_out_rdy    = pe$026$a_feeder_in_rdy;
  assign pe$018$blkdone_ack_msg     = blkdone_ack$018_msg;
  assign pe$018$blkdone_ack_val     = blkdone_ack$018_val;
  assign pe$018$blkdone_sig_rdy     = blkdone_sig$018_rdy;
  assign pe$018$clk                 = clk;
  assign pe$018$cm_msg              = cm_msg;
  assign pe$018$cm_val              = cm_val;
  assign pe$018$pe_id_msg           = pe_id$018_msg;
  assign pe$018$pe_id_val           = pe_id$018_val;
  assign pe$018$reset               = reset;
  assign pe$018$xbar_req_rdy        = xbar$002$xbar_req$002_rdy;
  assign pe$018$xbar_resp_msg       = xbar$002$xbar_resp$002_msg;
  assign pe$018$xbar_resp_val       = xbar$002$xbar_resp$002_val;
  assign pe$018$y_unloader_rdy      = y_unloader$018_rdy;
  assign pe$019$a_feeder_in_msg     = pe$011$a_feeder_out_msg;
  assign pe$019$a_feeder_in_val     = pe$011$a_feeder_out_val;
  assign pe$019$a_feeder_out_rdy    = pe$027$a_feeder_in_rdy;
  assign pe$019$blkdone_ack_msg     = blkdone_ack$019_msg;
  assign pe$019$blkdone_ack_val     = blkdone_ack$019_val;
  assign pe$019$blkdone_sig_rdy     = blkdone_sig$019_rdy;
  assign pe$019$clk                 = clk;
  assign pe$019$cm_msg              = cm_msg;
  assign pe$019$cm_val              = cm_val;
  assign pe$019$pe_id_msg           = pe_id$019_msg;
  assign pe$019$pe_id_val           = pe_id$019_val;
  assign pe$019$reset               = reset;
  assign pe$019$xbar_req_rdy        = xbar$002$xbar_req$003_rdy;
  assign pe$019$xbar_resp_msg       = xbar$002$xbar_resp$003_msg;
  assign pe$019$xbar_resp_val       = xbar$002$xbar_resp$003_val;
  assign pe$019$y_unloader_rdy      = y_unloader$019_rdy;
  assign pe$020$a_feeder_in_msg     = pe$012$a_feeder_out_msg;
  assign pe$020$a_feeder_in_val     = pe$012$a_feeder_out_val;
  assign pe$020$a_feeder_out_rdy    = pe$028$a_feeder_in_rdy;
  assign pe$020$blkdone_ack_msg     = blkdone_ack$020_msg;
  assign pe$020$blkdone_ack_val     = blkdone_ack$020_val;
  assign pe$020$blkdone_sig_rdy     = blkdone_sig$020_rdy;
  assign pe$020$clk                 = clk;
  assign pe$020$cm_msg              = cm_msg;
  assign pe$020$cm_val              = cm_val;
  assign pe$020$pe_id_msg           = pe_id$020_msg;
  assign pe$020$pe_id_val           = pe_id$020_val;
  assign pe$020$reset               = reset;
  assign pe$020$xbar_req_rdy        = xbar$002$xbar_req$004_rdy;
  assign pe$020$xbar_resp_msg       = xbar$002$xbar_resp$004_msg;
  assign pe$020$xbar_resp_val       = xbar$002$xbar_resp$004_val;
  assign pe$020$y_unloader_rdy      = y_unloader$020_rdy;
  assign pe$021$a_feeder_in_msg     = pe$013$a_feeder_out_msg;
  assign pe$021$a_feeder_in_val     = pe$013$a_feeder_out_val;
  assign pe$021$a_feeder_out_rdy    = pe$029$a_feeder_in_rdy;
  assign pe$021$blkdone_ack_msg     = blkdone_ack$021_msg;
  assign pe$021$blkdone_ack_val     = blkdone_ack$021_val;
  assign pe$021$blkdone_sig_rdy     = blkdone_sig$021_rdy;
  assign pe$021$clk                 = clk;
  assign pe$021$cm_msg              = cm_msg;
  assign pe$021$cm_val              = cm_val;
  assign pe$021$pe_id_msg           = pe_id$021_msg;
  assign pe$021$pe_id_val           = pe_id$021_val;
  assign pe$021$reset               = reset;
  assign pe$021$xbar_req_rdy        = xbar$002$xbar_req$005_rdy;
  assign pe$021$xbar_resp_msg       = xbar$002$xbar_resp$005_msg;
  assign pe$021$xbar_resp_val       = xbar$002$xbar_resp$005_val;
  assign pe$021$y_unloader_rdy      = y_unloader$021_rdy;
  assign pe$022$a_feeder_in_msg     = pe$014$a_feeder_out_msg;
  assign pe$022$a_feeder_in_val     = pe$014$a_feeder_out_val;
  assign pe$022$a_feeder_out_rdy    = pe$030$a_feeder_in_rdy;
  assign pe$022$blkdone_ack_msg     = blkdone_ack$022_msg;
  assign pe$022$blkdone_ack_val     = blkdone_ack$022_val;
  assign pe$022$blkdone_sig_rdy     = blkdone_sig$022_rdy;
  assign pe$022$clk                 = clk;
  assign pe$022$cm_msg              = cm_msg;
  assign pe$022$cm_val              = cm_val;
  assign pe$022$pe_id_msg           = pe_id$022_msg;
  assign pe$022$pe_id_val           = pe_id$022_val;
  assign pe$022$reset               = reset;
  assign pe$022$xbar_req_rdy        = xbar$002$xbar_req$006_rdy;
  assign pe$022$xbar_resp_msg       = xbar$002$xbar_resp$006_msg;
  assign pe$022$xbar_resp_val       = xbar$002$xbar_resp$006_val;
  assign pe$022$y_unloader_rdy      = y_unloader$022_rdy;
  assign pe$023$a_feeder_in_msg     = pe$015$a_feeder_out_msg;
  assign pe$023$a_feeder_in_val     = pe$015$a_feeder_out_val;
  assign pe$023$a_feeder_out_rdy    = pe$031$a_feeder_in_rdy;
  assign pe$023$blkdone_ack_msg     = blkdone_ack$023_msg;
  assign pe$023$blkdone_ack_val     = blkdone_ack$023_val;
  assign pe$023$blkdone_sig_rdy     = blkdone_sig$023_rdy;
  assign pe$023$clk                 = clk;
  assign pe$023$cm_msg              = cm_msg;
  assign pe$023$cm_val              = cm_val;
  assign pe$023$pe_id_msg           = pe_id$023_msg;
  assign pe$023$pe_id_val           = pe_id$023_val;
  assign pe$023$reset               = reset;
  assign pe$023$xbar_req_rdy        = xbar$002$xbar_req$007_rdy;
  assign pe$023$xbar_resp_msg       = xbar$002$xbar_resp$007_msg;
  assign pe$023$xbar_resp_val       = xbar$002$xbar_resp$007_val;
  assign pe$023$y_unloader_rdy      = y_unloader$023_rdy;
  assign pe$024$a_feeder_in_msg     = pe$016$a_feeder_out_msg;
  assign pe$024$a_feeder_in_val     = pe$016$a_feeder_out_val;
  assign pe$024$a_feeder_out_rdy    = pe$032$a_feeder_in_rdy;
  assign pe$024$blkdone_ack_msg     = blkdone_ack$024_msg;
  assign pe$024$blkdone_ack_val     = blkdone_ack$024_val;
  assign pe$024$blkdone_sig_rdy     = blkdone_sig$024_rdy;
  assign pe$024$clk                 = clk;
  assign pe$024$cm_msg              = cm_msg;
  assign pe$024$cm_val              = cm_val;
  assign pe$024$pe_id_msg           = pe_id$024_msg;
  assign pe$024$pe_id_val           = pe_id$024_val;
  assign pe$024$reset               = reset;
  assign pe$024$xbar_req_rdy        = xbar$003$xbar_req$000_rdy;
  assign pe$024$xbar_resp_msg       = xbar$003$xbar_resp$000_msg;
  assign pe$024$xbar_resp_val       = xbar$003$xbar_resp$000_val;
  assign pe$024$y_unloader_rdy      = y_unloader$024_rdy;
  assign pe$025$a_feeder_in_msg     = pe$017$a_feeder_out_msg;
  assign pe$025$a_feeder_in_val     = pe$017$a_feeder_out_val;
  assign pe$025$a_feeder_out_rdy    = pe$033$a_feeder_in_rdy;
  assign pe$025$blkdone_ack_msg     = blkdone_ack$025_msg;
  assign pe$025$blkdone_ack_val     = blkdone_ack$025_val;
  assign pe$025$blkdone_sig_rdy     = blkdone_sig$025_rdy;
  assign pe$025$clk                 = clk;
  assign pe$025$cm_msg              = cm_msg;
  assign pe$025$cm_val              = cm_val;
  assign pe$025$pe_id_msg           = pe_id$025_msg;
  assign pe$025$pe_id_val           = pe_id$025_val;
  assign pe$025$reset               = reset;
  assign pe$025$xbar_req_rdy        = xbar$003$xbar_req$001_rdy;
  assign pe$025$xbar_resp_msg       = xbar$003$xbar_resp$001_msg;
  assign pe$025$xbar_resp_val       = xbar$003$xbar_resp$001_val;
  assign pe$025$y_unloader_rdy      = y_unloader$025_rdy;
  assign pe$026$a_feeder_in_msg     = pe$018$a_feeder_out_msg;
  assign pe$026$a_feeder_in_val     = pe$018$a_feeder_out_val;
  assign pe$026$a_feeder_out_rdy    = pe$034$a_feeder_in_rdy;
  assign pe$026$blkdone_ack_msg     = blkdone_ack$026_msg;
  assign pe$026$blkdone_ack_val     = blkdone_ack$026_val;
  assign pe$026$blkdone_sig_rdy     = blkdone_sig$026_rdy;
  assign pe$026$clk                 = clk;
  assign pe$026$cm_msg              = cm_msg;
  assign pe$026$cm_val              = cm_val;
  assign pe$026$pe_id_msg           = pe_id$026_msg;
  assign pe$026$pe_id_val           = pe_id$026_val;
  assign pe$026$reset               = reset;
  assign pe$026$xbar_req_rdy        = xbar$003$xbar_req$002_rdy;
  assign pe$026$xbar_resp_msg       = xbar$003$xbar_resp$002_msg;
  assign pe$026$xbar_resp_val       = xbar$003$xbar_resp$002_val;
  assign pe$026$y_unloader_rdy      = y_unloader$026_rdy;
  assign pe$027$a_feeder_in_msg     = pe$019$a_feeder_out_msg;
  assign pe$027$a_feeder_in_val     = pe$019$a_feeder_out_val;
  assign pe$027$a_feeder_out_rdy    = pe$035$a_feeder_in_rdy;
  assign pe$027$blkdone_ack_msg     = blkdone_ack$027_msg;
  assign pe$027$blkdone_ack_val     = blkdone_ack$027_val;
  assign pe$027$blkdone_sig_rdy     = blkdone_sig$027_rdy;
  assign pe$027$clk                 = clk;
  assign pe$027$cm_msg              = cm_msg;
  assign pe$027$cm_val              = cm_val;
  assign pe$027$pe_id_msg           = pe_id$027_msg;
  assign pe$027$pe_id_val           = pe_id$027_val;
  assign pe$027$reset               = reset;
  assign pe$027$xbar_req_rdy        = xbar$003$xbar_req$003_rdy;
  assign pe$027$xbar_resp_msg       = xbar$003$xbar_resp$003_msg;
  assign pe$027$xbar_resp_val       = xbar$003$xbar_resp$003_val;
  assign pe$027$y_unloader_rdy      = y_unloader$027_rdy;
  assign pe$028$a_feeder_in_msg     = pe$020$a_feeder_out_msg;
  assign pe$028$a_feeder_in_val     = pe$020$a_feeder_out_val;
  assign pe$028$a_feeder_out_rdy    = pe$036$a_feeder_in_rdy;
  assign pe$028$blkdone_ack_msg     = blkdone_ack$028_msg;
  assign pe$028$blkdone_ack_val     = blkdone_ack$028_val;
  assign pe$028$blkdone_sig_rdy     = blkdone_sig$028_rdy;
  assign pe$028$clk                 = clk;
  assign pe$028$cm_msg              = cm_msg;
  assign pe$028$cm_val              = cm_val;
  assign pe$028$pe_id_msg           = pe_id$028_msg;
  assign pe$028$pe_id_val           = pe_id$028_val;
  assign pe$028$reset               = reset;
  assign pe$028$xbar_req_rdy        = xbar$003$xbar_req$004_rdy;
  assign pe$028$xbar_resp_msg       = xbar$003$xbar_resp$004_msg;
  assign pe$028$xbar_resp_val       = xbar$003$xbar_resp$004_val;
  assign pe$028$y_unloader_rdy      = y_unloader$028_rdy;
  assign pe$029$a_feeder_in_msg     = pe$021$a_feeder_out_msg;
  assign pe$029$a_feeder_in_val     = pe$021$a_feeder_out_val;
  assign pe$029$a_feeder_out_rdy    = pe$037$a_feeder_in_rdy;
  assign pe$029$blkdone_ack_msg     = blkdone_ack$029_msg;
  assign pe$029$blkdone_ack_val     = blkdone_ack$029_val;
  assign pe$029$blkdone_sig_rdy     = blkdone_sig$029_rdy;
  assign pe$029$clk                 = clk;
  assign pe$029$cm_msg              = cm_msg;
  assign pe$029$cm_val              = cm_val;
  assign pe$029$pe_id_msg           = pe_id$029_msg;
  assign pe$029$pe_id_val           = pe_id$029_val;
  assign pe$029$reset               = reset;
  assign pe$029$xbar_req_rdy        = xbar$003$xbar_req$005_rdy;
  assign pe$029$xbar_resp_msg       = xbar$003$xbar_resp$005_msg;
  assign pe$029$xbar_resp_val       = xbar$003$xbar_resp$005_val;
  assign pe$029$y_unloader_rdy      = y_unloader$029_rdy;
  assign pe$030$a_feeder_in_msg     = pe$022$a_feeder_out_msg;
  assign pe$030$a_feeder_in_val     = pe$022$a_feeder_out_val;
  assign pe$030$a_feeder_out_rdy    = pe$038$a_feeder_in_rdy;
  assign pe$030$blkdone_ack_msg     = blkdone_ack$030_msg;
  assign pe$030$blkdone_ack_val     = blkdone_ack$030_val;
  assign pe$030$blkdone_sig_rdy     = blkdone_sig$030_rdy;
  assign pe$030$clk                 = clk;
  assign pe$030$cm_msg              = cm_msg;
  assign pe$030$cm_val              = cm_val;
  assign pe$030$pe_id_msg           = pe_id$030_msg;
  assign pe$030$pe_id_val           = pe_id$030_val;
  assign pe$030$reset               = reset;
  assign pe$030$xbar_req_rdy        = xbar$003$xbar_req$006_rdy;
  assign pe$030$xbar_resp_msg       = xbar$003$xbar_resp$006_msg;
  assign pe$030$xbar_resp_val       = xbar$003$xbar_resp$006_val;
  assign pe$030$y_unloader_rdy      = y_unloader$030_rdy;
  assign pe$031$a_feeder_in_msg     = pe$023$a_feeder_out_msg;
  assign pe$031$a_feeder_in_val     = pe$023$a_feeder_out_val;
  assign pe$031$a_feeder_out_rdy    = pe$039$a_feeder_in_rdy;
  assign pe$031$blkdone_ack_msg     = blkdone_ack$031_msg;
  assign pe$031$blkdone_ack_val     = blkdone_ack$031_val;
  assign pe$031$blkdone_sig_rdy     = blkdone_sig$031_rdy;
  assign pe$031$clk                 = clk;
  assign pe$031$cm_msg              = cm_msg;
  assign pe$031$cm_val              = cm_val;
  assign pe$031$pe_id_msg           = pe_id$031_msg;
  assign pe$031$pe_id_val           = pe_id$031_val;
  assign pe$031$reset               = reset;
  assign pe$031$xbar_req_rdy        = xbar$003$xbar_req$007_rdy;
  assign pe$031$xbar_resp_msg       = xbar$003$xbar_resp$007_msg;
  assign pe$031$xbar_resp_val       = xbar$003$xbar_resp$007_val;
  assign pe$031$y_unloader_rdy      = y_unloader$031_rdy;
  assign pe$032$a_feeder_in_msg     = pe$024$a_feeder_out_msg;
  assign pe$032$a_feeder_in_val     = pe$024$a_feeder_out_val;
  assign pe$032$a_feeder_out_rdy    = pe$040$a_feeder_in_rdy;
  assign pe$032$blkdone_ack_msg     = blkdone_ack$032_msg;
  assign pe$032$blkdone_ack_val     = blkdone_ack$032_val;
  assign pe$032$blkdone_sig_rdy     = blkdone_sig$032_rdy;
  assign pe$032$clk                 = clk;
  assign pe$032$cm_msg              = cm_msg;
  assign pe$032$cm_val              = cm_val;
  assign pe$032$pe_id_msg           = pe_id$032_msg;
  assign pe$032$pe_id_val           = pe_id$032_val;
  assign pe$032$reset               = reset;
  assign pe$032$xbar_req_rdy        = xbar$004$xbar_req$000_rdy;
  assign pe$032$xbar_resp_msg       = xbar$004$xbar_resp$000_msg;
  assign pe$032$xbar_resp_val       = xbar$004$xbar_resp$000_val;
  assign pe$032$y_unloader_rdy      = y_unloader$032_rdy;
  assign pe$033$a_feeder_in_msg     = pe$025$a_feeder_out_msg;
  assign pe$033$a_feeder_in_val     = pe$025$a_feeder_out_val;
  assign pe$033$a_feeder_out_rdy    = pe$041$a_feeder_in_rdy;
  assign pe$033$blkdone_ack_msg     = blkdone_ack$033_msg;
  assign pe$033$blkdone_ack_val     = blkdone_ack$033_val;
  assign pe$033$blkdone_sig_rdy     = blkdone_sig$033_rdy;
  assign pe$033$clk                 = clk;
  assign pe$033$cm_msg              = cm_msg;
  assign pe$033$cm_val              = cm_val;
  assign pe$033$pe_id_msg           = pe_id$033_msg;
  assign pe$033$pe_id_val           = pe_id$033_val;
  assign pe$033$reset               = reset;
  assign pe$033$xbar_req_rdy        = xbar$004$xbar_req$001_rdy;
  assign pe$033$xbar_resp_msg       = xbar$004$xbar_resp$001_msg;
  assign pe$033$xbar_resp_val       = xbar$004$xbar_resp$001_val;
  assign pe$033$y_unloader_rdy      = y_unloader$033_rdy;
  assign pe$034$a_feeder_in_msg     = pe$026$a_feeder_out_msg;
  assign pe$034$a_feeder_in_val     = pe$026$a_feeder_out_val;
  assign pe$034$a_feeder_out_rdy    = pe$042$a_feeder_in_rdy;
  assign pe$034$blkdone_ack_msg     = blkdone_ack$034_msg;
  assign pe$034$blkdone_ack_val     = blkdone_ack$034_val;
  assign pe$034$blkdone_sig_rdy     = blkdone_sig$034_rdy;
  assign pe$034$clk                 = clk;
  assign pe$034$cm_msg              = cm_msg;
  assign pe$034$cm_val              = cm_val;
  assign pe$034$pe_id_msg           = pe_id$034_msg;
  assign pe$034$pe_id_val           = pe_id$034_val;
  assign pe$034$reset               = reset;
  assign pe$034$xbar_req_rdy        = xbar$004$xbar_req$002_rdy;
  assign pe$034$xbar_resp_msg       = xbar$004$xbar_resp$002_msg;
  assign pe$034$xbar_resp_val       = xbar$004$xbar_resp$002_val;
  assign pe$034$y_unloader_rdy      = y_unloader$034_rdy;
  assign pe$035$a_feeder_in_msg     = pe$027$a_feeder_out_msg;
  assign pe$035$a_feeder_in_val     = pe$027$a_feeder_out_val;
  assign pe$035$a_feeder_out_rdy    = pe$043$a_feeder_in_rdy;
  assign pe$035$blkdone_ack_msg     = blkdone_ack$035_msg;
  assign pe$035$blkdone_ack_val     = blkdone_ack$035_val;
  assign pe$035$blkdone_sig_rdy     = blkdone_sig$035_rdy;
  assign pe$035$clk                 = clk;
  assign pe$035$cm_msg              = cm_msg;
  assign pe$035$cm_val              = cm_val;
  assign pe$035$pe_id_msg           = pe_id$035_msg;
  assign pe$035$pe_id_val           = pe_id$035_val;
  assign pe$035$reset               = reset;
  assign pe$035$xbar_req_rdy        = xbar$004$xbar_req$003_rdy;
  assign pe$035$xbar_resp_msg       = xbar$004$xbar_resp$003_msg;
  assign pe$035$xbar_resp_val       = xbar$004$xbar_resp$003_val;
  assign pe$035$y_unloader_rdy      = y_unloader$035_rdy;
  assign pe$036$a_feeder_in_msg     = pe$028$a_feeder_out_msg;
  assign pe$036$a_feeder_in_val     = pe$028$a_feeder_out_val;
  assign pe$036$a_feeder_out_rdy    = pe$044$a_feeder_in_rdy;
  assign pe$036$blkdone_ack_msg     = blkdone_ack$036_msg;
  assign pe$036$blkdone_ack_val     = blkdone_ack$036_val;
  assign pe$036$blkdone_sig_rdy     = blkdone_sig$036_rdy;
  assign pe$036$clk                 = clk;
  assign pe$036$cm_msg              = cm_msg;
  assign pe$036$cm_val              = cm_val;
  assign pe$036$pe_id_msg           = pe_id$036_msg;
  assign pe$036$pe_id_val           = pe_id$036_val;
  assign pe$036$reset               = reset;
  assign pe$036$xbar_req_rdy        = xbar$004$xbar_req$004_rdy;
  assign pe$036$xbar_resp_msg       = xbar$004$xbar_resp$004_msg;
  assign pe$036$xbar_resp_val       = xbar$004$xbar_resp$004_val;
  assign pe$036$y_unloader_rdy      = y_unloader$036_rdy;
  assign pe$037$a_feeder_in_msg     = pe$029$a_feeder_out_msg;
  assign pe$037$a_feeder_in_val     = pe$029$a_feeder_out_val;
  assign pe$037$a_feeder_out_rdy    = pe$045$a_feeder_in_rdy;
  assign pe$037$blkdone_ack_msg     = blkdone_ack$037_msg;
  assign pe$037$blkdone_ack_val     = blkdone_ack$037_val;
  assign pe$037$blkdone_sig_rdy     = blkdone_sig$037_rdy;
  assign pe$037$clk                 = clk;
  assign pe$037$cm_msg              = cm_msg;
  assign pe$037$cm_val              = cm_val;
  assign pe$037$pe_id_msg           = pe_id$037_msg;
  assign pe$037$pe_id_val           = pe_id$037_val;
  assign pe$037$reset               = reset;
  assign pe$037$xbar_req_rdy        = xbar$004$xbar_req$005_rdy;
  assign pe$037$xbar_resp_msg       = xbar$004$xbar_resp$005_msg;
  assign pe$037$xbar_resp_val       = xbar$004$xbar_resp$005_val;
  assign pe$037$y_unloader_rdy      = y_unloader$037_rdy;
  assign pe$038$a_feeder_in_msg     = pe$030$a_feeder_out_msg;
  assign pe$038$a_feeder_in_val     = pe$030$a_feeder_out_val;
  assign pe$038$a_feeder_out_rdy    = pe$046$a_feeder_in_rdy;
  assign pe$038$blkdone_ack_msg     = blkdone_ack$038_msg;
  assign pe$038$blkdone_ack_val     = blkdone_ack$038_val;
  assign pe$038$blkdone_sig_rdy     = blkdone_sig$038_rdy;
  assign pe$038$clk                 = clk;
  assign pe$038$cm_msg              = cm_msg;
  assign pe$038$cm_val              = cm_val;
  assign pe$038$pe_id_msg           = pe_id$038_msg;
  assign pe$038$pe_id_val           = pe_id$038_val;
  assign pe$038$reset               = reset;
  assign pe$038$xbar_req_rdy        = xbar$004$xbar_req$006_rdy;
  assign pe$038$xbar_resp_msg       = xbar$004$xbar_resp$006_msg;
  assign pe$038$xbar_resp_val       = xbar$004$xbar_resp$006_val;
  assign pe$038$y_unloader_rdy      = y_unloader$038_rdy;
  assign pe$039$a_feeder_in_msg     = pe$031$a_feeder_out_msg;
  assign pe$039$a_feeder_in_val     = pe$031$a_feeder_out_val;
  assign pe$039$a_feeder_out_rdy    = pe$047$a_feeder_in_rdy;
  assign pe$039$blkdone_ack_msg     = blkdone_ack$039_msg;
  assign pe$039$blkdone_ack_val     = blkdone_ack$039_val;
  assign pe$039$blkdone_sig_rdy     = blkdone_sig$039_rdy;
  assign pe$039$clk                 = clk;
  assign pe$039$cm_msg              = cm_msg;
  assign pe$039$cm_val              = cm_val;
  assign pe$039$pe_id_msg           = pe_id$039_msg;
  assign pe$039$pe_id_val           = pe_id$039_val;
  assign pe$039$reset               = reset;
  assign pe$039$xbar_req_rdy        = xbar$004$xbar_req$007_rdy;
  assign pe$039$xbar_resp_msg       = xbar$004$xbar_resp$007_msg;
  assign pe$039$xbar_resp_val       = xbar$004$xbar_resp$007_val;
  assign pe$039$y_unloader_rdy      = y_unloader$039_rdy;
  assign pe$040$a_feeder_in_msg     = pe$032$a_feeder_out_msg;
  assign pe$040$a_feeder_in_val     = pe$032$a_feeder_out_val;
  assign pe$040$a_feeder_out_rdy    = pe$048$a_feeder_in_rdy;
  assign pe$040$blkdone_ack_msg     = blkdone_ack$040_msg;
  assign pe$040$blkdone_ack_val     = blkdone_ack$040_val;
  assign pe$040$blkdone_sig_rdy     = blkdone_sig$040_rdy;
  assign pe$040$clk                 = clk;
  assign pe$040$cm_msg              = cm_msg;
  assign pe$040$cm_val              = cm_val;
  assign pe$040$pe_id_msg           = pe_id$040_msg;
  assign pe$040$pe_id_val           = pe_id$040_val;
  assign pe$040$reset               = reset;
  assign pe$040$xbar_req_rdy        = xbar$005$xbar_req$000_rdy;
  assign pe$040$xbar_resp_msg       = xbar$005$xbar_resp$000_msg;
  assign pe$040$xbar_resp_val       = xbar$005$xbar_resp$000_val;
  assign pe$040$y_unloader_rdy      = y_unloader$040_rdy;
  assign pe$041$a_feeder_in_msg     = pe$033$a_feeder_out_msg;
  assign pe$041$a_feeder_in_val     = pe$033$a_feeder_out_val;
  assign pe$041$a_feeder_out_rdy    = pe$049$a_feeder_in_rdy;
  assign pe$041$blkdone_ack_msg     = blkdone_ack$041_msg;
  assign pe$041$blkdone_ack_val     = blkdone_ack$041_val;
  assign pe$041$blkdone_sig_rdy     = blkdone_sig$041_rdy;
  assign pe$041$clk                 = clk;
  assign pe$041$cm_msg              = cm_msg;
  assign pe$041$cm_val              = cm_val;
  assign pe$041$pe_id_msg           = pe_id$041_msg;
  assign pe$041$pe_id_val           = pe_id$041_val;
  assign pe$041$reset               = reset;
  assign pe$041$xbar_req_rdy        = xbar$005$xbar_req$001_rdy;
  assign pe$041$xbar_resp_msg       = xbar$005$xbar_resp$001_msg;
  assign pe$041$xbar_resp_val       = xbar$005$xbar_resp$001_val;
  assign pe$041$y_unloader_rdy      = y_unloader$041_rdy;
  assign pe$042$a_feeder_in_msg     = pe$034$a_feeder_out_msg;
  assign pe$042$a_feeder_in_val     = pe$034$a_feeder_out_val;
  assign pe$042$a_feeder_out_rdy    = pe$050$a_feeder_in_rdy;
  assign pe$042$blkdone_ack_msg     = blkdone_ack$042_msg;
  assign pe$042$blkdone_ack_val     = blkdone_ack$042_val;
  assign pe$042$blkdone_sig_rdy     = blkdone_sig$042_rdy;
  assign pe$042$clk                 = clk;
  assign pe$042$cm_msg              = cm_msg;
  assign pe$042$cm_val              = cm_val;
  assign pe$042$pe_id_msg           = pe_id$042_msg;
  assign pe$042$pe_id_val           = pe_id$042_val;
  assign pe$042$reset               = reset;
  assign pe$042$xbar_req_rdy        = xbar$005$xbar_req$002_rdy;
  assign pe$042$xbar_resp_msg       = xbar$005$xbar_resp$002_msg;
  assign pe$042$xbar_resp_val       = xbar$005$xbar_resp$002_val;
  assign pe$042$y_unloader_rdy      = y_unloader$042_rdy;
  assign pe$043$a_feeder_in_msg     = pe$035$a_feeder_out_msg;
  assign pe$043$a_feeder_in_val     = pe$035$a_feeder_out_val;
  assign pe$043$a_feeder_out_rdy    = pe$051$a_feeder_in_rdy;
  assign pe$043$blkdone_ack_msg     = blkdone_ack$043_msg;
  assign pe$043$blkdone_ack_val     = blkdone_ack$043_val;
  assign pe$043$blkdone_sig_rdy     = blkdone_sig$043_rdy;
  assign pe$043$clk                 = clk;
  assign pe$043$cm_msg              = cm_msg;
  assign pe$043$cm_val              = cm_val;
  assign pe$043$pe_id_msg           = pe_id$043_msg;
  assign pe$043$pe_id_val           = pe_id$043_val;
  assign pe$043$reset               = reset;
  assign pe$043$xbar_req_rdy        = xbar$005$xbar_req$003_rdy;
  assign pe$043$xbar_resp_msg       = xbar$005$xbar_resp$003_msg;
  assign pe$043$xbar_resp_val       = xbar$005$xbar_resp$003_val;
  assign pe$043$y_unloader_rdy      = y_unloader$043_rdy;
  assign pe$044$a_feeder_in_msg     = pe$036$a_feeder_out_msg;
  assign pe$044$a_feeder_in_val     = pe$036$a_feeder_out_val;
  assign pe$044$a_feeder_out_rdy    = pe$052$a_feeder_in_rdy;
  assign pe$044$blkdone_ack_msg     = blkdone_ack$044_msg;
  assign pe$044$blkdone_ack_val     = blkdone_ack$044_val;
  assign pe$044$blkdone_sig_rdy     = blkdone_sig$044_rdy;
  assign pe$044$clk                 = clk;
  assign pe$044$cm_msg              = cm_msg;
  assign pe$044$cm_val              = cm_val;
  assign pe$044$pe_id_msg           = pe_id$044_msg;
  assign pe$044$pe_id_val           = pe_id$044_val;
  assign pe$044$reset               = reset;
  assign pe$044$xbar_req_rdy        = xbar$005$xbar_req$004_rdy;
  assign pe$044$xbar_resp_msg       = xbar$005$xbar_resp$004_msg;
  assign pe$044$xbar_resp_val       = xbar$005$xbar_resp$004_val;
  assign pe$044$y_unloader_rdy      = y_unloader$044_rdy;
  assign pe$045$a_feeder_in_msg     = pe$037$a_feeder_out_msg;
  assign pe$045$a_feeder_in_val     = pe$037$a_feeder_out_val;
  assign pe$045$a_feeder_out_rdy    = pe$053$a_feeder_in_rdy;
  assign pe$045$blkdone_ack_msg     = blkdone_ack$045_msg;
  assign pe$045$blkdone_ack_val     = blkdone_ack$045_val;
  assign pe$045$blkdone_sig_rdy     = blkdone_sig$045_rdy;
  assign pe$045$clk                 = clk;
  assign pe$045$cm_msg              = cm_msg;
  assign pe$045$cm_val              = cm_val;
  assign pe$045$pe_id_msg           = pe_id$045_msg;
  assign pe$045$pe_id_val           = pe_id$045_val;
  assign pe$045$reset               = reset;
  assign pe$045$xbar_req_rdy        = xbar$005$xbar_req$005_rdy;
  assign pe$045$xbar_resp_msg       = xbar$005$xbar_resp$005_msg;
  assign pe$045$xbar_resp_val       = xbar$005$xbar_resp$005_val;
  assign pe$045$y_unloader_rdy      = y_unloader$045_rdy;
  assign pe$046$a_feeder_in_msg     = pe$038$a_feeder_out_msg;
  assign pe$046$a_feeder_in_val     = pe$038$a_feeder_out_val;
  assign pe$046$a_feeder_out_rdy    = pe$054$a_feeder_in_rdy;
  assign pe$046$blkdone_ack_msg     = blkdone_ack$046_msg;
  assign pe$046$blkdone_ack_val     = blkdone_ack$046_val;
  assign pe$046$blkdone_sig_rdy     = blkdone_sig$046_rdy;
  assign pe$046$clk                 = clk;
  assign pe$046$cm_msg              = cm_msg;
  assign pe$046$cm_val              = cm_val;
  assign pe$046$pe_id_msg           = pe_id$046_msg;
  assign pe$046$pe_id_val           = pe_id$046_val;
  assign pe$046$reset               = reset;
  assign pe$046$xbar_req_rdy        = xbar$005$xbar_req$006_rdy;
  assign pe$046$xbar_resp_msg       = xbar$005$xbar_resp$006_msg;
  assign pe$046$xbar_resp_val       = xbar$005$xbar_resp$006_val;
  assign pe$046$y_unloader_rdy      = y_unloader$046_rdy;
  assign pe$047$a_feeder_in_msg     = pe$039$a_feeder_out_msg;
  assign pe$047$a_feeder_in_val     = pe$039$a_feeder_out_val;
  assign pe$047$a_feeder_out_rdy    = pe$055$a_feeder_in_rdy;
  assign pe$047$blkdone_ack_msg     = blkdone_ack$047_msg;
  assign pe$047$blkdone_ack_val     = blkdone_ack$047_val;
  assign pe$047$blkdone_sig_rdy     = blkdone_sig$047_rdy;
  assign pe$047$clk                 = clk;
  assign pe$047$cm_msg              = cm_msg;
  assign pe$047$cm_val              = cm_val;
  assign pe$047$pe_id_msg           = pe_id$047_msg;
  assign pe$047$pe_id_val           = pe_id$047_val;
  assign pe$047$reset               = reset;
  assign pe$047$xbar_req_rdy        = xbar$005$xbar_req$007_rdy;
  assign pe$047$xbar_resp_msg       = xbar$005$xbar_resp$007_msg;
  assign pe$047$xbar_resp_val       = xbar$005$xbar_resp$007_val;
  assign pe$047$y_unloader_rdy      = y_unloader$047_rdy;
  assign pe$048$a_feeder_in_msg     = pe$040$a_feeder_out_msg;
  assign pe$048$a_feeder_in_val     = pe$040$a_feeder_out_val;
  assign pe$048$a_feeder_out_rdy    = pe$056$a_feeder_in_rdy;
  assign pe$048$blkdone_ack_msg     = blkdone_ack$048_msg;
  assign pe$048$blkdone_ack_val     = blkdone_ack$048_val;
  assign pe$048$blkdone_sig_rdy     = blkdone_sig$048_rdy;
  assign pe$048$clk                 = clk;
  assign pe$048$cm_msg              = cm_msg;
  assign pe$048$cm_val              = cm_val;
  assign pe$048$pe_id_msg           = pe_id$048_msg;
  assign pe$048$pe_id_val           = pe_id$048_val;
  assign pe$048$reset               = reset;
  assign pe$048$xbar_req_rdy        = xbar$006$xbar_req$000_rdy;
  assign pe$048$xbar_resp_msg       = xbar$006$xbar_resp$000_msg;
  assign pe$048$xbar_resp_val       = xbar$006$xbar_resp$000_val;
  assign pe$048$y_unloader_rdy      = y_unloader$048_rdy;
  assign pe$049$a_feeder_in_msg     = pe$041$a_feeder_out_msg;
  assign pe$049$a_feeder_in_val     = pe$041$a_feeder_out_val;
  assign pe$049$a_feeder_out_rdy    = pe$057$a_feeder_in_rdy;
  assign pe$049$blkdone_ack_msg     = blkdone_ack$049_msg;
  assign pe$049$blkdone_ack_val     = blkdone_ack$049_val;
  assign pe$049$blkdone_sig_rdy     = blkdone_sig$049_rdy;
  assign pe$049$clk                 = clk;
  assign pe$049$cm_msg              = cm_msg;
  assign pe$049$cm_val              = cm_val;
  assign pe$049$pe_id_msg           = pe_id$049_msg;
  assign pe$049$pe_id_val           = pe_id$049_val;
  assign pe$049$reset               = reset;
  assign pe$049$xbar_req_rdy        = xbar$006$xbar_req$001_rdy;
  assign pe$049$xbar_resp_msg       = xbar$006$xbar_resp$001_msg;
  assign pe$049$xbar_resp_val       = xbar$006$xbar_resp$001_val;
  assign pe$049$y_unloader_rdy      = y_unloader$049_rdy;
  assign pe$050$a_feeder_in_msg     = pe$042$a_feeder_out_msg;
  assign pe$050$a_feeder_in_val     = pe$042$a_feeder_out_val;
  assign pe$050$a_feeder_out_rdy    = pe$058$a_feeder_in_rdy;
  assign pe$050$blkdone_ack_msg     = blkdone_ack$050_msg;
  assign pe$050$blkdone_ack_val     = blkdone_ack$050_val;
  assign pe$050$blkdone_sig_rdy     = blkdone_sig$050_rdy;
  assign pe$050$clk                 = clk;
  assign pe$050$cm_msg              = cm_msg;
  assign pe$050$cm_val              = cm_val;
  assign pe$050$pe_id_msg           = pe_id$050_msg;
  assign pe$050$pe_id_val           = pe_id$050_val;
  assign pe$050$reset               = reset;
  assign pe$050$xbar_req_rdy        = xbar$006$xbar_req$002_rdy;
  assign pe$050$xbar_resp_msg       = xbar$006$xbar_resp$002_msg;
  assign pe$050$xbar_resp_val       = xbar$006$xbar_resp$002_val;
  assign pe$050$y_unloader_rdy      = y_unloader$050_rdy;
  assign pe$051$a_feeder_in_msg     = pe$043$a_feeder_out_msg;
  assign pe$051$a_feeder_in_val     = pe$043$a_feeder_out_val;
  assign pe$051$a_feeder_out_rdy    = pe$059$a_feeder_in_rdy;
  assign pe$051$blkdone_ack_msg     = blkdone_ack$051_msg;
  assign pe$051$blkdone_ack_val     = blkdone_ack$051_val;
  assign pe$051$blkdone_sig_rdy     = blkdone_sig$051_rdy;
  assign pe$051$clk                 = clk;
  assign pe$051$cm_msg              = cm_msg;
  assign pe$051$cm_val              = cm_val;
  assign pe$051$pe_id_msg           = pe_id$051_msg;
  assign pe$051$pe_id_val           = pe_id$051_val;
  assign pe$051$reset               = reset;
  assign pe$051$xbar_req_rdy        = xbar$006$xbar_req$003_rdy;
  assign pe$051$xbar_resp_msg       = xbar$006$xbar_resp$003_msg;
  assign pe$051$xbar_resp_val       = xbar$006$xbar_resp$003_val;
  assign pe$051$y_unloader_rdy      = y_unloader$051_rdy;
  assign pe$052$a_feeder_in_msg     = pe$044$a_feeder_out_msg;
  assign pe$052$a_feeder_in_val     = pe$044$a_feeder_out_val;
  assign pe$052$a_feeder_out_rdy    = pe$060$a_feeder_in_rdy;
  assign pe$052$blkdone_ack_msg     = blkdone_ack$052_msg;
  assign pe$052$blkdone_ack_val     = blkdone_ack$052_val;
  assign pe$052$blkdone_sig_rdy     = blkdone_sig$052_rdy;
  assign pe$052$clk                 = clk;
  assign pe$052$cm_msg              = cm_msg;
  assign pe$052$cm_val              = cm_val;
  assign pe$052$pe_id_msg           = pe_id$052_msg;
  assign pe$052$pe_id_val           = pe_id$052_val;
  assign pe$052$reset               = reset;
  assign pe$052$xbar_req_rdy        = xbar$006$xbar_req$004_rdy;
  assign pe$052$xbar_resp_msg       = xbar$006$xbar_resp$004_msg;
  assign pe$052$xbar_resp_val       = xbar$006$xbar_resp$004_val;
  assign pe$052$y_unloader_rdy      = y_unloader$052_rdy;
  assign pe$053$a_feeder_in_msg     = pe$045$a_feeder_out_msg;
  assign pe$053$a_feeder_in_val     = pe$045$a_feeder_out_val;
  assign pe$053$a_feeder_out_rdy    = pe$061$a_feeder_in_rdy;
  assign pe$053$blkdone_ack_msg     = blkdone_ack$053_msg;
  assign pe$053$blkdone_ack_val     = blkdone_ack$053_val;
  assign pe$053$blkdone_sig_rdy     = blkdone_sig$053_rdy;
  assign pe$053$clk                 = clk;
  assign pe$053$cm_msg              = cm_msg;
  assign pe$053$cm_val              = cm_val;
  assign pe$053$pe_id_msg           = pe_id$053_msg;
  assign pe$053$pe_id_val           = pe_id$053_val;
  assign pe$053$reset               = reset;
  assign pe$053$xbar_req_rdy        = xbar$006$xbar_req$005_rdy;
  assign pe$053$xbar_resp_msg       = xbar$006$xbar_resp$005_msg;
  assign pe$053$xbar_resp_val       = xbar$006$xbar_resp$005_val;
  assign pe$053$y_unloader_rdy      = y_unloader$053_rdy;
  assign pe$054$a_feeder_in_msg     = pe$046$a_feeder_out_msg;
  assign pe$054$a_feeder_in_val     = pe$046$a_feeder_out_val;
  assign pe$054$a_feeder_out_rdy    = pe$062$a_feeder_in_rdy;
  assign pe$054$blkdone_ack_msg     = blkdone_ack$054_msg;
  assign pe$054$blkdone_ack_val     = blkdone_ack$054_val;
  assign pe$054$blkdone_sig_rdy     = blkdone_sig$054_rdy;
  assign pe$054$clk                 = clk;
  assign pe$054$cm_msg              = cm_msg;
  assign pe$054$cm_val              = cm_val;
  assign pe$054$pe_id_msg           = pe_id$054_msg;
  assign pe$054$pe_id_val           = pe_id$054_val;
  assign pe$054$reset               = reset;
  assign pe$054$xbar_req_rdy        = xbar$006$xbar_req$006_rdy;
  assign pe$054$xbar_resp_msg       = xbar$006$xbar_resp$006_msg;
  assign pe$054$xbar_resp_val       = xbar$006$xbar_resp$006_val;
  assign pe$054$y_unloader_rdy      = y_unloader$054_rdy;
  assign pe$055$a_feeder_in_msg     = pe$047$a_feeder_out_msg;
  assign pe$055$a_feeder_in_val     = pe$047$a_feeder_out_val;
  assign pe$055$a_feeder_out_rdy    = pe$063$a_feeder_in_rdy;
  assign pe$055$blkdone_ack_msg     = blkdone_ack$055_msg;
  assign pe$055$blkdone_ack_val     = blkdone_ack$055_val;
  assign pe$055$blkdone_sig_rdy     = blkdone_sig$055_rdy;
  assign pe$055$clk                 = clk;
  assign pe$055$cm_msg              = cm_msg;
  assign pe$055$cm_val              = cm_val;
  assign pe$055$pe_id_msg           = pe_id$055_msg;
  assign pe$055$pe_id_val           = pe_id$055_val;
  assign pe$055$reset               = reset;
  assign pe$055$xbar_req_rdy        = xbar$006$xbar_req$007_rdy;
  assign pe$055$xbar_resp_msg       = xbar$006$xbar_resp$007_msg;
  assign pe$055$xbar_resp_val       = xbar$006$xbar_resp$007_val;
  assign pe$055$y_unloader_rdy      = y_unloader$055_rdy;
  assign pe$056$a_feeder_in_msg     = pe$048$a_feeder_out_msg;
  assign pe$056$a_feeder_in_val     = pe$048$a_feeder_out_val;
  assign pe$056$a_feeder_out_rdy    = a_feeder_out$000_rdy;
  assign pe$056$blkdone_ack_msg     = blkdone_ack$056_msg;
  assign pe$056$blkdone_ack_val     = blkdone_ack$056_val;
  assign pe$056$blkdone_sig_rdy     = blkdone_sig$056_rdy;
  assign pe$056$clk                 = clk;
  assign pe$056$cm_msg              = cm_msg;
  assign pe$056$cm_val              = cm_val;
  assign pe$056$pe_id_msg           = pe_id$056_msg;
  assign pe$056$pe_id_val           = pe_id$056_val;
  assign pe$056$reset               = reset;
  assign pe$056$xbar_req_rdy        = xbar$007$xbar_req$000_rdy;
  assign pe$056$xbar_resp_msg       = xbar$007$xbar_resp$000_msg;
  assign pe$056$xbar_resp_val       = xbar$007$xbar_resp$000_val;
  assign pe$056$y_unloader_rdy      = y_unloader$056_rdy;
  assign pe$057$a_feeder_in_msg     = pe$049$a_feeder_out_msg;
  assign pe$057$a_feeder_in_val     = pe$049$a_feeder_out_val;
  assign pe$057$a_feeder_out_rdy    = a_feeder_out$001_rdy;
  assign pe$057$blkdone_ack_msg     = blkdone_ack$057_msg;
  assign pe$057$blkdone_ack_val     = blkdone_ack$057_val;
  assign pe$057$blkdone_sig_rdy     = blkdone_sig$057_rdy;
  assign pe$057$clk                 = clk;
  assign pe$057$cm_msg              = cm_msg;
  assign pe$057$cm_val              = cm_val;
  assign pe$057$pe_id_msg           = pe_id$057_msg;
  assign pe$057$pe_id_val           = pe_id$057_val;
  assign pe$057$reset               = reset;
  assign pe$057$xbar_req_rdy        = xbar$007$xbar_req$001_rdy;
  assign pe$057$xbar_resp_msg       = xbar$007$xbar_resp$001_msg;
  assign pe$057$xbar_resp_val       = xbar$007$xbar_resp$001_val;
  assign pe$057$y_unloader_rdy      = y_unloader$057_rdy;
  assign pe$058$a_feeder_in_msg     = pe$050$a_feeder_out_msg;
  assign pe$058$a_feeder_in_val     = pe$050$a_feeder_out_val;
  assign pe$058$a_feeder_out_rdy    = a_feeder_out$002_rdy;
  assign pe$058$blkdone_ack_msg     = blkdone_ack$058_msg;
  assign pe$058$blkdone_ack_val     = blkdone_ack$058_val;
  assign pe$058$blkdone_sig_rdy     = blkdone_sig$058_rdy;
  assign pe$058$clk                 = clk;
  assign pe$058$cm_msg              = cm_msg;
  assign pe$058$cm_val              = cm_val;
  assign pe$058$pe_id_msg           = pe_id$058_msg;
  assign pe$058$pe_id_val           = pe_id$058_val;
  assign pe$058$reset               = reset;
  assign pe$058$xbar_req_rdy        = xbar$007$xbar_req$002_rdy;
  assign pe$058$xbar_resp_msg       = xbar$007$xbar_resp$002_msg;
  assign pe$058$xbar_resp_val       = xbar$007$xbar_resp$002_val;
  assign pe$058$y_unloader_rdy      = y_unloader$058_rdy;
  assign pe$059$a_feeder_in_msg     = pe$051$a_feeder_out_msg;
  assign pe$059$a_feeder_in_val     = pe$051$a_feeder_out_val;
  assign pe$059$a_feeder_out_rdy    = a_feeder_out$003_rdy;
  assign pe$059$blkdone_ack_msg     = blkdone_ack$059_msg;
  assign pe$059$blkdone_ack_val     = blkdone_ack$059_val;
  assign pe$059$blkdone_sig_rdy     = blkdone_sig$059_rdy;
  assign pe$059$clk                 = clk;
  assign pe$059$cm_msg              = cm_msg;
  assign pe$059$cm_val              = cm_val;
  assign pe$059$pe_id_msg           = pe_id$059_msg;
  assign pe$059$pe_id_val           = pe_id$059_val;
  assign pe$059$reset               = reset;
  assign pe$059$xbar_req_rdy        = xbar$007$xbar_req$003_rdy;
  assign pe$059$xbar_resp_msg       = xbar$007$xbar_resp$003_msg;
  assign pe$059$xbar_resp_val       = xbar$007$xbar_resp$003_val;
  assign pe$059$y_unloader_rdy      = y_unloader$059_rdy;
  assign pe$060$a_feeder_in_msg     = pe$052$a_feeder_out_msg;
  assign pe$060$a_feeder_in_val     = pe$052$a_feeder_out_val;
  assign pe$060$a_feeder_out_rdy    = a_feeder_out$004_rdy;
  assign pe$060$blkdone_ack_msg     = blkdone_ack$060_msg;
  assign pe$060$blkdone_ack_val     = blkdone_ack$060_val;
  assign pe$060$blkdone_sig_rdy     = blkdone_sig$060_rdy;
  assign pe$060$clk                 = clk;
  assign pe$060$cm_msg              = cm_msg;
  assign pe$060$cm_val              = cm_val;
  assign pe$060$pe_id_msg           = pe_id$060_msg;
  assign pe$060$pe_id_val           = pe_id$060_val;
  assign pe$060$reset               = reset;
  assign pe$060$xbar_req_rdy        = xbar$007$xbar_req$004_rdy;
  assign pe$060$xbar_resp_msg       = xbar$007$xbar_resp$004_msg;
  assign pe$060$xbar_resp_val       = xbar$007$xbar_resp$004_val;
  assign pe$060$y_unloader_rdy      = y_unloader$060_rdy;
  assign pe$061$a_feeder_in_msg     = pe$053$a_feeder_out_msg;
  assign pe$061$a_feeder_in_val     = pe$053$a_feeder_out_val;
  assign pe$061$a_feeder_out_rdy    = a_feeder_out$005_rdy;
  assign pe$061$blkdone_ack_msg     = blkdone_ack$061_msg;
  assign pe$061$blkdone_ack_val     = blkdone_ack$061_val;
  assign pe$061$blkdone_sig_rdy     = blkdone_sig$061_rdy;
  assign pe$061$clk                 = clk;
  assign pe$061$cm_msg              = cm_msg;
  assign pe$061$cm_val              = cm_val;
  assign pe$061$pe_id_msg           = pe_id$061_msg;
  assign pe$061$pe_id_val           = pe_id$061_val;
  assign pe$061$reset               = reset;
  assign pe$061$xbar_req_rdy        = xbar$007$xbar_req$005_rdy;
  assign pe$061$xbar_resp_msg       = xbar$007$xbar_resp$005_msg;
  assign pe$061$xbar_resp_val       = xbar$007$xbar_resp$005_val;
  assign pe$061$y_unloader_rdy      = y_unloader$061_rdy;
  assign pe$062$a_feeder_in_msg     = pe$054$a_feeder_out_msg;
  assign pe$062$a_feeder_in_val     = pe$054$a_feeder_out_val;
  assign pe$062$a_feeder_out_rdy    = a_feeder_out$006_rdy;
  assign pe$062$blkdone_ack_msg     = blkdone_ack$062_msg;
  assign pe$062$blkdone_ack_val     = blkdone_ack$062_val;
  assign pe$062$blkdone_sig_rdy     = blkdone_sig$062_rdy;
  assign pe$062$clk                 = clk;
  assign pe$062$cm_msg              = cm_msg;
  assign pe$062$cm_val              = cm_val;
  assign pe$062$pe_id_msg           = pe_id$062_msg;
  assign pe$062$pe_id_val           = pe_id$062_val;
  assign pe$062$reset               = reset;
  assign pe$062$xbar_req_rdy        = xbar$007$xbar_req$006_rdy;
  assign pe$062$xbar_resp_msg       = xbar$007$xbar_resp$006_msg;
  assign pe$062$xbar_resp_val       = xbar$007$xbar_resp$006_val;
  assign pe$062$y_unloader_rdy      = y_unloader$062_rdy;
  assign pe$063$a_feeder_in_msg     = pe$055$a_feeder_out_msg;
  assign pe$063$a_feeder_in_val     = pe$055$a_feeder_out_val;
  assign pe$063$a_feeder_out_rdy    = a_feeder_out$007_rdy;
  assign pe$063$blkdone_ack_msg     = blkdone_ack$063_msg;
  assign pe$063$blkdone_ack_val     = blkdone_ack$063_val;
  assign pe$063$blkdone_sig_rdy     = blkdone_sig$063_rdy;
  assign pe$063$clk                 = clk;
  assign pe$063$cm_msg              = cm_msg;
  assign pe$063$cm_val              = cm_val;
  assign pe$063$pe_id_msg           = pe_id$063_msg;
  assign pe$063$pe_id_val           = pe_id$063_val;
  assign pe$063$reset               = reset;
  assign pe$063$xbar_req_rdy        = xbar$007$xbar_req$007_rdy;
  assign pe$063$xbar_resp_msg       = xbar$007$xbar_resp$007_msg;
  assign pe$063$xbar_resp_val       = xbar$007$xbar_resp$007_val;
  assign pe$063$y_unloader_rdy      = y_unloader$063_rdy;
  assign pe_id$000_rdy              = pe$000$pe_id_rdy;
  assign pe_id$001_rdy              = pe$001$pe_id_rdy;
  assign pe_id$002_rdy              = pe$002$pe_id_rdy;
  assign pe_id$003_rdy              = pe$003$pe_id_rdy;
  assign pe_id$004_rdy              = pe$004$pe_id_rdy;
  assign pe_id$005_rdy              = pe$005$pe_id_rdy;
  assign pe_id$006_rdy              = pe$006$pe_id_rdy;
  assign pe_id$007_rdy              = pe$007$pe_id_rdy;
  assign pe_id$008_rdy              = pe$008$pe_id_rdy;
  assign pe_id$009_rdy              = pe$009$pe_id_rdy;
  assign pe_id$010_rdy              = pe$010$pe_id_rdy;
  assign pe_id$011_rdy              = pe$011$pe_id_rdy;
  assign pe_id$012_rdy              = pe$012$pe_id_rdy;
  assign pe_id$013_rdy              = pe$013$pe_id_rdy;
  assign pe_id$014_rdy              = pe$014$pe_id_rdy;
  assign pe_id$015_rdy              = pe$015$pe_id_rdy;
  assign pe_id$016_rdy              = pe$016$pe_id_rdy;
  assign pe_id$017_rdy              = pe$017$pe_id_rdy;
  assign pe_id$018_rdy              = pe$018$pe_id_rdy;
  assign pe_id$019_rdy              = pe$019$pe_id_rdy;
  assign pe_id$020_rdy              = pe$020$pe_id_rdy;
  assign pe_id$021_rdy              = pe$021$pe_id_rdy;
  assign pe_id$022_rdy              = pe$022$pe_id_rdy;
  assign pe_id$023_rdy              = pe$023$pe_id_rdy;
  assign pe_id$024_rdy              = pe$024$pe_id_rdy;
  assign pe_id$025_rdy              = pe$025$pe_id_rdy;
  assign pe_id$026_rdy              = pe$026$pe_id_rdy;
  assign pe_id$027_rdy              = pe$027$pe_id_rdy;
  assign pe_id$028_rdy              = pe$028$pe_id_rdy;
  assign pe_id$029_rdy              = pe$029$pe_id_rdy;
  assign pe_id$030_rdy              = pe$030$pe_id_rdy;
  assign pe_id$031_rdy              = pe$031$pe_id_rdy;
  assign pe_id$032_rdy              = pe$032$pe_id_rdy;
  assign pe_id$033_rdy              = pe$033$pe_id_rdy;
  assign pe_id$034_rdy              = pe$034$pe_id_rdy;
  assign pe_id$035_rdy              = pe$035$pe_id_rdy;
  assign pe_id$036_rdy              = pe$036$pe_id_rdy;
  assign pe_id$037_rdy              = pe$037$pe_id_rdy;
  assign pe_id$038_rdy              = pe$038$pe_id_rdy;
  assign pe_id$039_rdy              = pe$039$pe_id_rdy;
  assign pe_id$040_rdy              = pe$040$pe_id_rdy;
  assign pe_id$041_rdy              = pe$041$pe_id_rdy;
  assign pe_id$042_rdy              = pe$042$pe_id_rdy;
  assign pe_id$043_rdy              = pe$043$pe_id_rdy;
  assign pe_id$044_rdy              = pe$044$pe_id_rdy;
  assign pe_id$045_rdy              = pe$045$pe_id_rdy;
  assign pe_id$046_rdy              = pe$046$pe_id_rdy;
  assign pe_id$047_rdy              = pe$047$pe_id_rdy;
  assign pe_id$048_rdy              = pe$048$pe_id_rdy;
  assign pe_id$049_rdy              = pe$049$pe_id_rdy;
  assign pe_id$050_rdy              = pe$050$pe_id_rdy;
  assign pe_id$051_rdy              = pe$051$pe_id_rdy;
  assign pe_id$052_rdy              = pe$052$pe_id_rdy;
  assign pe_id$053_rdy              = pe$053$pe_id_rdy;
  assign pe_id$054_rdy              = pe$054$pe_id_rdy;
  assign pe_id$055_rdy              = pe$055$pe_id_rdy;
  assign pe_id$056_rdy              = pe$056$pe_id_rdy;
  assign pe_id$057_rdy              = pe$057$pe_id_rdy;
  assign pe_id$058_rdy              = pe$058$pe_id_rdy;
  assign pe_id$059_rdy              = pe$059$pe_id_rdy;
  assign pe_id$060_rdy              = pe$060$pe_id_rdy;
  assign pe_id$061_rdy              = pe$061$pe_id_rdy;
  assign pe_id$062_rdy              = pe$062$pe_id_rdy;
  assign pe_id$063_rdy              = pe$063$pe_id_rdy;
  assign xbar$000$bank_req$000_rdy  = xbar_bank_req$000_rdy;
  assign xbar$000$bank_req$001_rdy  = xbar_bank_req$001_rdy;
  assign xbar$000$bank_req$002_rdy  = xbar_bank_req$002_rdy;
  assign xbar$000$bank_req$003_rdy  = xbar_bank_req$003_rdy;
  assign xbar$000$bank_req$004_rdy  = xbar_bank_req$004_rdy;
  assign xbar$000$bank_req$005_rdy  = xbar_bank_req$005_rdy;
  assign xbar$000$bank_req$006_rdy  = xbar_bank_req$006_rdy;
  assign xbar$000$bank_req$007_rdy  = xbar_bank_req$007_rdy;
  assign xbar$000$bank_resp$000_msg = xbar_bank_resp$000_msg;
  assign xbar$000$bank_resp$000_val = xbar_bank_resp$000_val;
  assign xbar$000$bank_resp$001_msg = xbar_bank_resp$001_msg;
  assign xbar$000$bank_resp$001_val = xbar_bank_resp$001_val;
  assign xbar$000$bank_resp$002_msg = xbar_bank_resp$002_msg;
  assign xbar$000$bank_resp$002_val = xbar_bank_resp$002_val;
  assign xbar$000$bank_resp$003_msg = xbar_bank_resp$003_msg;
  assign xbar$000$bank_resp$003_val = xbar_bank_resp$003_val;
  assign xbar$000$bank_resp$004_msg = xbar_bank_resp$004_msg;
  assign xbar$000$bank_resp$004_val = xbar_bank_resp$004_val;
  assign xbar$000$bank_resp$005_msg = xbar_bank_resp$005_msg;
  assign xbar$000$bank_resp$005_val = xbar_bank_resp$005_val;
  assign xbar$000$bank_resp$006_msg = xbar_bank_resp$006_msg;
  assign xbar$000$bank_resp$006_val = xbar_bank_resp$006_val;
  assign xbar$000$bank_resp$007_msg = xbar_bank_resp$007_msg;
  assign xbar$000$bank_resp$007_val = xbar_bank_resp$007_val;
  assign xbar$000$clk               = clk;
  assign xbar$000$reset             = reset;
  assign xbar$000$xbar_req$000_msg  = pe$000$xbar_req_msg;
  assign xbar$000$xbar_req$000_val  = pe$000$xbar_req_val;
  assign xbar$000$xbar_req$001_msg  = pe$001$xbar_req_msg;
  assign xbar$000$xbar_req$001_val  = pe$001$xbar_req_val;
  assign xbar$000$xbar_req$002_msg  = pe$002$xbar_req_msg;
  assign xbar$000$xbar_req$002_val  = pe$002$xbar_req_val;
  assign xbar$000$xbar_req$003_msg  = pe$003$xbar_req_msg;
  assign xbar$000$xbar_req$003_val  = pe$003$xbar_req_val;
  assign xbar$000$xbar_req$004_msg  = pe$004$xbar_req_msg;
  assign xbar$000$xbar_req$004_val  = pe$004$xbar_req_val;
  assign xbar$000$xbar_req$005_msg  = pe$005$xbar_req_msg;
  assign xbar$000$xbar_req$005_val  = pe$005$xbar_req_val;
  assign xbar$000$xbar_req$006_msg  = pe$006$xbar_req_msg;
  assign xbar$000$xbar_req$006_val  = pe$006$xbar_req_val;
  assign xbar$000$xbar_req$007_msg  = pe$007$xbar_req_msg;
  assign xbar$000$xbar_req$007_val  = pe$007$xbar_req_val;
  assign xbar$000$xbar_resp$000_rdy = pe$000$xbar_resp_rdy;
  assign xbar$000$xbar_resp$001_rdy = pe$001$xbar_resp_rdy;
  assign xbar$000$xbar_resp$002_rdy = pe$002$xbar_resp_rdy;
  assign xbar$000$xbar_resp$003_rdy = pe$003$xbar_resp_rdy;
  assign xbar$000$xbar_resp$004_rdy = pe$004$xbar_resp_rdy;
  assign xbar$000$xbar_resp$005_rdy = pe$005$xbar_resp_rdy;
  assign xbar$000$xbar_resp$006_rdy = pe$006$xbar_resp_rdy;
  assign xbar$000$xbar_resp$007_rdy = pe$007$xbar_resp_rdy;
  assign xbar$001$bank_req$000_rdy  = xbar_bank_req$008_rdy;
  assign xbar$001$bank_req$001_rdy  = xbar_bank_req$009_rdy;
  assign xbar$001$bank_req$002_rdy  = xbar_bank_req$010_rdy;
  assign xbar$001$bank_req$003_rdy  = xbar_bank_req$011_rdy;
  assign xbar$001$bank_req$004_rdy  = xbar_bank_req$012_rdy;
  assign xbar$001$bank_req$005_rdy  = xbar_bank_req$013_rdy;
  assign xbar$001$bank_req$006_rdy  = xbar_bank_req$014_rdy;
  assign xbar$001$bank_req$007_rdy  = xbar_bank_req$015_rdy;
  assign xbar$001$bank_resp$000_msg = xbar_bank_resp$008_msg;
  assign xbar$001$bank_resp$000_val = xbar_bank_resp$008_val;
  assign xbar$001$bank_resp$001_msg = xbar_bank_resp$009_msg;
  assign xbar$001$bank_resp$001_val = xbar_bank_resp$009_val;
  assign xbar$001$bank_resp$002_msg = xbar_bank_resp$010_msg;
  assign xbar$001$bank_resp$002_val = xbar_bank_resp$010_val;
  assign xbar$001$bank_resp$003_msg = xbar_bank_resp$011_msg;
  assign xbar$001$bank_resp$003_val = xbar_bank_resp$011_val;
  assign xbar$001$bank_resp$004_msg = xbar_bank_resp$012_msg;
  assign xbar$001$bank_resp$004_val = xbar_bank_resp$012_val;
  assign xbar$001$bank_resp$005_msg = xbar_bank_resp$013_msg;
  assign xbar$001$bank_resp$005_val = xbar_bank_resp$013_val;
  assign xbar$001$bank_resp$006_msg = xbar_bank_resp$014_msg;
  assign xbar$001$bank_resp$006_val = xbar_bank_resp$014_val;
  assign xbar$001$bank_resp$007_msg = xbar_bank_resp$015_msg;
  assign xbar$001$bank_resp$007_val = xbar_bank_resp$015_val;
  assign xbar$001$clk               = clk;
  assign xbar$001$reset             = reset;
  assign xbar$001$xbar_req$000_msg  = pe$008$xbar_req_msg;
  assign xbar$001$xbar_req$000_val  = pe$008$xbar_req_val;
  assign xbar$001$xbar_req$001_msg  = pe$009$xbar_req_msg;
  assign xbar$001$xbar_req$001_val  = pe$009$xbar_req_val;
  assign xbar$001$xbar_req$002_msg  = pe$010$xbar_req_msg;
  assign xbar$001$xbar_req$002_val  = pe$010$xbar_req_val;
  assign xbar$001$xbar_req$003_msg  = pe$011$xbar_req_msg;
  assign xbar$001$xbar_req$003_val  = pe$011$xbar_req_val;
  assign xbar$001$xbar_req$004_msg  = pe$012$xbar_req_msg;
  assign xbar$001$xbar_req$004_val  = pe$012$xbar_req_val;
  assign xbar$001$xbar_req$005_msg  = pe$013$xbar_req_msg;
  assign xbar$001$xbar_req$005_val  = pe$013$xbar_req_val;
  assign xbar$001$xbar_req$006_msg  = pe$014$xbar_req_msg;
  assign xbar$001$xbar_req$006_val  = pe$014$xbar_req_val;
  assign xbar$001$xbar_req$007_msg  = pe$015$xbar_req_msg;
  assign xbar$001$xbar_req$007_val  = pe$015$xbar_req_val;
  assign xbar$001$xbar_resp$000_rdy = pe$008$xbar_resp_rdy;
  assign xbar$001$xbar_resp$001_rdy = pe$009$xbar_resp_rdy;
  assign xbar$001$xbar_resp$002_rdy = pe$010$xbar_resp_rdy;
  assign xbar$001$xbar_resp$003_rdy = pe$011$xbar_resp_rdy;
  assign xbar$001$xbar_resp$004_rdy = pe$012$xbar_resp_rdy;
  assign xbar$001$xbar_resp$005_rdy = pe$013$xbar_resp_rdy;
  assign xbar$001$xbar_resp$006_rdy = pe$014$xbar_resp_rdy;
  assign xbar$001$xbar_resp$007_rdy = pe$015$xbar_resp_rdy;
  assign xbar$002$bank_req$000_rdy  = xbar_bank_req$016_rdy;
  assign xbar$002$bank_req$001_rdy  = xbar_bank_req$017_rdy;
  assign xbar$002$bank_req$002_rdy  = xbar_bank_req$018_rdy;
  assign xbar$002$bank_req$003_rdy  = xbar_bank_req$019_rdy;
  assign xbar$002$bank_req$004_rdy  = xbar_bank_req$020_rdy;
  assign xbar$002$bank_req$005_rdy  = xbar_bank_req$021_rdy;
  assign xbar$002$bank_req$006_rdy  = xbar_bank_req$022_rdy;
  assign xbar$002$bank_req$007_rdy  = xbar_bank_req$023_rdy;
  assign xbar$002$bank_resp$000_msg = xbar_bank_resp$016_msg;
  assign xbar$002$bank_resp$000_val = xbar_bank_resp$016_val;
  assign xbar$002$bank_resp$001_msg = xbar_bank_resp$017_msg;
  assign xbar$002$bank_resp$001_val = xbar_bank_resp$017_val;
  assign xbar$002$bank_resp$002_msg = xbar_bank_resp$018_msg;
  assign xbar$002$bank_resp$002_val = xbar_bank_resp$018_val;
  assign xbar$002$bank_resp$003_msg = xbar_bank_resp$019_msg;
  assign xbar$002$bank_resp$003_val = xbar_bank_resp$019_val;
  assign xbar$002$bank_resp$004_msg = xbar_bank_resp$020_msg;
  assign xbar$002$bank_resp$004_val = xbar_bank_resp$020_val;
  assign xbar$002$bank_resp$005_msg = xbar_bank_resp$021_msg;
  assign xbar$002$bank_resp$005_val = xbar_bank_resp$021_val;
  assign xbar$002$bank_resp$006_msg = xbar_bank_resp$022_msg;
  assign xbar$002$bank_resp$006_val = xbar_bank_resp$022_val;
  assign xbar$002$bank_resp$007_msg = xbar_bank_resp$023_msg;
  assign xbar$002$bank_resp$007_val = xbar_bank_resp$023_val;
  assign xbar$002$clk               = clk;
  assign xbar$002$reset             = reset;
  assign xbar$002$xbar_req$000_msg  = pe$016$xbar_req_msg;
  assign xbar$002$xbar_req$000_val  = pe$016$xbar_req_val;
  assign xbar$002$xbar_req$001_msg  = pe$017$xbar_req_msg;
  assign xbar$002$xbar_req$001_val  = pe$017$xbar_req_val;
  assign xbar$002$xbar_req$002_msg  = pe$018$xbar_req_msg;
  assign xbar$002$xbar_req$002_val  = pe$018$xbar_req_val;
  assign xbar$002$xbar_req$003_msg  = pe$019$xbar_req_msg;
  assign xbar$002$xbar_req$003_val  = pe$019$xbar_req_val;
  assign xbar$002$xbar_req$004_msg  = pe$020$xbar_req_msg;
  assign xbar$002$xbar_req$004_val  = pe$020$xbar_req_val;
  assign xbar$002$xbar_req$005_msg  = pe$021$xbar_req_msg;
  assign xbar$002$xbar_req$005_val  = pe$021$xbar_req_val;
  assign xbar$002$xbar_req$006_msg  = pe$022$xbar_req_msg;
  assign xbar$002$xbar_req$006_val  = pe$022$xbar_req_val;
  assign xbar$002$xbar_req$007_msg  = pe$023$xbar_req_msg;
  assign xbar$002$xbar_req$007_val  = pe$023$xbar_req_val;
  assign xbar$002$xbar_resp$000_rdy = pe$016$xbar_resp_rdy;
  assign xbar$002$xbar_resp$001_rdy = pe$017$xbar_resp_rdy;
  assign xbar$002$xbar_resp$002_rdy = pe$018$xbar_resp_rdy;
  assign xbar$002$xbar_resp$003_rdy = pe$019$xbar_resp_rdy;
  assign xbar$002$xbar_resp$004_rdy = pe$020$xbar_resp_rdy;
  assign xbar$002$xbar_resp$005_rdy = pe$021$xbar_resp_rdy;
  assign xbar$002$xbar_resp$006_rdy = pe$022$xbar_resp_rdy;
  assign xbar$002$xbar_resp$007_rdy = pe$023$xbar_resp_rdy;
  assign xbar$003$bank_req$000_rdy  = xbar_bank_req$024_rdy;
  assign xbar$003$bank_req$001_rdy  = xbar_bank_req$025_rdy;
  assign xbar$003$bank_req$002_rdy  = xbar_bank_req$026_rdy;
  assign xbar$003$bank_req$003_rdy  = xbar_bank_req$027_rdy;
  assign xbar$003$bank_req$004_rdy  = xbar_bank_req$028_rdy;
  assign xbar$003$bank_req$005_rdy  = xbar_bank_req$029_rdy;
  assign xbar$003$bank_req$006_rdy  = xbar_bank_req$030_rdy;
  assign xbar$003$bank_req$007_rdy  = xbar_bank_req$031_rdy;
  assign xbar$003$bank_resp$000_msg = xbar_bank_resp$024_msg;
  assign xbar$003$bank_resp$000_val = xbar_bank_resp$024_val;
  assign xbar$003$bank_resp$001_msg = xbar_bank_resp$025_msg;
  assign xbar$003$bank_resp$001_val = xbar_bank_resp$025_val;
  assign xbar$003$bank_resp$002_msg = xbar_bank_resp$026_msg;
  assign xbar$003$bank_resp$002_val = xbar_bank_resp$026_val;
  assign xbar$003$bank_resp$003_msg = xbar_bank_resp$027_msg;
  assign xbar$003$bank_resp$003_val = xbar_bank_resp$027_val;
  assign xbar$003$bank_resp$004_msg = xbar_bank_resp$028_msg;
  assign xbar$003$bank_resp$004_val = xbar_bank_resp$028_val;
  assign xbar$003$bank_resp$005_msg = xbar_bank_resp$029_msg;
  assign xbar$003$bank_resp$005_val = xbar_bank_resp$029_val;
  assign xbar$003$bank_resp$006_msg = xbar_bank_resp$030_msg;
  assign xbar$003$bank_resp$006_val = xbar_bank_resp$030_val;
  assign xbar$003$bank_resp$007_msg = xbar_bank_resp$031_msg;
  assign xbar$003$bank_resp$007_val = xbar_bank_resp$031_val;
  assign xbar$003$clk               = clk;
  assign xbar$003$reset             = reset;
  assign xbar$003$xbar_req$000_msg  = pe$024$xbar_req_msg;
  assign xbar$003$xbar_req$000_val  = pe$024$xbar_req_val;
  assign xbar$003$xbar_req$001_msg  = pe$025$xbar_req_msg;
  assign xbar$003$xbar_req$001_val  = pe$025$xbar_req_val;
  assign xbar$003$xbar_req$002_msg  = pe$026$xbar_req_msg;
  assign xbar$003$xbar_req$002_val  = pe$026$xbar_req_val;
  assign xbar$003$xbar_req$003_msg  = pe$027$xbar_req_msg;
  assign xbar$003$xbar_req$003_val  = pe$027$xbar_req_val;
  assign xbar$003$xbar_req$004_msg  = pe$028$xbar_req_msg;
  assign xbar$003$xbar_req$004_val  = pe$028$xbar_req_val;
  assign xbar$003$xbar_req$005_msg  = pe$029$xbar_req_msg;
  assign xbar$003$xbar_req$005_val  = pe$029$xbar_req_val;
  assign xbar$003$xbar_req$006_msg  = pe$030$xbar_req_msg;
  assign xbar$003$xbar_req$006_val  = pe$030$xbar_req_val;
  assign xbar$003$xbar_req$007_msg  = pe$031$xbar_req_msg;
  assign xbar$003$xbar_req$007_val  = pe$031$xbar_req_val;
  assign xbar$003$xbar_resp$000_rdy = pe$024$xbar_resp_rdy;
  assign xbar$003$xbar_resp$001_rdy = pe$025$xbar_resp_rdy;
  assign xbar$003$xbar_resp$002_rdy = pe$026$xbar_resp_rdy;
  assign xbar$003$xbar_resp$003_rdy = pe$027$xbar_resp_rdy;
  assign xbar$003$xbar_resp$004_rdy = pe$028$xbar_resp_rdy;
  assign xbar$003$xbar_resp$005_rdy = pe$029$xbar_resp_rdy;
  assign xbar$003$xbar_resp$006_rdy = pe$030$xbar_resp_rdy;
  assign xbar$003$xbar_resp$007_rdy = pe$031$xbar_resp_rdy;
  assign xbar$004$bank_req$000_rdy  = xbar_bank_req$032_rdy;
  assign xbar$004$bank_req$001_rdy  = xbar_bank_req$033_rdy;
  assign xbar$004$bank_req$002_rdy  = xbar_bank_req$034_rdy;
  assign xbar$004$bank_req$003_rdy  = xbar_bank_req$035_rdy;
  assign xbar$004$bank_req$004_rdy  = xbar_bank_req$036_rdy;
  assign xbar$004$bank_req$005_rdy  = xbar_bank_req$037_rdy;
  assign xbar$004$bank_req$006_rdy  = xbar_bank_req$038_rdy;
  assign xbar$004$bank_req$007_rdy  = xbar_bank_req$039_rdy;
  assign xbar$004$bank_resp$000_msg = xbar_bank_resp$032_msg;
  assign xbar$004$bank_resp$000_val = xbar_bank_resp$032_val;
  assign xbar$004$bank_resp$001_msg = xbar_bank_resp$033_msg;
  assign xbar$004$bank_resp$001_val = xbar_bank_resp$033_val;
  assign xbar$004$bank_resp$002_msg = xbar_bank_resp$034_msg;
  assign xbar$004$bank_resp$002_val = xbar_bank_resp$034_val;
  assign xbar$004$bank_resp$003_msg = xbar_bank_resp$035_msg;
  assign xbar$004$bank_resp$003_val = xbar_bank_resp$035_val;
  assign xbar$004$bank_resp$004_msg = xbar_bank_resp$036_msg;
  assign xbar$004$bank_resp$004_val = xbar_bank_resp$036_val;
  assign xbar$004$bank_resp$005_msg = xbar_bank_resp$037_msg;
  assign xbar$004$bank_resp$005_val = xbar_bank_resp$037_val;
  assign xbar$004$bank_resp$006_msg = xbar_bank_resp$038_msg;
  assign xbar$004$bank_resp$006_val = xbar_bank_resp$038_val;
  assign xbar$004$bank_resp$007_msg = xbar_bank_resp$039_msg;
  assign xbar$004$bank_resp$007_val = xbar_bank_resp$039_val;
  assign xbar$004$clk               = clk;
  assign xbar$004$reset             = reset;
  assign xbar$004$xbar_req$000_msg  = pe$032$xbar_req_msg;
  assign xbar$004$xbar_req$000_val  = pe$032$xbar_req_val;
  assign xbar$004$xbar_req$001_msg  = pe$033$xbar_req_msg;
  assign xbar$004$xbar_req$001_val  = pe$033$xbar_req_val;
  assign xbar$004$xbar_req$002_msg  = pe$034$xbar_req_msg;
  assign xbar$004$xbar_req$002_val  = pe$034$xbar_req_val;
  assign xbar$004$xbar_req$003_msg  = pe$035$xbar_req_msg;
  assign xbar$004$xbar_req$003_val  = pe$035$xbar_req_val;
  assign xbar$004$xbar_req$004_msg  = pe$036$xbar_req_msg;
  assign xbar$004$xbar_req$004_val  = pe$036$xbar_req_val;
  assign xbar$004$xbar_req$005_msg  = pe$037$xbar_req_msg;
  assign xbar$004$xbar_req$005_val  = pe$037$xbar_req_val;
  assign xbar$004$xbar_req$006_msg  = pe$038$xbar_req_msg;
  assign xbar$004$xbar_req$006_val  = pe$038$xbar_req_val;
  assign xbar$004$xbar_req$007_msg  = pe$039$xbar_req_msg;
  assign xbar$004$xbar_req$007_val  = pe$039$xbar_req_val;
  assign xbar$004$xbar_resp$000_rdy = pe$032$xbar_resp_rdy;
  assign xbar$004$xbar_resp$001_rdy = pe$033$xbar_resp_rdy;
  assign xbar$004$xbar_resp$002_rdy = pe$034$xbar_resp_rdy;
  assign xbar$004$xbar_resp$003_rdy = pe$035$xbar_resp_rdy;
  assign xbar$004$xbar_resp$004_rdy = pe$036$xbar_resp_rdy;
  assign xbar$004$xbar_resp$005_rdy = pe$037$xbar_resp_rdy;
  assign xbar$004$xbar_resp$006_rdy = pe$038$xbar_resp_rdy;
  assign xbar$004$xbar_resp$007_rdy = pe$039$xbar_resp_rdy;
  assign xbar$005$bank_req$000_rdy  = xbar_bank_req$040_rdy;
  assign xbar$005$bank_req$001_rdy  = xbar_bank_req$041_rdy;
  assign xbar$005$bank_req$002_rdy  = xbar_bank_req$042_rdy;
  assign xbar$005$bank_req$003_rdy  = xbar_bank_req$043_rdy;
  assign xbar$005$bank_req$004_rdy  = xbar_bank_req$044_rdy;
  assign xbar$005$bank_req$005_rdy  = xbar_bank_req$045_rdy;
  assign xbar$005$bank_req$006_rdy  = xbar_bank_req$046_rdy;
  assign xbar$005$bank_req$007_rdy  = xbar_bank_req$047_rdy;
  assign xbar$005$bank_resp$000_msg = xbar_bank_resp$040_msg;
  assign xbar$005$bank_resp$000_val = xbar_bank_resp$040_val;
  assign xbar$005$bank_resp$001_msg = xbar_bank_resp$041_msg;
  assign xbar$005$bank_resp$001_val = xbar_bank_resp$041_val;
  assign xbar$005$bank_resp$002_msg = xbar_bank_resp$042_msg;
  assign xbar$005$bank_resp$002_val = xbar_bank_resp$042_val;
  assign xbar$005$bank_resp$003_msg = xbar_bank_resp$043_msg;
  assign xbar$005$bank_resp$003_val = xbar_bank_resp$043_val;
  assign xbar$005$bank_resp$004_msg = xbar_bank_resp$044_msg;
  assign xbar$005$bank_resp$004_val = xbar_bank_resp$044_val;
  assign xbar$005$bank_resp$005_msg = xbar_bank_resp$045_msg;
  assign xbar$005$bank_resp$005_val = xbar_bank_resp$045_val;
  assign xbar$005$bank_resp$006_msg = xbar_bank_resp$046_msg;
  assign xbar$005$bank_resp$006_val = xbar_bank_resp$046_val;
  assign xbar$005$bank_resp$007_msg = xbar_bank_resp$047_msg;
  assign xbar$005$bank_resp$007_val = xbar_bank_resp$047_val;
  assign xbar$005$clk               = clk;
  assign xbar$005$reset             = reset;
  assign xbar$005$xbar_req$000_msg  = pe$040$xbar_req_msg;
  assign xbar$005$xbar_req$000_val  = pe$040$xbar_req_val;
  assign xbar$005$xbar_req$001_msg  = pe$041$xbar_req_msg;
  assign xbar$005$xbar_req$001_val  = pe$041$xbar_req_val;
  assign xbar$005$xbar_req$002_msg  = pe$042$xbar_req_msg;
  assign xbar$005$xbar_req$002_val  = pe$042$xbar_req_val;
  assign xbar$005$xbar_req$003_msg  = pe$043$xbar_req_msg;
  assign xbar$005$xbar_req$003_val  = pe$043$xbar_req_val;
  assign xbar$005$xbar_req$004_msg  = pe$044$xbar_req_msg;
  assign xbar$005$xbar_req$004_val  = pe$044$xbar_req_val;
  assign xbar$005$xbar_req$005_msg  = pe$045$xbar_req_msg;
  assign xbar$005$xbar_req$005_val  = pe$045$xbar_req_val;
  assign xbar$005$xbar_req$006_msg  = pe$046$xbar_req_msg;
  assign xbar$005$xbar_req$006_val  = pe$046$xbar_req_val;
  assign xbar$005$xbar_req$007_msg  = pe$047$xbar_req_msg;
  assign xbar$005$xbar_req$007_val  = pe$047$xbar_req_val;
  assign xbar$005$xbar_resp$000_rdy = pe$040$xbar_resp_rdy;
  assign xbar$005$xbar_resp$001_rdy = pe$041$xbar_resp_rdy;
  assign xbar$005$xbar_resp$002_rdy = pe$042$xbar_resp_rdy;
  assign xbar$005$xbar_resp$003_rdy = pe$043$xbar_resp_rdy;
  assign xbar$005$xbar_resp$004_rdy = pe$044$xbar_resp_rdy;
  assign xbar$005$xbar_resp$005_rdy = pe$045$xbar_resp_rdy;
  assign xbar$005$xbar_resp$006_rdy = pe$046$xbar_resp_rdy;
  assign xbar$005$xbar_resp$007_rdy = pe$047$xbar_resp_rdy;
  assign xbar$006$bank_req$000_rdy  = xbar_bank_req$048_rdy;
  assign xbar$006$bank_req$001_rdy  = xbar_bank_req$049_rdy;
  assign xbar$006$bank_req$002_rdy  = xbar_bank_req$050_rdy;
  assign xbar$006$bank_req$003_rdy  = xbar_bank_req$051_rdy;
  assign xbar$006$bank_req$004_rdy  = xbar_bank_req$052_rdy;
  assign xbar$006$bank_req$005_rdy  = xbar_bank_req$053_rdy;
  assign xbar$006$bank_req$006_rdy  = xbar_bank_req$054_rdy;
  assign xbar$006$bank_req$007_rdy  = xbar_bank_req$055_rdy;
  assign xbar$006$bank_resp$000_msg = xbar_bank_resp$048_msg;
  assign xbar$006$bank_resp$000_val = xbar_bank_resp$048_val;
  assign xbar$006$bank_resp$001_msg = xbar_bank_resp$049_msg;
  assign xbar$006$bank_resp$001_val = xbar_bank_resp$049_val;
  assign xbar$006$bank_resp$002_msg = xbar_bank_resp$050_msg;
  assign xbar$006$bank_resp$002_val = xbar_bank_resp$050_val;
  assign xbar$006$bank_resp$003_msg = xbar_bank_resp$051_msg;
  assign xbar$006$bank_resp$003_val = xbar_bank_resp$051_val;
  assign xbar$006$bank_resp$004_msg = xbar_bank_resp$052_msg;
  assign xbar$006$bank_resp$004_val = xbar_bank_resp$052_val;
  assign xbar$006$bank_resp$005_msg = xbar_bank_resp$053_msg;
  assign xbar$006$bank_resp$005_val = xbar_bank_resp$053_val;
  assign xbar$006$bank_resp$006_msg = xbar_bank_resp$054_msg;
  assign xbar$006$bank_resp$006_val = xbar_bank_resp$054_val;
  assign xbar$006$bank_resp$007_msg = xbar_bank_resp$055_msg;
  assign xbar$006$bank_resp$007_val = xbar_bank_resp$055_val;
  assign xbar$006$clk               = clk;
  assign xbar$006$reset             = reset;
  assign xbar$006$xbar_req$000_msg  = pe$048$xbar_req_msg;
  assign xbar$006$xbar_req$000_val  = pe$048$xbar_req_val;
  assign xbar$006$xbar_req$001_msg  = pe$049$xbar_req_msg;
  assign xbar$006$xbar_req$001_val  = pe$049$xbar_req_val;
  assign xbar$006$xbar_req$002_msg  = pe$050$xbar_req_msg;
  assign xbar$006$xbar_req$002_val  = pe$050$xbar_req_val;
  assign xbar$006$xbar_req$003_msg  = pe$051$xbar_req_msg;
  assign xbar$006$xbar_req$003_val  = pe$051$xbar_req_val;
  assign xbar$006$xbar_req$004_msg  = pe$052$xbar_req_msg;
  assign xbar$006$xbar_req$004_val  = pe$052$xbar_req_val;
  assign xbar$006$xbar_req$005_msg  = pe$053$xbar_req_msg;
  assign xbar$006$xbar_req$005_val  = pe$053$xbar_req_val;
  assign xbar$006$xbar_req$006_msg  = pe$054$xbar_req_msg;
  assign xbar$006$xbar_req$006_val  = pe$054$xbar_req_val;
  assign xbar$006$xbar_req$007_msg  = pe$055$xbar_req_msg;
  assign xbar$006$xbar_req$007_val  = pe$055$xbar_req_val;
  assign xbar$006$xbar_resp$000_rdy = pe$048$xbar_resp_rdy;
  assign xbar$006$xbar_resp$001_rdy = pe$049$xbar_resp_rdy;
  assign xbar$006$xbar_resp$002_rdy = pe$050$xbar_resp_rdy;
  assign xbar$006$xbar_resp$003_rdy = pe$051$xbar_resp_rdy;
  assign xbar$006$xbar_resp$004_rdy = pe$052$xbar_resp_rdy;
  assign xbar$006$xbar_resp$005_rdy = pe$053$xbar_resp_rdy;
  assign xbar$006$xbar_resp$006_rdy = pe$054$xbar_resp_rdy;
  assign xbar$006$xbar_resp$007_rdy = pe$055$xbar_resp_rdy;
  assign xbar$007$bank_req$000_rdy  = xbar_bank_req$056_rdy;
  assign xbar$007$bank_req$001_rdy  = xbar_bank_req$057_rdy;
  assign xbar$007$bank_req$002_rdy  = xbar_bank_req$058_rdy;
  assign xbar$007$bank_req$003_rdy  = xbar_bank_req$059_rdy;
  assign xbar$007$bank_req$004_rdy  = xbar_bank_req$060_rdy;
  assign xbar$007$bank_req$005_rdy  = xbar_bank_req$061_rdy;
  assign xbar$007$bank_req$006_rdy  = xbar_bank_req$062_rdy;
  assign xbar$007$bank_req$007_rdy  = xbar_bank_req$063_rdy;
  assign xbar$007$bank_resp$000_msg = xbar_bank_resp$056_msg;
  assign xbar$007$bank_resp$000_val = xbar_bank_resp$056_val;
  assign xbar$007$bank_resp$001_msg = xbar_bank_resp$057_msg;
  assign xbar$007$bank_resp$001_val = xbar_bank_resp$057_val;
  assign xbar$007$bank_resp$002_msg = xbar_bank_resp$058_msg;
  assign xbar$007$bank_resp$002_val = xbar_bank_resp$058_val;
  assign xbar$007$bank_resp$003_msg = xbar_bank_resp$059_msg;
  assign xbar$007$bank_resp$003_val = xbar_bank_resp$059_val;
  assign xbar$007$bank_resp$004_msg = xbar_bank_resp$060_msg;
  assign xbar$007$bank_resp$004_val = xbar_bank_resp$060_val;
  assign xbar$007$bank_resp$005_msg = xbar_bank_resp$061_msg;
  assign xbar$007$bank_resp$005_val = xbar_bank_resp$061_val;
  assign xbar$007$bank_resp$006_msg = xbar_bank_resp$062_msg;
  assign xbar$007$bank_resp$006_val = xbar_bank_resp$062_val;
  assign xbar$007$bank_resp$007_msg = xbar_bank_resp$063_msg;
  assign xbar$007$bank_resp$007_val = xbar_bank_resp$063_val;
  assign xbar$007$clk               = clk;
  assign xbar$007$reset             = reset;
  assign xbar$007$xbar_req$000_msg  = pe$056$xbar_req_msg;
  assign xbar$007$xbar_req$000_val  = pe$056$xbar_req_val;
  assign xbar$007$xbar_req$001_msg  = pe$057$xbar_req_msg;
  assign xbar$007$xbar_req$001_val  = pe$057$xbar_req_val;
  assign xbar$007$xbar_req$002_msg  = pe$058$xbar_req_msg;
  assign xbar$007$xbar_req$002_val  = pe$058$xbar_req_val;
  assign xbar$007$xbar_req$003_msg  = pe$059$xbar_req_msg;
  assign xbar$007$xbar_req$003_val  = pe$059$xbar_req_val;
  assign xbar$007$xbar_req$004_msg  = pe$060$xbar_req_msg;
  assign xbar$007$xbar_req$004_val  = pe$060$xbar_req_val;
  assign xbar$007$xbar_req$005_msg  = pe$061$xbar_req_msg;
  assign xbar$007$xbar_req$005_val  = pe$061$xbar_req_val;
  assign xbar$007$xbar_req$006_msg  = pe$062$xbar_req_msg;
  assign xbar$007$xbar_req$006_val  = pe$062$xbar_req_val;
  assign xbar$007$xbar_req$007_msg  = pe$063$xbar_req_msg;
  assign xbar$007$xbar_req$007_val  = pe$063$xbar_req_val;
  assign xbar$007$xbar_resp$000_rdy = pe$056$xbar_resp_rdy;
  assign xbar$007$xbar_resp$001_rdy = pe$057$xbar_resp_rdy;
  assign xbar$007$xbar_resp$002_rdy = pe$058$xbar_resp_rdy;
  assign xbar$007$xbar_resp$003_rdy = pe$059$xbar_resp_rdy;
  assign xbar$007$xbar_resp$004_rdy = pe$060$xbar_resp_rdy;
  assign xbar$007$xbar_resp$005_rdy = pe$061$xbar_resp_rdy;
  assign xbar$007$xbar_resp$006_rdy = pe$062$xbar_resp_rdy;
  assign xbar$007$xbar_resp$007_rdy = pe$063$xbar_resp_rdy;
  assign xbar_bank_req$000_msg      = xbar$000$bank_req$000_msg;
  assign xbar_bank_req$000_val      = xbar$000$bank_req$000_val;
  assign xbar_bank_req$001_msg      = xbar$000$bank_req$001_msg;
  assign xbar_bank_req$001_val      = xbar$000$bank_req$001_val;
  assign xbar_bank_req$002_msg      = xbar$000$bank_req$002_msg;
  assign xbar_bank_req$002_val      = xbar$000$bank_req$002_val;
  assign xbar_bank_req$003_msg      = xbar$000$bank_req$003_msg;
  assign xbar_bank_req$003_val      = xbar$000$bank_req$003_val;
  assign xbar_bank_req$004_msg      = xbar$000$bank_req$004_msg;
  assign xbar_bank_req$004_val      = xbar$000$bank_req$004_val;
  assign xbar_bank_req$005_msg      = xbar$000$bank_req$005_msg;
  assign xbar_bank_req$005_val      = xbar$000$bank_req$005_val;
  assign xbar_bank_req$006_msg      = xbar$000$bank_req$006_msg;
  assign xbar_bank_req$006_val      = xbar$000$bank_req$006_val;
  assign xbar_bank_req$007_msg      = xbar$000$bank_req$007_msg;
  assign xbar_bank_req$007_val      = xbar$000$bank_req$007_val;
  assign xbar_bank_req$008_msg      = xbar$001$bank_req$000_msg;
  assign xbar_bank_req$008_val      = xbar$001$bank_req$000_val;
  assign xbar_bank_req$009_msg      = xbar$001$bank_req$001_msg;
  assign xbar_bank_req$009_val      = xbar$001$bank_req$001_val;
  assign xbar_bank_req$010_msg      = xbar$001$bank_req$002_msg;
  assign xbar_bank_req$010_val      = xbar$001$bank_req$002_val;
  assign xbar_bank_req$011_msg      = xbar$001$bank_req$003_msg;
  assign xbar_bank_req$011_val      = xbar$001$bank_req$003_val;
  assign xbar_bank_req$012_msg      = xbar$001$bank_req$004_msg;
  assign xbar_bank_req$012_val      = xbar$001$bank_req$004_val;
  assign xbar_bank_req$013_msg      = xbar$001$bank_req$005_msg;
  assign xbar_bank_req$013_val      = xbar$001$bank_req$005_val;
  assign xbar_bank_req$014_msg      = xbar$001$bank_req$006_msg;
  assign xbar_bank_req$014_val      = xbar$001$bank_req$006_val;
  assign xbar_bank_req$015_msg      = xbar$001$bank_req$007_msg;
  assign xbar_bank_req$015_val      = xbar$001$bank_req$007_val;
  assign xbar_bank_req$016_msg      = xbar$002$bank_req$000_msg;
  assign xbar_bank_req$016_val      = xbar$002$bank_req$000_val;
  assign xbar_bank_req$017_msg      = xbar$002$bank_req$001_msg;
  assign xbar_bank_req$017_val      = xbar$002$bank_req$001_val;
  assign xbar_bank_req$018_msg      = xbar$002$bank_req$002_msg;
  assign xbar_bank_req$018_val      = xbar$002$bank_req$002_val;
  assign xbar_bank_req$019_msg      = xbar$002$bank_req$003_msg;
  assign xbar_bank_req$019_val      = xbar$002$bank_req$003_val;
  assign xbar_bank_req$020_msg      = xbar$002$bank_req$004_msg;
  assign xbar_bank_req$020_val      = xbar$002$bank_req$004_val;
  assign xbar_bank_req$021_msg      = xbar$002$bank_req$005_msg;
  assign xbar_bank_req$021_val      = xbar$002$bank_req$005_val;
  assign xbar_bank_req$022_msg      = xbar$002$bank_req$006_msg;
  assign xbar_bank_req$022_val      = xbar$002$bank_req$006_val;
  assign xbar_bank_req$023_msg      = xbar$002$bank_req$007_msg;
  assign xbar_bank_req$023_val      = xbar$002$bank_req$007_val;
  assign xbar_bank_req$024_msg      = xbar$003$bank_req$000_msg;
  assign xbar_bank_req$024_val      = xbar$003$bank_req$000_val;
  assign xbar_bank_req$025_msg      = xbar$003$bank_req$001_msg;
  assign xbar_bank_req$025_val      = xbar$003$bank_req$001_val;
  assign xbar_bank_req$026_msg      = xbar$003$bank_req$002_msg;
  assign xbar_bank_req$026_val      = xbar$003$bank_req$002_val;
  assign xbar_bank_req$027_msg      = xbar$003$bank_req$003_msg;
  assign xbar_bank_req$027_val      = xbar$003$bank_req$003_val;
  assign xbar_bank_req$028_msg      = xbar$003$bank_req$004_msg;
  assign xbar_bank_req$028_val      = xbar$003$bank_req$004_val;
  assign xbar_bank_req$029_msg      = xbar$003$bank_req$005_msg;
  assign xbar_bank_req$029_val      = xbar$003$bank_req$005_val;
  assign xbar_bank_req$030_msg      = xbar$003$bank_req$006_msg;
  assign xbar_bank_req$030_val      = xbar$003$bank_req$006_val;
  assign xbar_bank_req$031_msg      = xbar$003$bank_req$007_msg;
  assign xbar_bank_req$031_val      = xbar$003$bank_req$007_val;
  assign xbar_bank_req$032_msg      = xbar$004$bank_req$000_msg;
  assign xbar_bank_req$032_val      = xbar$004$bank_req$000_val;
  assign xbar_bank_req$033_msg      = xbar$004$bank_req$001_msg;
  assign xbar_bank_req$033_val      = xbar$004$bank_req$001_val;
  assign xbar_bank_req$034_msg      = xbar$004$bank_req$002_msg;
  assign xbar_bank_req$034_val      = xbar$004$bank_req$002_val;
  assign xbar_bank_req$035_msg      = xbar$004$bank_req$003_msg;
  assign xbar_bank_req$035_val      = xbar$004$bank_req$003_val;
  assign xbar_bank_req$036_msg      = xbar$004$bank_req$004_msg;
  assign xbar_bank_req$036_val      = xbar$004$bank_req$004_val;
  assign xbar_bank_req$037_msg      = xbar$004$bank_req$005_msg;
  assign xbar_bank_req$037_val      = xbar$004$bank_req$005_val;
  assign xbar_bank_req$038_msg      = xbar$004$bank_req$006_msg;
  assign xbar_bank_req$038_val      = xbar$004$bank_req$006_val;
  assign xbar_bank_req$039_msg      = xbar$004$bank_req$007_msg;
  assign xbar_bank_req$039_val      = xbar$004$bank_req$007_val;
  assign xbar_bank_req$040_msg      = xbar$005$bank_req$000_msg;
  assign xbar_bank_req$040_val      = xbar$005$bank_req$000_val;
  assign xbar_bank_req$041_msg      = xbar$005$bank_req$001_msg;
  assign xbar_bank_req$041_val      = xbar$005$bank_req$001_val;
  assign xbar_bank_req$042_msg      = xbar$005$bank_req$002_msg;
  assign xbar_bank_req$042_val      = xbar$005$bank_req$002_val;
  assign xbar_bank_req$043_msg      = xbar$005$bank_req$003_msg;
  assign xbar_bank_req$043_val      = xbar$005$bank_req$003_val;
  assign xbar_bank_req$044_msg      = xbar$005$bank_req$004_msg;
  assign xbar_bank_req$044_val      = xbar$005$bank_req$004_val;
  assign xbar_bank_req$045_msg      = xbar$005$bank_req$005_msg;
  assign xbar_bank_req$045_val      = xbar$005$bank_req$005_val;
  assign xbar_bank_req$046_msg      = xbar$005$bank_req$006_msg;
  assign xbar_bank_req$046_val      = xbar$005$bank_req$006_val;
  assign xbar_bank_req$047_msg      = xbar$005$bank_req$007_msg;
  assign xbar_bank_req$047_val      = xbar$005$bank_req$007_val;
  assign xbar_bank_req$048_msg      = xbar$006$bank_req$000_msg;
  assign xbar_bank_req$048_val      = xbar$006$bank_req$000_val;
  assign xbar_bank_req$049_msg      = xbar$006$bank_req$001_msg;
  assign xbar_bank_req$049_val      = xbar$006$bank_req$001_val;
  assign xbar_bank_req$050_msg      = xbar$006$bank_req$002_msg;
  assign xbar_bank_req$050_val      = xbar$006$bank_req$002_val;
  assign xbar_bank_req$051_msg      = xbar$006$bank_req$003_msg;
  assign xbar_bank_req$051_val      = xbar$006$bank_req$003_val;
  assign xbar_bank_req$052_msg      = xbar$006$bank_req$004_msg;
  assign xbar_bank_req$052_val      = xbar$006$bank_req$004_val;
  assign xbar_bank_req$053_msg      = xbar$006$bank_req$005_msg;
  assign xbar_bank_req$053_val      = xbar$006$bank_req$005_val;
  assign xbar_bank_req$054_msg      = xbar$006$bank_req$006_msg;
  assign xbar_bank_req$054_val      = xbar$006$bank_req$006_val;
  assign xbar_bank_req$055_msg      = xbar$006$bank_req$007_msg;
  assign xbar_bank_req$055_val      = xbar$006$bank_req$007_val;
  assign xbar_bank_req$056_msg      = xbar$007$bank_req$000_msg;
  assign xbar_bank_req$056_val      = xbar$007$bank_req$000_val;
  assign xbar_bank_req$057_msg      = xbar$007$bank_req$001_msg;
  assign xbar_bank_req$057_val      = xbar$007$bank_req$001_val;
  assign xbar_bank_req$058_msg      = xbar$007$bank_req$002_msg;
  assign xbar_bank_req$058_val      = xbar$007$bank_req$002_val;
  assign xbar_bank_req$059_msg      = xbar$007$bank_req$003_msg;
  assign xbar_bank_req$059_val      = xbar$007$bank_req$003_val;
  assign xbar_bank_req$060_msg      = xbar$007$bank_req$004_msg;
  assign xbar_bank_req$060_val      = xbar$007$bank_req$004_val;
  assign xbar_bank_req$061_msg      = xbar$007$bank_req$005_msg;
  assign xbar_bank_req$061_val      = xbar$007$bank_req$005_val;
  assign xbar_bank_req$062_msg      = xbar$007$bank_req$006_msg;
  assign xbar_bank_req$062_val      = xbar$007$bank_req$006_val;
  assign xbar_bank_req$063_msg      = xbar$007$bank_req$007_msg;
  assign xbar_bank_req$063_val      = xbar$007$bank_req$007_val;
  assign xbar_bank_resp$000_rdy     = xbar$000$bank_resp$000_rdy;
  assign xbar_bank_resp$001_rdy     = xbar$000$bank_resp$001_rdy;
  assign xbar_bank_resp$002_rdy     = xbar$000$bank_resp$002_rdy;
  assign xbar_bank_resp$003_rdy     = xbar$000$bank_resp$003_rdy;
  assign xbar_bank_resp$004_rdy     = xbar$000$bank_resp$004_rdy;
  assign xbar_bank_resp$005_rdy     = xbar$000$bank_resp$005_rdy;
  assign xbar_bank_resp$006_rdy     = xbar$000$bank_resp$006_rdy;
  assign xbar_bank_resp$007_rdy     = xbar$000$bank_resp$007_rdy;
  assign xbar_bank_resp$008_rdy     = xbar$001$bank_resp$000_rdy;
  assign xbar_bank_resp$009_rdy     = xbar$001$bank_resp$001_rdy;
  assign xbar_bank_resp$010_rdy     = xbar$001$bank_resp$002_rdy;
  assign xbar_bank_resp$011_rdy     = xbar$001$bank_resp$003_rdy;
  assign xbar_bank_resp$012_rdy     = xbar$001$bank_resp$004_rdy;
  assign xbar_bank_resp$013_rdy     = xbar$001$bank_resp$005_rdy;
  assign xbar_bank_resp$014_rdy     = xbar$001$bank_resp$006_rdy;
  assign xbar_bank_resp$015_rdy     = xbar$001$bank_resp$007_rdy;
  assign xbar_bank_resp$016_rdy     = xbar$002$bank_resp$000_rdy;
  assign xbar_bank_resp$017_rdy     = xbar$002$bank_resp$001_rdy;
  assign xbar_bank_resp$018_rdy     = xbar$002$bank_resp$002_rdy;
  assign xbar_bank_resp$019_rdy     = xbar$002$bank_resp$003_rdy;
  assign xbar_bank_resp$020_rdy     = xbar$002$bank_resp$004_rdy;
  assign xbar_bank_resp$021_rdy     = xbar$002$bank_resp$005_rdy;
  assign xbar_bank_resp$022_rdy     = xbar$002$bank_resp$006_rdy;
  assign xbar_bank_resp$023_rdy     = xbar$002$bank_resp$007_rdy;
  assign xbar_bank_resp$024_rdy     = xbar$003$bank_resp$000_rdy;
  assign xbar_bank_resp$025_rdy     = xbar$003$bank_resp$001_rdy;
  assign xbar_bank_resp$026_rdy     = xbar$003$bank_resp$002_rdy;
  assign xbar_bank_resp$027_rdy     = xbar$003$bank_resp$003_rdy;
  assign xbar_bank_resp$028_rdy     = xbar$003$bank_resp$004_rdy;
  assign xbar_bank_resp$029_rdy     = xbar$003$bank_resp$005_rdy;
  assign xbar_bank_resp$030_rdy     = xbar$003$bank_resp$006_rdy;
  assign xbar_bank_resp$031_rdy     = xbar$003$bank_resp$007_rdy;
  assign xbar_bank_resp$032_rdy     = xbar$004$bank_resp$000_rdy;
  assign xbar_bank_resp$033_rdy     = xbar$004$bank_resp$001_rdy;
  assign xbar_bank_resp$034_rdy     = xbar$004$bank_resp$002_rdy;
  assign xbar_bank_resp$035_rdy     = xbar$004$bank_resp$003_rdy;
  assign xbar_bank_resp$036_rdy     = xbar$004$bank_resp$004_rdy;
  assign xbar_bank_resp$037_rdy     = xbar$004$bank_resp$005_rdy;
  assign xbar_bank_resp$038_rdy     = xbar$004$bank_resp$006_rdy;
  assign xbar_bank_resp$039_rdy     = xbar$004$bank_resp$007_rdy;
  assign xbar_bank_resp$040_rdy     = xbar$005$bank_resp$000_rdy;
  assign xbar_bank_resp$041_rdy     = xbar$005$bank_resp$001_rdy;
  assign xbar_bank_resp$042_rdy     = xbar$005$bank_resp$002_rdy;
  assign xbar_bank_resp$043_rdy     = xbar$005$bank_resp$003_rdy;
  assign xbar_bank_resp$044_rdy     = xbar$005$bank_resp$004_rdy;
  assign xbar_bank_resp$045_rdy     = xbar$005$bank_resp$005_rdy;
  assign xbar_bank_resp$046_rdy     = xbar$005$bank_resp$006_rdy;
  assign xbar_bank_resp$047_rdy     = xbar$005$bank_resp$007_rdy;
  assign xbar_bank_resp$048_rdy     = xbar$006$bank_resp$000_rdy;
  assign xbar_bank_resp$049_rdy     = xbar$006$bank_resp$001_rdy;
  assign xbar_bank_resp$050_rdy     = xbar$006$bank_resp$002_rdy;
  assign xbar_bank_resp$051_rdy     = xbar$006$bank_resp$003_rdy;
  assign xbar_bank_resp$052_rdy     = xbar$006$bank_resp$004_rdy;
  assign xbar_bank_resp$053_rdy     = xbar$006$bank_resp$005_rdy;
  assign xbar_bank_resp$054_rdy     = xbar$006$bank_resp$006_rdy;
  assign xbar_bank_resp$055_rdy     = xbar$006$bank_resp$007_rdy;
  assign xbar_bank_resp$056_rdy     = xbar$007$bank_resp$000_rdy;
  assign xbar_bank_resp$057_rdy     = xbar$007$bank_resp$001_rdy;
  assign xbar_bank_resp$058_rdy     = xbar$007$bank_resp$002_rdy;
  assign xbar_bank_resp$059_rdy     = xbar$007$bank_resp$003_rdy;
  assign xbar_bank_resp$060_rdy     = xbar$007$bank_resp$004_rdy;
  assign xbar_bank_resp$061_rdy     = xbar$007$bank_resp$005_rdy;
  assign xbar_bank_resp$062_rdy     = xbar$007$bank_resp$006_rdy;
  assign xbar_bank_resp$063_rdy     = xbar$007$bank_resp$007_rdy;
  assign y_unloader$000_msg         = pe$000$y_unloader_msg;
  assign y_unloader$000_val         = pe$000$y_unloader_val;
  assign y_unloader$001_msg         = pe$001$y_unloader_msg;
  assign y_unloader$001_val         = pe$001$y_unloader_val;
  assign y_unloader$002_msg         = pe$002$y_unloader_msg;
  assign y_unloader$002_val         = pe$002$y_unloader_val;
  assign y_unloader$003_msg         = pe$003$y_unloader_msg;
  assign y_unloader$003_val         = pe$003$y_unloader_val;
  assign y_unloader$004_msg         = pe$004$y_unloader_msg;
  assign y_unloader$004_val         = pe$004$y_unloader_val;
  assign y_unloader$005_msg         = pe$005$y_unloader_msg;
  assign y_unloader$005_val         = pe$005$y_unloader_val;
  assign y_unloader$006_msg         = pe$006$y_unloader_msg;
  assign y_unloader$006_val         = pe$006$y_unloader_val;
  assign y_unloader$007_msg         = pe$007$y_unloader_msg;
  assign y_unloader$007_val         = pe$007$y_unloader_val;
  assign y_unloader$008_msg         = pe$008$y_unloader_msg;
  assign y_unloader$008_val         = pe$008$y_unloader_val;
  assign y_unloader$009_msg         = pe$009$y_unloader_msg;
  assign y_unloader$009_val         = pe$009$y_unloader_val;
  assign y_unloader$010_msg         = pe$010$y_unloader_msg;
  assign y_unloader$010_val         = pe$010$y_unloader_val;
  assign y_unloader$011_msg         = pe$011$y_unloader_msg;
  assign y_unloader$011_val         = pe$011$y_unloader_val;
  assign y_unloader$012_msg         = pe$012$y_unloader_msg;
  assign y_unloader$012_val         = pe$012$y_unloader_val;
  assign y_unloader$013_msg         = pe$013$y_unloader_msg;
  assign y_unloader$013_val         = pe$013$y_unloader_val;
  assign y_unloader$014_msg         = pe$014$y_unloader_msg;
  assign y_unloader$014_val         = pe$014$y_unloader_val;
  assign y_unloader$015_msg         = pe$015$y_unloader_msg;
  assign y_unloader$015_val         = pe$015$y_unloader_val;
  assign y_unloader$016_msg         = pe$016$y_unloader_msg;
  assign y_unloader$016_val         = pe$016$y_unloader_val;
  assign y_unloader$017_msg         = pe$017$y_unloader_msg;
  assign y_unloader$017_val         = pe$017$y_unloader_val;
  assign y_unloader$018_msg         = pe$018$y_unloader_msg;
  assign y_unloader$018_val         = pe$018$y_unloader_val;
  assign y_unloader$019_msg         = pe$019$y_unloader_msg;
  assign y_unloader$019_val         = pe$019$y_unloader_val;
  assign y_unloader$020_msg         = pe$020$y_unloader_msg;
  assign y_unloader$020_val         = pe$020$y_unloader_val;
  assign y_unloader$021_msg         = pe$021$y_unloader_msg;
  assign y_unloader$021_val         = pe$021$y_unloader_val;
  assign y_unloader$022_msg         = pe$022$y_unloader_msg;
  assign y_unloader$022_val         = pe$022$y_unloader_val;
  assign y_unloader$023_msg         = pe$023$y_unloader_msg;
  assign y_unloader$023_val         = pe$023$y_unloader_val;
  assign y_unloader$024_msg         = pe$024$y_unloader_msg;
  assign y_unloader$024_val         = pe$024$y_unloader_val;
  assign y_unloader$025_msg         = pe$025$y_unloader_msg;
  assign y_unloader$025_val         = pe$025$y_unloader_val;
  assign y_unloader$026_msg         = pe$026$y_unloader_msg;
  assign y_unloader$026_val         = pe$026$y_unloader_val;
  assign y_unloader$027_msg         = pe$027$y_unloader_msg;
  assign y_unloader$027_val         = pe$027$y_unloader_val;
  assign y_unloader$028_msg         = pe$028$y_unloader_msg;
  assign y_unloader$028_val         = pe$028$y_unloader_val;
  assign y_unloader$029_msg         = pe$029$y_unloader_msg;
  assign y_unloader$029_val         = pe$029$y_unloader_val;
  assign y_unloader$030_msg         = pe$030$y_unloader_msg;
  assign y_unloader$030_val         = pe$030$y_unloader_val;
  assign y_unloader$031_msg         = pe$031$y_unloader_msg;
  assign y_unloader$031_val         = pe$031$y_unloader_val;
  assign y_unloader$032_msg         = pe$032$y_unloader_msg;
  assign y_unloader$032_val         = pe$032$y_unloader_val;
  assign y_unloader$033_msg         = pe$033$y_unloader_msg;
  assign y_unloader$033_val         = pe$033$y_unloader_val;
  assign y_unloader$034_msg         = pe$034$y_unloader_msg;
  assign y_unloader$034_val         = pe$034$y_unloader_val;
  assign y_unloader$035_msg         = pe$035$y_unloader_msg;
  assign y_unloader$035_val         = pe$035$y_unloader_val;
  assign y_unloader$036_msg         = pe$036$y_unloader_msg;
  assign y_unloader$036_val         = pe$036$y_unloader_val;
  assign y_unloader$037_msg         = pe$037$y_unloader_msg;
  assign y_unloader$037_val         = pe$037$y_unloader_val;
  assign y_unloader$038_msg         = pe$038$y_unloader_msg;
  assign y_unloader$038_val         = pe$038$y_unloader_val;
  assign y_unloader$039_msg         = pe$039$y_unloader_msg;
  assign y_unloader$039_val         = pe$039$y_unloader_val;
  assign y_unloader$040_msg         = pe$040$y_unloader_msg;
  assign y_unloader$040_val         = pe$040$y_unloader_val;
  assign y_unloader$041_msg         = pe$041$y_unloader_msg;
  assign y_unloader$041_val         = pe$041$y_unloader_val;
  assign y_unloader$042_msg         = pe$042$y_unloader_msg;
  assign y_unloader$042_val         = pe$042$y_unloader_val;
  assign y_unloader$043_msg         = pe$043$y_unloader_msg;
  assign y_unloader$043_val         = pe$043$y_unloader_val;
  assign y_unloader$044_msg         = pe$044$y_unloader_msg;
  assign y_unloader$044_val         = pe$044$y_unloader_val;
  assign y_unloader$045_msg         = pe$045$y_unloader_msg;
  assign y_unloader$045_val         = pe$045$y_unloader_val;
  assign y_unloader$046_msg         = pe$046$y_unloader_msg;
  assign y_unloader$046_val         = pe$046$y_unloader_val;
  assign y_unloader$047_msg         = pe$047$y_unloader_msg;
  assign y_unloader$047_val         = pe$047$y_unloader_val;
  assign y_unloader$048_msg         = pe$048$y_unloader_msg;
  assign y_unloader$048_val         = pe$048$y_unloader_val;
  assign y_unloader$049_msg         = pe$049$y_unloader_msg;
  assign y_unloader$049_val         = pe$049$y_unloader_val;
  assign y_unloader$050_msg         = pe$050$y_unloader_msg;
  assign y_unloader$050_val         = pe$050$y_unloader_val;
  assign y_unloader$051_msg         = pe$051$y_unloader_msg;
  assign y_unloader$051_val         = pe$051$y_unloader_val;
  assign y_unloader$052_msg         = pe$052$y_unloader_msg;
  assign y_unloader$052_val         = pe$052$y_unloader_val;
  assign y_unloader$053_msg         = pe$053$y_unloader_msg;
  assign y_unloader$053_val         = pe$053$y_unloader_val;
  assign y_unloader$054_msg         = pe$054$y_unloader_msg;
  assign y_unloader$054_val         = pe$054$y_unloader_val;
  assign y_unloader$055_msg         = pe$055$y_unloader_msg;
  assign y_unloader$055_val         = pe$055$y_unloader_val;
  assign y_unloader$056_msg         = pe$056$y_unloader_msg;
  assign y_unloader$056_val         = pe$056$y_unloader_val;
  assign y_unloader$057_msg         = pe$057$y_unloader_msg;
  assign y_unloader$057_val         = pe$057$y_unloader_val;
  assign y_unloader$058_msg         = pe$058$y_unloader_msg;
  assign y_unloader$058_val         = pe$058$y_unloader_val;
  assign y_unloader$059_msg         = pe$059$y_unloader_msg;
  assign y_unloader$059_val         = pe$059$y_unloader_val;
  assign y_unloader$060_msg         = pe$060$y_unloader_msg;
  assign y_unloader$060_val         = pe$060$y_unloader_val;
  assign y_unloader$061_msg         = pe$061$y_unloader_msg;
  assign y_unloader$061_val         = pe$061$y_unloader_val;
  assign y_unloader$062_msg         = pe$062$y_unloader_msg;
  assign y_unloader$062_val         = pe$062$y_unloader_val;
  assign y_unloader$063_msg         = pe$063$y_unloader_msg;
  assign y_unloader$063_val         = pe$063$y_unloader_val;

  // array declarations
  wire   [   0:0] cm_rdy_l[0:63];
  assign cm_rdy_l[  0] = cm_rdy_l$000;
  assign cm_rdy_l[  1] = cm_rdy_l$001;
  assign cm_rdy_l[  2] = cm_rdy_l$002;
  assign cm_rdy_l[  3] = cm_rdy_l$003;
  assign cm_rdy_l[  4] = cm_rdy_l$004;
  assign cm_rdy_l[  5] = cm_rdy_l$005;
  assign cm_rdy_l[  6] = cm_rdy_l$006;
  assign cm_rdy_l[  7] = cm_rdy_l$007;
  assign cm_rdy_l[  8] = cm_rdy_l$008;
  assign cm_rdy_l[  9] = cm_rdy_l$009;
  assign cm_rdy_l[ 10] = cm_rdy_l$010;
  assign cm_rdy_l[ 11] = cm_rdy_l$011;
  assign cm_rdy_l[ 12] = cm_rdy_l$012;
  assign cm_rdy_l[ 13] = cm_rdy_l$013;
  assign cm_rdy_l[ 14] = cm_rdy_l$014;
  assign cm_rdy_l[ 15] = cm_rdy_l$015;
  assign cm_rdy_l[ 16] = cm_rdy_l$016;
  assign cm_rdy_l[ 17] = cm_rdy_l$017;
  assign cm_rdy_l[ 18] = cm_rdy_l$018;
  assign cm_rdy_l[ 19] = cm_rdy_l$019;
  assign cm_rdy_l[ 20] = cm_rdy_l$020;
  assign cm_rdy_l[ 21] = cm_rdy_l$021;
  assign cm_rdy_l[ 22] = cm_rdy_l$022;
  assign cm_rdy_l[ 23] = cm_rdy_l$023;
  assign cm_rdy_l[ 24] = cm_rdy_l$024;
  assign cm_rdy_l[ 25] = cm_rdy_l$025;
  assign cm_rdy_l[ 26] = cm_rdy_l$026;
  assign cm_rdy_l[ 27] = cm_rdy_l$027;
  assign cm_rdy_l[ 28] = cm_rdy_l$028;
  assign cm_rdy_l[ 29] = cm_rdy_l$029;
  assign cm_rdy_l[ 30] = cm_rdy_l$030;
  assign cm_rdy_l[ 31] = cm_rdy_l$031;
  assign cm_rdy_l[ 32] = cm_rdy_l$032;
  assign cm_rdy_l[ 33] = cm_rdy_l$033;
  assign cm_rdy_l[ 34] = cm_rdy_l$034;
  assign cm_rdy_l[ 35] = cm_rdy_l$035;
  assign cm_rdy_l[ 36] = cm_rdy_l$036;
  assign cm_rdy_l[ 37] = cm_rdy_l$037;
  assign cm_rdy_l[ 38] = cm_rdy_l$038;
  assign cm_rdy_l[ 39] = cm_rdy_l$039;
  assign cm_rdy_l[ 40] = cm_rdy_l$040;
  assign cm_rdy_l[ 41] = cm_rdy_l$041;
  assign cm_rdy_l[ 42] = cm_rdy_l$042;
  assign cm_rdy_l[ 43] = cm_rdy_l$043;
  assign cm_rdy_l[ 44] = cm_rdy_l$044;
  assign cm_rdy_l[ 45] = cm_rdy_l$045;
  assign cm_rdy_l[ 46] = cm_rdy_l$046;
  assign cm_rdy_l[ 47] = cm_rdy_l$047;
  assign cm_rdy_l[ 48] = cm_rdy_l$048;
  assign cm_rdy_l[ 49] = cm_rdy_l$049;
  assign cm_rdy_l[ 50] = cm_rdy_l$050;
  assign cm_rdy_l[ 51] = cm_rdy_l$051;
  assign cm_rdy_l[ 52] = cm_rdy_l$052;
  assign cm_rdy_l[ 53] = cm_rdy_l$053;
  assign cm_rdy_l[ 54] = cm_rdy_l$054;
  assign cm_rdy_l[ 55] = cm_rdy_l$055;
  assign cm_rdy_l[ 56] = cm_rdy_l$056;
  assign cm_rdy_l[ 57] = cm_rdy_l$057;
  assign cm_rdy_l[ 58] = cm_rdy_l$058;
  assign cm_rdy_l[ 59] = cm_rdy_l$059;
  assign cm_rdy_l[ 60] = cm_rdy_l$060;
  assign cm_rdy_l[ 61] = cm_rdy_l$061;
  assign cm_rdy_l[ 62] = cm_rdy_l$062;
  assign cm_rdy_l[ 63] = cm_rdy_l$063;

  // PYMTL SOURCE:
  //
  // @s.combinational
  // def prop_cm_rdy():
  //       s.cm.rdy.value = 1
  //       for i in range(num_PE):
  //         if s.cm_rdy_l[i] == 0:
  //           s.cm.rdy.value = 0

  // logic for prop_cm_rdy()
  always @ (*) begin
    cm_rdy = 1;
    for (i=0; i < num_PE; i=i+1)
    begin
      if ((cm_rdy_l[i] == 0)) begin
        cm_rdy = 0;
      end
      else begin
      end
    end
  end


endmodule // Systolic_Array_8x8
`default_nettype wire


















`default_nettype wire

//-----------------------------------------------------------------------------
// SDPERTL_wrapped_0x5a96c41063a827a4
//-----------------------------------------------------------------------------
// PyMTL: dump_vcd = False
// PyMTL: spmm.SDPERTL_wrapped {"nbits": 32}
// PyMTL: verilator_xinit = zeros
`default_nettype none
module SDPERTL_wrapped_0x5a96c41063a827a4
(
  input  wire [  63:0] a_feeder_in_msg,
  output wire [   0:0] a_feeder_in_rdy,
  input  wire [   0:0] a_feeder_in_val,
  output wire [  63:0] a_feeder_out_msg,
  input  wire [   0:0] a_feeder_out_rdy,
  output wire [   0:0] a_feeder_out_val,
  input  wire [  31:0] blkdone_ack_msg,
  output wire [   0:0] blkdone_ack_rdy,
  input  wire [   0:0] blkdone_ack_val,
  output wire [  31:0] blkdone_sig_msg,
  input  wire [   0:0] blkdone_sig_rdy,
  output wire [   0:0] blkdone_sig_val,
  input  wire [   0:0] clk,
  input  wire [   0:0] cm_msg,
  output wire [   0:0] cm_rdy,
  input  wire [   0:0] cm_val,
  input  wire [  63:0] pe_id_msg,
  output wire [   0:0] pe_id_rdy,
  input  wire [   0:0] pe_id_val,
  input  wire [   0:0] reset,
  output wire [  31:0] xbar_req_msg,
  input  wire [   0:0] xbar_req_rdy,
  output wire [   0:0] xbar_req_val,
  input  wire [  63:0] xbar_resp_msg,
  output wire [   0:0] xbar_resp_rdy,
  input  wire [   0:0] xbar_resp_val,
  output wire [ 127:0] y_unloader_msg,
  input  wire [   0:0] y_unloader_rdy,
  output wire [   0:0] y_unloader_val
);











  // a_feeder_in_q temporaries
  wire   [   0:0] a_feeder_in_q$clk;
  wire   [   0:0] a_feeder_in_q$reset;
  wire   [  63:0] a_feeder_in_q$enq_msg;
  wire   [   0:0] a_feeder_in_q$enq_val;
  wire   [   0:0] a_feeder_in_q$deq_rdy;
  wire   [   0:0] a_feeder_in_q$enq_rdy;
  wire   [  63:0] a_feeder_in_q$deq_msg;
  wire   [   0:0] a_feeder_in_q$deq_val;
  wire   [   1:0] a_feeder_in_q$num_free_entries;

  NormalQueue_0x11fcba68eb131122 a_feeder_in_q
  (
    .clk              ( a_feeder_in_q$clk ),
    .reset            ( a_feeder_in_q$reset ),
    .enq_msg          ( a_feeder_in_q$enq_msg ),
    .enq_val          ( a_feeder_in_q$enq_val ),
    .deq_rdy          ( a_feeder_in_q$deq_rdy ),
    .enq_rdy          ( a_feeder_in_q$enq_rdy ),
    .deq_msg          ( a_feeder_in_q$deq_msg ),
    .deq_val          ( a_feeder_in_q$deq_val ),
    .num_free_entries ( a_feeder_in_q$num_free_entries )
  );

  // pe temporaries
  wire   [   0:0] pe$clk;
  wire   [   0:0] pe$reset;
  wire   [  63:0] pe$pe_id_msg;
  wire   [   0:0] pe$pe_id_val;
  wire   [   0:0] pe$cm_msg;
  wire   [   0:0] pe$cm_val;
  wire   [  63:0] pe$a_feeder_in_msg;
  wire   [   0:0] pe$a_feeder_in_val;
  wire   [   0:0] pe$a_feeder_out_rdy;
  wire   [   0:0] pe$xbar_req_rdy;
  wire   [  63:0] pe$xbar_resp_msg;
  wire   [   0:0] pe$xbar_resp_val;
  wire   [   0:0] pe$y_unloader_rdy;
  wire   [   0:0] pe$blkdone_sig_rdy;
  wire   [  31:0] pe$blkdone_ack_msg;
  wire   [   0:0] pe$blkdone_ack_val;
  wire   [   0:0] pe$pe_id_rdy;
  wire   [   0:0] pe$cm_rdy;
  wire   [   0:0] pe$a_feeder_in_rdy;
  wire   [  63:0] pe$a_feeder_out_msg;
  wire   [   0:0] pe$a_feeder_out_val;
  wire   [  31:0] pe$xbar_req_msg;
  wire   [   0:0] pe$xbar_req_val;
  wire   [   0:0] pe$xbar_resp_rdy;
  wire   [ 127:0] pe$y_unloader_msg;
  wire   [   0:0] pe$y_unloader_val;
  wire   [  31:0] pe$blkdone_sig_msg;
  wire   [   0:0] pe$blkdone_sig_val;
  wire   [   0:0] pe$blkdone_ack_rdy;

  SparsePERTL_0x16afdb0276c863e5 pe
  (
    .clk              ( pe$clk ),
    .reset            ( pe$reset ),
    .pe_id_msg        ( pe$pe_id_msg ),
    .pe_id_val        ( pe$pe_id_val ),
    .cm_msg           ( pe$cm_msg ),
    .cm_val           ( pe$cm_val ),
    .a_feeder_in_msg  ( pe$a_feeder_in_msg ),
    .a_feeder_in_val  ( pe$a_feeder_in_val ),
    .a_feeder_out_rdy ( pe$a_feeder_out_rdy ),
    .xbar_req_rdy     ( pe$xbar_req_rdy ),
    .xbar_resp_msg    ( pe$xbar_resp_msg ),
    .xbar_resp_val    ( pe$xbar_resp_val ),
    .y_unloader_rdy   ( pe$y_unloader_rdy ),
    .blkdone_sig_rdy  ( pe$blkdone_sig_rdy ),
    .blkdone_ack_msg  ( pe$blkdone_ack_msg ),
    .blkdone_ack_val  ( pe$blkdone_ack_val ),
    .pe_id_rdy        ( pe$pe_id_rdy ),
    .cm_rdy           ( pe$cm_rdy ),
    .a_feeder_in_rdy  ( pe$a_feeder_in_rdy ),
    .a_feeder_out_msg ( pe$a_feeder_out_msg ),
    .a_feeder_out_val ( pe$a_feeder_out_val ),
    .xbar_req_msg     ( pe$xbar_req_msg ),
    .xbar_req_val     ( pe$xbar_req_val ),
    .xbar_resp_rdy    ( pe$xbar_resp_rdy ),
    .y_unloader_msg   ( pe$y_unloader_msg ),
    .y_unloader_val   ( pe$y_unloader_val ),
    .blkdone_sig_msg  ( pe$blkdone_sig_msg ),
    .blkdone_sig_val  ( pe$blkdone_sig_val ),
    .blkdone_ack_rdy  ( pe$blkdone_ack_rdy )
  );

  // signal connections
  assign a_feeder_in_q$clk     = clk;
  assign a_feeder_in_q$deq_rdy = pe$a_feeder_in_rdy;
  assign a_feeder_in_q$enq_msg = a_feeder_in_msg;
  assign a_feeder_in_q$enq_val = a_feeder_in_val;
  assign a_feeder_in_q$reset   = reset;
  assign a_feeder_in_rdy       = a_feeder_in_q$enq_rdy;
  assign a_feeder_out_msg      = pe$a_feeder_out_msg;
  assign a_feeder_out_val      = pe$a_feeder_out_val;
  assign blkdone_ack_rdy       = pe$blkdone_ack_rdy;
  assign blkdone_sig_msg       = pe$blkdone_sig_msg;
  assign blkdone_sig_val       = pe$blkdone_sig_val;
  assign cm_rdy                = pe$cm_rdy;


  assign pe$a_feeder_in_msg    = a_feeder_in_q$deq_msg;
  assign pe$a_feeder_in_val    = a_feeder_in_q$deq_val;
  assign pe$a_feeder_out_rdy   = a_feeder_out_rdy;
  assign pe$blkdone_ack_msg    = blkdone_ack_msg;
  assign pe$blkdone_ack_val    = blkdone_ack_val;
  assign pe$blkdone_sig_rdy    = blkdone_sig_rdy;
  assign pe$clk                = clk;
  assign pe$cm_msg             = cm_msg;
  assign pe$cm_val             = cm_val;
  assign pe$pe_id_msg          = pe_id_msg;
  assign pe$pe_id_val          = pe_id_val;
  assign pe$reset              = reset;
  assign pe$xbar_req_rdy       = xbar_req_rdy;
  assign pe$xbar_resp_msg      = xbar_resp_msg;
  assign pe$xbar_resp_val      = xbar_resp_val;
  assign pe$y_unloader_rdy     = y_unloader_rdy;
  assign pe_id_rdy             = pe$pe_id_rdy;
  assign xbar_req_msg          = pe$xbar_req_msg;
  assign xbar_req_val          = pe$xbar_req_val;
  assign xbar_resp_rdy         = pe$xbar_resp_rdy;
  assign y_unloader_msg        = pe$y_unloader_msg;
  assign y_unloader_val        = pe$y_unloader_val;



endmodule // SDPERTL_wrapped_0x5a96c41063a827a4
`default_nettype wire

//-----------------------------------------------------------------------------
// NormalQueue_0x11fcba68eb131122
//-----------------------------------------------------------------------------
// PyMTL: dump_vcd = False
// PyMTL: spmm.NormalQueue {"dtype": 64, "num_entries": 2}
// PyMTL: verilator_xinit = zeros
`default_nettype none
module NormalQueue_0x11fcba68eb131122
(
  input  wire [   0:0] clk,
  output wire [  63:0] deq_msg,
  input  wire [   0:0] deq_rdy,
  output wire [   0:0] deq_val,
  input  wire [  63:0] enq_msg,
  output wire [   0:0] enq_rdy,
  input  wire [   0:0] enq_val,
  output wire [   1:0] num_free_entries,
  input  wire [   0:0] reset
);

  // ctrl temporaries
  wire   [   0:0] ctrl$clk;
  wire   [   0:0] ctrl$reset;
  wire   [   0:0] ctrl$enq_val;
  wire   [   0:0] ctrl$deq_rdy;
  wire   [   0:0] ctrl$enq_rdy;
  wire   [   0:0] ctrl$deq_val;
  wire   [   1:0] ctrl$num_free_entries;
  wire   [   0:0] ctrl$wen;
  wire   [   0:0] ctrl$waddr;
  wire   [   0:0] ctrl$raddr;

  NormalQueueCtrl_0x52f48ae78035d21d ctrl
  (
    .clk              ( ctrl$clk ),
    .reset            ( ctrl$reset ),
    .enq_val          ( ctrl$enq_val ),
    .deq_rdy          ( ctrl$deq_rdy ),
    .enq_rdy          ( ctrl$enq_rdy ),
    .deq_val          ( ctrl$deq_val ),
    .num_free_entries ( ctrl$num_free_entries ),
    .wen              ( ctrl$wen ),
    .waddr            ( ctrl$waddr ),
    .raddr            ( ctrl$raddr )
  );

  // dpath temporaries
  wire   [   0:0] dpath$clk;
  wire   [   0:0] dpath$reset;
  wire   [  63:0] dpath$enq_bits;
  wire   [   0:0] dpath$wen;
  wire   [   0:0] dpath$waddr;
  wire   [   0:0] dpath$raddr;
  wire   [  63:0] dpath$deq_bits;

  NormalQueueDpath_0x11fcba68eb131122 dpath
  (
    .clk      ( dpath$clk ),
    .reset    ( dpath$reset ),
    .enq_bits ( dpath$enq_bits ),
    .wen      ( dpath$wen ),
    .waddr    ( dpath$waddr ),
    .raddr    ( dpath$raddr ),
    .deq_bits ( dpath$deq_bits )
  );

  // signal connections
  assign ctrl$clk         = clk;
  assign ctrl$deq_rdy     = deq_rdy;
  assign ctrl$enq_val     = enq_val;
  assign ctrl$reset       = reset;
  assign deq_msg          = dpath$deq_bits;
  assign deq_val          = ctrl$deq_val;
  assign dpath$clk        = clk;
  assign dpath$enq_bits   = enq_msg;
  assign dpath$raddr      = ctrl$raddr;
  assign dpath$reset      = reset;
  assign dpath$waddr      = ctrl$waddr;
  assign dpath$wen        = ctrl$wen;
  assign enq_rdy          = ctrl$enq_rdy;
  assign num_free_entries = ctrl$num_free_entries;



endmodule // NormalQueue_0x11fcba68eb131122
`default_nettype wire

//-----------------------------------------------------------------------------
// NormalQueueCtrl_0x52f48ae78035d21d
//-----------------------------------------------------------------------------
// PyMTL: dump_vcd = False
// PyMTL: spmm.NormalQueue {"num_entries": 2}
// PyMTL: verilator_xinit = zeros
`default_nettype none
module NormalQueueCtrl_0x52f48ae78035d21d
(
  input  wire [   0:0] clk,
  input  wire [   0:0] deq_rdy,
  output reg  [   0:0] deq_val,
  output reg  [   0:0] enq_rdy,
  input  wire [   0:0] enq_val,
  output reg  [   1:0] num_free_entries,
  output reg  [   0:0] raddr,
  input  wire [   0:0] reset,
  output reg  [   0:0] waddr,
  output reg  [   0:0] wen
);

  // register declarations
  reg    [   0:0] deq_ptr;
  reg    [   0:0] deq_ptr_inc;
  reg    [   0:0] deq_ptr_next;
  reg    [   0:0] do_deq;
  reg    [   0:0] do_enq;
  reg    [   0:0] empty;
  reg    [   0:0] enq_ptr;
  reg    [   0:0] enq_ptr_inc;
  reg    [   0:0] enq_ptr_next;
  reg    [   0:0] full;
  reg    [   0:0] full_next_cycle;

  // localparam declarations
  localparam last_idx = 1;
  localparam num_entries = 2;



  // PYMTL SOURCE:
  //
  // @s.posedge_clk
  // def seq():
  //
  //       if s.reset: s.deq_ptr.next = 0
  //       else:       s.deq_ptr.next = s.deq_ptr_next
  //
  //       if s.reset: s.enq_ptr.next = 0
  //       else:       s.enq_ptr.next = s.enq_ptr_next
  //
  //       if   s.reset:               s.full.next = 0
  //       elif s.full_next_cycle:     s.full.next = 1
  //       elif (s.do_deq and s.full): s.full.next = 0
  //       else:                       s.full.next = s.full

  // logic for seq()
  always @ (posedge clk) begin
    if (reset) begin
      deq_ptr <= 0;
    end
    else begin
      deq_ptr <= deq_ptr_next;
    end
    if (reset) begin
      enq_ptr <= 0;
    end
    else begin
      enq_ptr <= enq_ptr_next;
    end
    if (reset) begin
      full <= 0;
    end
    else begin
      if (full_next_cycle) begin
        full <= 1;
      end
      else begin
        if ((do_deq&&full)) begin
          full <= 0;
        end
        else begin
          full <= full;
        end
      end
    end
  end

  // PYMTL SOURCE:
  //
  // @s.combinational
  // def comb_output_signals():
  //       s.empty.value   = not s.full and (s.enq_ptr == s.deq_ptr)
  //
  //       s.enq_rdy.value = not s.full
  //       s.deq_val.value = not s.empty

  // logic for comb_output_signals()
  always @ (*) begin
    empty = (!full&&(enq_ptr == deq_ptr));
    enq_rdy = !full;
    deq_val = !empty;
  end

  // PYMTL SOURCE:
  //
  // @s.combinational
  // def comb():
  //
  //       # only enqueue/dequeue if valid and ready
  //
  //       s.do_enq.value = s.enq_rdy and s.enq_val
  //       s.do_deq.value = s.deq_rdy and s.deq_val
  //
  //       # set control signals
  //
  //       s.wen.value     = s.do_enq
  //       s.waddr.value   = s.enq_ptr
  //       s.raddr.value   = s.deq_ptr
  //
  //       # enq ptr incrementer
  //
  //       if s.enq_ptr == s.last_idx: s.enq_ptr_inc.value = 0
  //       else:                       s.enq_ptr_inc.value = s.enq_ptr + 1
  //
  //       # deq ptr incrementer
  //
  //       if s.deq_ptr == s.last_idx: s.deq_ptr_inc.value = 0
  //       else:                       s.deq_ptr_inc.value = s.deq_ptr + 1
  //
  //       # set the next ptr value
  //
  //       if s.do_enq: s.enq_ptr_next.value = s.enq_ptr_inc
  //       else:        s.enq_ptr_next.value = s.enq_ptr
  //
  //       if s.do_deq: s.deq_ptr_next.value = s.deq_ptr_inc
  //       else:        s.deq_ptr_next.value = s.deq_ptr
  //
  //       # number of free entries calculation
  //
  //       if   s.reset:
  //         s.num_free_entries.value = s.num_entries
  //       elif s.full:
  //         s.num_free_entries.value = 0
  //       elif s.empty:
  //         s.num_free_entries.value = s.num_entries
  //       elif s.enq_ptr > s.deq_ptr:
  //         s.num_free_entries.value = s.num_entries - ( s.enq_ptr - s.deq_ptr )
  //       elif s.deq_ptr > s.enq_ptr:
  //         s.num_free_entries.value = s.deq_ptr - s.enq_ptr
  //
  //       s.full_next_cycle.value = (s.do_enq and not s.do_deq and
  //                                 (s.enq_ptr_next == s.deq_ptr))

  // logic for comb()
  always @ (*) begin
    do_enq = (enq_rdy&&enq_val);
    do_deq = (deq_rdy&&deq_val);
    wen = do_enq;
    waddr = enq_ptr;
    raddr = deq_ptr;
    if ((enq_ptr == last_idx)) begin
      enq_ptr_inc = 0;
    end
    else begin
      enq_ptr_inc = (enq_ptr+1);
    end
    if ((deq_ptr == last_idx)) begin
      deq_ptr_inc = 0;
    end
    else begin
      deq_ptr_inc = (deq_ptr+1);
    end
    if (do_enq) begin
      enq_ptr_next = enq_ptr_inc;
    end
    else begin
      enq_ptr_next = enq_ptr;
    end
    if (do_deq) begin
      deq_ptr_next = deq_ptr_inc;
    end
    else begin
      deq_ptr_next = deq_ptr;
    end
    if (reset) begin
      num_free_entries = num_entries;
    end
    else begin
      if (full) begin
        num_free_entries = 0;
      end
      else begin
        if (empty) begin
          num_free_entries = num_entries;
        end
        else begin
          if ((enq_ptr > deq_ptr)) begin
            num_free_entries = (num_entries-(enq_ptr-deq_ptr));
          end
          else begin
            if ((deq_ptr > enq_ptr)) begin
              num_free_entries = (deq_ptr-enq_ptr);
            end
            else begin
            end
          end
        end
      end
    end
    full_next_cycle = (do_enq&&!do_deq&&(enq_ptr_next == deq_ptr));
  end


endmodule // NormalQueueCtrl_0x52f48ae78035d21d
`default_nettype wire

//-----------------------------------------------------------------------------
// NormalQueueDpath_0x11fcba68eb131122
//-----------------------------------------------------------------------------
// PyMTL: dump_vcd = False
// PyMTL: spmm.NormalQueue {"dtype": 64, "num_entries": 2}
// PyMTL: verilator_xinit = zeros
`default_nettype none
module NormalQueueDpath_0x11fcba68eb131122
(
  input  wire [   0:0] clk,
  output wire [  63:0] deq_bits,
  input  wire [  63:0] enq_bits,
  input  wire [   0:0] raddr,
  input  wire [   0:0] reset,
  input  wire [   0:0] waddr,
  input  wire [   0:0] wen
);

  // queue temporaries
  wire   [   0:0] queue$clk;
  wire   [   0:0] queue$reset;
  wire   [   0:0] queue$rd_addr$000;
  wire   [   0:0] queue$wr_addr;
  wire   [  63:0] queue$wr_data;
  wire   [   0:0] queue$wr_en;
  wire   [  63:0] queue$rd_data$000;

  RegisterFile_0x64a1fa8ad8954c01 queue
  (
    .clk         ( queue$clk ),
    .reset       ( queue$reset ),
    .rd_addr$000 ( queue$rd_addr$000 ),
    .wr_addr     ( queue$wr_addr ),
    .wr_data     ( queue$wr_data ),
    .wr_en       ( queue$wr_en ),
    .rd_data$000 ( queue$rd_data$000 )
  );

  // signal connections
  assign deq_bits          = queue$rd_data$000;
  assign queue$clk         = clk;
  assign queue$rd_addr$000 = raddr;
  assign queue$reset       = reset;
  assign queue$wr_addr     = waddr;
  assign queue$wr_data     = enq_bits;
  assign queue$wr_en       = wen;



endmodule // NormalQueueDpath_0x11fcba68eb131122
`default_nettype wire

//-----------------------------------------------------------------------------
// RegisterFile_0x64a1fa8ad8954c01
//-----------------------------------------------------------------------------
// PyMTL: dump_vcd = False
// PyMTL: pclib.rtl.RegisterFile {"const_zero": false, "dtype": 64, "nregs": 2, "rd_ports": 1, "wr_ports": 1}
// PyMTL: verilator_xinit = zeros
`default_nettype none
module RegisterFile_0x64a1fa8ad8954c01
(
  input  wire [   0:0] clk,
  input  wire [   0:0] rd_addr$000,
  output wire [  63:0] rd_data$000,
  input  wire [   0:0] reset,
  input  wire [   0:0] wr_addr,
  input  wire [  63:0] wr_data,
  input  wire [   0:0] wr_en
);

  // wire declarations
  wire   [  63:0] regs$000;
  wire   [  63:0] regs$001;


  // localparam declarations
  localparam nregs = 2;
  localparam rd_ports = 1;

  // loop variable declarations
  integer i;


  // array declarations
  wire   [   0:0] rd_addr[0:0];
  assign rd_addr[  0] = rd_addr$000;
  reg    [  63:0] rd_data[0:0];
  assign rd_data$000 = rd_data[  0];
  reg    [  63:0] regs[0:1];
  assign regs$000 = regs[  0];
  assign regs$001 = regs[  1];

  // PYMTL SOURCE:
  //
  // @s.posedge_clk
  // def seq_logic():
  //         if s.wr_en:
  //           s.regs[ s.wr_addr ].next = s.wr_data

  // logic for seq_logic()
  always @ (posedge clk) begin
    if (wr_en) begin
      regs[wr_addr] <= wr_data;
    end
    else begin
    end
  end

  // PYMTL SOURCE:
  //
  // @s.combinational
  // def comb_logic():
  //         for i in range( rd_ports ):
  //           assert s.rd_addr[i] < nregs
  //           s.rd_data[i].value = s.regs[ s.rd_addr[i] ]

  // logic for comb_logic()
  always @ (*) begin
    for (i=0; i < rd_ports; i=i+1)
    begin
      rd_data[i] = regs[rd_addr[i]];
    end
  end


endmodule // RegisterFile_0x64a1fa8ad8954c01
`default_nettype wire

//-----------------------------------------------------------------------------
// SparsePERTL_0x16afdb0276c863e5
//-----------------------------------------------------------------------------
// PyMTL: dump_vcd = False
// PyMTL: spmm.SparsePERTL {"nbits": 32}
// PyMTL: verilator_xinit = zeros
`default_nettype none
module SparsePERTL_0x16afdb0276c863e5
(
  input  wire [  63:0] a_feeder_in_msg,
  output wire [   0:0] a_feeder_in_rdy,
  input  wire [   0:0] a_feeder_in_val,
  output wire [  63:0] a_feeder_out_msg,
  input  wire [   0:0] a_feeder_out_rdy,
  output wire [   0:0] a_feeder_out_val,
  input  wire [  31:0] blkdone_ack_msg,
  output wire [   0:0] blkdone_ack_rdy,
  input  wire [   0:0] blkdone_ack_val,
  output wire [  31:0] blkdone_sig_msg,
  input  wire [   0:0] blkdone_sig_rdy,
  output wire [   0:0] blkdone_sig_val,
  input  wire [   0:0] clk,
  input  wire [   0:0] cm_msg,
  output reg  [   0:0] cm_rdy,
  input  wire [   0:0] cm_val,
  input  wire [  63:0] pe_id_msg,
  output reg  [   0:0] pe_id_rdy,
  input  wire [   0:0] pe_id_val,
  input  wire [   0:0] reset,
  output wire [  31:0] xbar_req_msg,
  input  wire [   0:0] xbar_req_rdy,
  output wire [   0:0] xbar_req_val,
  input  wire [  63:0] xbar_resp_msg,
  output wire [   0:0] xbar_resp_rdy,
  input  wire [   0:0] xbar_resp_val,
  output wire [ 127:0] y_unloader_msg,
  input  wire [   0:0] y_unloader_rdy,
  output wire [   0:0] y_unloader_val
);

  // wire declarations
  wire   [  63:0] a_compute;
  wire   [   0:0] a_compute_rdy;
  wire   [   0:0] a_compute_val;
  wire   [   0:0] all_done;
  wire   [   0:0] xbar_val_rdy;


  // register declarations
  reg    [   0:0] compute_mode$in_;
  reg    [  31:0] state$in_;
  reg    [   0:0] state_cmp;
  reg    [   0:0] state_rst;
  reg    [  31:0] x_id$in_;
  reg    [  31:0] y_id$in_;

  // localparam declarations
  localparam state_compute = 2;
  localparam state_idle = 0;
  localparam state_reset = 1;











  // state temporaries
  wire   [   0:0] state$clk;
  wire   [   0:0] state$reset;
  wire   [  31:0] state$out;

  Reg_0x3392d4dd30174d2 state
  (
    .clk   ( state$clk ),
    .reset ( state$reset ),
    .in_   ( state$in_ ),
    .out   ( state$out )
  );

  // x_id temporaries
  wire   [   0:0] x_id$clk;
  wire   [   0:0] x_id$reset;
  wire   [  31:0] x_id$out;

  Reg_0x3392d4dd30174d2 x_id
  (
    .clk   ( x_id$clk ),
    .reset ( x_id$reset ),
    .in_   ( x_id$in_ ),
    .out   ( x_id$out )
  );

  // y_id temporaries
  wire   [   0:0] y_id$clk;
  wire   [   0:0] y_id$reset;
  wire   [  31:0] y_id$out;

  Reg_0x3392d4dd30174d2 y_id
  (
    .clk   ( y_id$clk ),
    .reset ( y_id$reset ),
    .in_   ( y_id$in_ ),
    .out   ( y_id$out )
  );

  // compute_mode temporaries
  wire   [   0:0] compute_mode$clk;
  wire   [   0:0] compute_mode$reset;
  wire   [   0:0] compute_mode$out;

  Reg_0x5e7e932e291f44db compute_mode
  (
    .clk   ( compute_mode$clk ),
    .reset ( compute_mode$reset ),
    .in_   ( compute_mode$in_ ),
    .out   ( compute_mode$out )
  );

  // drain_cb_fsm temporaries
  wire   [   0:0] drain_cb_fsm$clk;
  wire   [   0:0] drain_cb_fsm$reset;
  wire   [   1:0] drain_cb_fsm$in_;
  wire   [   1:0] drain_cb_fsm$out;

  Reg_0x5e7e932e28f17d92 drain_cb_fsm
  (
    .clk   ( drain_cb_fsm$clk ),
    .reset ( drain_cb_fsm$reset ),
    .in_   ( drain_cb_fsm$in_ ),
    .out   ( drain_cb_fsm$out )
  );

  // fv temporaries
  wire   [   0:0] fv$clk;
  wire   [   0:0] fv$reset;
  wire   [  63:0] fv$a_feeder_in_msg;
  wire   [   0:0] fv$a_feeder_in_val;
  wire   [   0:0] fv$a_feeder_out_rdy;
  wire   [   0:0] fv$xbar_req_rdy;
  wire   [   0:0] fv$blkdone_sig_rdy;
  wire   [  31:0] fv$blkdone_ack_msg;
  wire   [   0:0] fv$blkdone_ack_val;
  wire   [   0:0] fv$a_compute_rdy;
  wire   [   0:0] fv$state_cmp;
  wire   [   0:0] fv$state_rst;
  wire   [  31:0] fv$x_id;
  wire   [   0:0] fv$xbar_val_rdy;
  wire   [   0:0] fv$compute_mode;
  wire   [   0:0] fv$a_feeder_in_rdy;
  wire   [  63:0] fv$a_feeder_out_msg;
  wire   [   0:0] fv$a_feeder_out_val;
  wire   [  31:0] fv$xbar_req_msg;
  wire   [   0:0] fv$xbar_req_val;
  wire   [  31:0] fv$blkdone_sig_msg;
  wire   [   0:0] fv$blkdone_sig_val;
  wire   [   0:0] fv$blkdone_ack_rdy;
  wire   [  63:0] fv$a_compute_msg;
  wire   [   0:0] fv$a_compute_val;

  fetch_values_0x2868aa3edaec330e fv
  (
    .clk              ( fv$clk ),
    .reset            ( fv$reset ),
    .a_feeder_in_msg  ( fv$a_feeder_in_msg ),
    .a_feeder_in_val  ( fv$a_feeder_in_val ),
    .a_feeder_out_rdy ( fv$a_feeder_out_rdy ),
    .xbar_req_rdy     ( fv$xbar_req_rdy ),
    .blkdone_sig_rdy  ( fv$blkdone_sig_rdy ),
    .blkdone_ack_msg  ( fv$blkdone_ack_msg ),
    .blkdone_ack_val  ( fv$blkdone_ack_val ),
    .a_compute_rdy    ( fv$a_compute_rdy ),
    .state_cmp        ( fv$state_cmp ),
    .state_rst        ( fv$state_rst ),
    .x_id             ( fv$x_id ),
    .xbar_val_rdy     ( fv$xbar_val_rdy ),
    .compute_mode     ( fv$compute_mode ),
    .a_feeder_in_rdy  ( fv$a_feeder_in_rdy ),
    .a_feeder_out_msg ( fv$a_feeder_out_msg ),
    .a_feeder_out_val ( fv$a_feeder_out_val ),
    .xbar_req_msg     ( fv$xbar_req_msg ),
    .xbar_req_val     ( fv$xbar_req_val ),
    .blkdone_sig_msg  ( fv$blkdone_sig_msg ),
    .blkdone_sig_val  ( fv$blkdone_sig_val ),
    .blkdone_ack_rdy  ( fv$blkdone_ack_rdy ),
    .a_compute_msg    ( fv$a_compute_msg ),
    .a_compute_val    ( fv$a_compute_val )
  );

  // cd temporaries
  wire   [   0:0] cd$clk;
  wire   [   0:0] cd$reset;
  wire   [  63:0] cd$a_compute_msg;
  wire   [   0:0] cd$a_compute_val;
  wire   [  63:0] cd$xbar_resp_msg;
  wire   [   0:0] cd$xbar_resp_val;
  wire   [   0:0] cd$y_unloader_rdy;
  wire   [   0:0] cd$state_rst;
  wire   [   0:0] cd$state_cmp;
  wire   [   0:0] cd$compute_mode;
  wire   [   0:0] cd$a_compute_rdy;
  wire   [   0:0] cd$xbar_resp_rdy;
  wire   [ 127:0] cd$y_unloader_msg;
  wire   [   0:0] cd$y_unloader_val;
  wire   [   0:0] cd$all_done;
  wire   [   0:0] cd$xbar_val_rdy;

  compute_drain_0x3ddd647ff49d40d6 cd
  (
    .clk            ( cd$clk ),
    .reset          ( cd$reset ),
    .a_compute_msg  ( cd$a_compute_msg ),
    .a_compute_val  ( cd$a_compute_val ),
    .xbar_resp_msg  ( cd$xbar_resp_msg ),
    .xbar_resp_val  ( cd$xbar_resp_val ),
    .y_unloader_rdy ( cd$y_unloader_rdy ),
    .state_rst      ( cd$state_rst ),
    .state_cmp      ( cd$state_cmp ),
    .compute_mode   ( cd$compute_mode ),
    .a_compute_rdy  ( cd$a_compute_rdy ),
    .xbar_resp_rdy  ( cd$xbar_resp_rdy ),
    .y_unloader_msg ( cd$y_unloader_msg ),
    .y_unloader_val ( cd$y_unloader_val ),
    .all_done       ( cd$all_done ),
    .xbar_val_rdy   ( cd$xbar_val_rdy )
  );

  // signal connections
  assign a_compute           = fv$a_compute_msg;
  assign a_compute_rdy       = cd$a_compute_rdy;
  assign a_compute_val       = fv$a_compute_val;
  assign a_feeder_in_rdy     = fv$a_feeder_in_rdy;
  assign a_feeder_out_msg    = fv$a_feeder_out_msg;
  assign a_feeder_out_val    = fv$a_feeder_out_val;
  assign all_done            = cd$all_done;
  assign blkdone_ack_rdy     = fv$blkdone_ack_rdy;
  assign blkdone_sig_msg     = fv$blkdone_sig_msg;
  assign blkdone_sig_val     = fv$blkdone_sig_val;
  assign cd$a_compute_msg    = a_compute;
  assign cd$a_compute_val    = a_compute_val;
  assign cd$clk              = clk;
  assign cd$compute_mode     = compute_mode$out;
  assign cd$reset            = reset;
  assign cd$state_cmp        = state_cmp;
  assign cd$state_rst        = state_rst;
  assign cd$xbar_resp_msg    = xbar_resp_msg;
  assign cd$xbar_resp_val    = xbar_resp_val;
  assign cd$y_unloader_rdy   = y_unloader_rdy;
  assign compute_mode$clk    = clk;
  assign compute_mode$reset  = reset;
  assign drain_cb_fsm$clk    = clk;
  assign drain_cb_fsm$reset  = reset;
  assign fv$a_compute_rdy    = a_compute_rdy;
  assign fv$a_feeder_in_msg  = a_feeder_in_msg;
  assign fv$a_feeder_in_val  = a_feeder_in_val;
  assign fv$a_feeder_out_rdy = a_feeder_out_rdy;
  assign fv$blkdone_ack_msg  = blkdone_ack_msg;
  assign fv$blkdone_ack_val  = blkdone_ack_val;
  assign fv$blkdone_sig_rdy  = blkdone_sig_rdy;
  assign fv$clk              = clk;
  assign fv$compute_mode     = compute_mode$out;
  assign fv$reset            = reset;
  assign fv$state_cmp        = state_cmp;
  assign fv$state_rst        = state_rst;
  assign fv$x_id             = x_id$out;
  assign fv$xbar_req_rdy     = xbar_req_rdy;
  assign fv$xbar_val_rdy     = xbar_val_rdy;


  assign state$clk           = clk;
  assign state$reset         = reset;
  assign x_id$clk            = clk;
  assign x_id$reset          = reset;
  assign xbar_req_msg        = fv$xbar_req_msg;
  assign xbar_req_val        = fv$xbar_req_val;
  assign xbar_resp_rdy       = cd$xbar_resp_rdy;
  assign xbar_val_rdy        = cd$xbar_val_rdy;
  assign y_id$clk            = clk;
  assign y_id$reset          = reset;
  assign y_unloader_msg      = cd$y_unloader_msg;
  assign y_unloader_val      = cd$y_unloader_val;


  // PYMTL SOURCE:
  //
  // @s.combinational
  // def states():
  //       if s.state.out == s.state_idle:
  //         s.pe_id.rdy.value = True
  //         s.cm.rdy.value = True
  //       elif s.state.out == s.state_reset:
  //         s.x_id.in_.value = s.pe_id.msg.x_id
  //         s.y_id.in_.value = s.pe_id.msg.y_id
  //         s.compute_mode.in_.value = s.cm.msg
  //       else:
  //         s.pe_id.rdy.value = False
  //         s.cm.rdy.value = False
  //       # pass reset status to s.cd
  //       if s.state.out == s.state_reset:
  //         s.state_rst.value = True
  //       else:
  //         s.state_rst.value = False
  //       # pass compute status to s.fv and s.cd
  //       if s.state.out == s.state_compute:
  //         s.state_cmp.value = True
  //       else:
  //         s.state_cmp.value = False

  // logic for states()
  always @ (*) begin
    if ((state$out == state_idle)) begin
      pe_id_rdy = 1'b1;
      cm_rdy = 1'b1;
    end
    else begin
      if ((state$out == state_reset)) begin
        x_id$in_ = pe_id_msg[(64)-1:32];
        y_id$in_ = pe_id_msg[(32)-1:0];
        compute_mode$in_ = cm_msg;
      end
      else begin
        pe_id_rdy = 1'b0;
        cm_rdy = 1'b0;
      end
    end
    if ((state$out == state_reset)) begin
      state_rst = 1'b1;
    end
    else begin
      state_rst = 1'b0;
    end
    if ((state$out == state_compute)) begin
      state_cmp = 1'b1;
    end
    else begin
      state_cmp = 1'b0;
    end
  end

  // PYMTL SOURCE:
  //
  // @s.combinational
  // def next_state():
  //       # idle until pe_id valid
  //       if s.state.out == s.state_idle and s.pe_id.val and \
  //           s.cm.val:
  //         s.state.in_.value = s.state_reset
  //       elif s.state.out == s.state_reset:
  //         s.state.in_.value = s.state_compute
  //       elif s.state.out == s.state_compute and s.all_done:
  //         s.state.in_.value = s.state_idle

  // logic for next_state()
  always @ (*) begin
    if (((state$out == state_idle)&&pe_id_val&&cm_val)) begin
      state$in_ = state_reset;
    end
    else begin
      if ((state$out == state_reset)) begin
        state$in_ = state_compute;
      end
      else begin
        if (((state$out == state_compute)&&all_done)) begin
          state$in_ = state_idle;
        end
        else begin
        end
      end
    end
  end


endmodule // SparsePERTL_0x16afdb0276c863e5
`default_nettype wire

//-----------------------------------------------------------------------------
// Reg_0x3392d4dd30174d2
//-----------------------------------------------------------------------------
// PyMTL: dump_vcd = False
// PyMTL: pclib.rtl.regs {"dtype": 32}
// PyMTL: verilator_xinit = zeros
`default_nettype none
module Reg_0x3392d4dd30174d2
(
  input  wire [   0:0] clk,
  input  wire [  31:0] in_,
  output reg  [  31:0] out,
  input  wire [   0:0] reset
);



  // PYMTL SOURCE:
  //
  // @s.posedge_clk
  // def seq_logic():
  //       s.out.next = s.in_

  // logic for seq_logic()
  always @ (posedge clk) begin
    out <= in_;
  end


endmodule // Reg_0x3392d4dd30174d2
`default_nettype wire

//-----------------------------------------------------------------------------
// Reg_0x5e7e932e291f44db
//-----------------------------------------------------------------------------
// PyMTL: dump_vcd = False
// PyMTL: pclib.rtl.regs {"dtype": 1}
// PyMTL: verilator_xinit = zeros
`default_nettype none
module Reg_0x5e7e932e291f44db
(
  input  wire [   0:0] clk,
  input  wire [   0:0] in_,
  output reg  [   0:0] out,
  input  wire [   0:0] reset
);



  // PYMTL SOURCE:
  //
  // @s.posedge_clk
  // def seq_logic():
  //       s.out.next = s.in_

  // logic for seq_logic()
  always @ (posedge clk) begin
    out <= in_;
  end


endmodule // Reg_0x5e7e932e291f44db
`default_nettype wire

//-----------------------------------------------------------------------------
// Reg_0x5e7e932e28f17d92
//-----------------------------------------------------------------------------
// PyMTL: dump_vcd = False
// PyMTL: pclib.rtl.regs {"dtype": 2}
// PyMTL: verilator_xinit = zeros
`default_nettype none
module Reg_0x5e7e932e28f17d92
(
  input  wire [   0:0] clk,
  input  wire [   1:0] in_,
  output reg  [   1:0] out,
  input  wire [   0:0] reset
);



  // PYMTL SOURCE:
  //
  // @s.posedge_clk
  // def seq_logic():
  //       s.out.next = s.in_

  // logic for seq_logic()
  always @ (posedge clk) begin
    out <= in_;
  end


endmodule // Reg_0x5e7e932e28f17d92
`default_nettype wire

//-----------------------------------------------------------------------------
// fetch_values_0x2868aa3edaec330e
//-----------------------------------------------------------------------------
// PyMTL: dump_vcd = False
// PyMTL: spmm.fetch_values {"nbits": 32}
// PyMTL: verilator_xinit = zeros
`default_nettype none
module fetch_values_0x2868aa3edaec330e
(
  output wire [  63:0] a_compute_msg,
  input  wire [   0:0] a_compute_rdy,
  output wire [   0:0] a_compute_val,
  input  wire [  63:0] a_feeder_in_msg,
  output reg  [   0:0] a_feeder_in_rdy,
  input  wire [   0:0] a_feeder_in_val,
  output reg  [  63:0] a_feeder_out_msg,
  input  wire [   0:0] a_feeder_out_rdy,
  output reg  [   0:0] a_feeder_out_val,
  input  wire [  31:0] blkdone_ack_msg,
  output reg  [   0:0] blkdone_ack_rdy,
  input  wire [   0:0] blkdone_ack_val,
  output reg  [  31:0] blkdone_sig_msg,
  input  wire [   0:0] blkdone_sig_rdy,
  output reg  [   0:0] blkdone_sig_val,
  input  wire [   0:0] clk,
  input  wire [   0:0] compute_mode,
  input  wire [   0:0] reset,
  input  wire [   0:0] state_cmp,
  input  wire [   0:0] state_rst,
  input  wire [  31:0] x_id,
  output reg  [  31:0] xbar_req_msg,
  input  wire [   0:0] xbar_req_rdy,
  output reg  [   0:0] xbar_req_val,
  input  wire [   0:0] xbar_val_rdy
);

  // wire declarations
  wire   [  31:0] a_feeder_in_data;
  wire   [  31:0] a_feeder_in_colid;
  wire   [   0:0] count_val;


  // register declarations
  reg    [  31:0] a_colid_buf$in_;
  reg    [  31:0] a_colid_cmp$in_;
  reg    [  31:0] a_data_buf$in_;
  reg    [  31:0] a_data_cmp$in_;
  reg    [   0:0] a_rdy_con;
  reg    [   0:0] a_val_buf$in_;
  reg    [   0:0] clear$in_;
  reg    [   0:0] clear_neg;
  reg    [   0:0] clear_pos;
  reg    [   0:0] f_rdy_con;
  reg    [   0:0] finish_sr;
  reg    [   0:0] finish_xr;
  reg    [  31:0] length$in_;
  reg    [   0:0] s_rdy_con;
  reg    [   0:0] s_val_con;
  reg    [   0:0] stall_ar;
  reg    [   0:0] stall_ct;
  reg    [   0:0] stall_sr;
  reg    [   0:0] stall_xr;
  reg    [  31:0] temp1$in_;
  reg    [   0:0] x_rdy_con;

  // localparam declarations
  localparam nbits = 32;
  localparam p$JJ = 8;
  localparam p$KK = 8;
  localparam p$SYS_NUM_COLS = 8;
  localparam p$m2 = 4294967294;
  localparam p$m3 = 4294967293;











  // a_data_buf temporaries
  wire   [   0:0] a_data_buf$clk;
  wire   [   0:0] a_data_buf$reset;
  wire   [  31:0] a_data_buf$out;

  Reg_0x3392d4dd30174d2 a_data_buf
  (
    .clk   ( a_data_buf$clk ),
    .reset ( a_data_buf$reset ),
    .in_   ( a_data_buf$in_ ),
    .out   ( a_data_buf$out )
  );

  // a_colid_buf temporaries
  wire   [   0:0] a_colid_buf$clk;
  wire   [   0:0] a_colid_buf$reset;
  wire   [  31:0] a_colid_buf$out;

  Reg_0x3392d4dd30174d2 a_colid_buf
  (
    .clk   ( a_colid_buf$clk ),
    .reset ( a_colid_buf$reset ),
    .in_   ( a_colid_buf$in_ ),
    .out   ( a_colid_buf$out )
  );

  // a_val_buf temporaries
  wire   [   0:0] a_val_buf$clk;
  wire   [   0:0] a_val_buf$reset;
  wire   [   0:0] a_val_buf$out;

  Reg_0x5e7e932e291f44db a_val_buf
  (
    .clk   ( a_val_buf$clk ),
    .reset ( a_val_buf$reset ),
    .in_   ( a_val_buf$in_ ),
    .out   ( a_val_buf$out )
  );

  // a_rdy_buf temporaries
  wire   [   0:0] a_rdy_buf$clk;
  wire   [   0:0] a_rdy_buf$reset;
  wire   [   0:0] a_rdy_buf$in_;
  wire   [   0:0] a_rdy_buf$out;

  Reg_0x5e7e932e291f44db a_rdy_buf
  (
    .clk   ( a_rdy_buf$clk ),
    .reset ( a_rdy_buf$reset ),
    .in_   ( a_rdy_buf$in_ ),
    .out   ( a_rdy_buf$out )
  );

  // a_data_cmp temporaries
  wire   [   0:0] a_data_cmp$clk;
  wire   [   0:0] a_data_cmp$reset;
  wire   [  31:0] a_data_cmp$out;

  Reg_0x3392d4dd30174d2 a_data_cmp
  (
    .clk   ( a_data_cmp$clk ),
    .reset ( a_data_cmp$reset ),
    .in_   ( a_data_cmp$in_ ),
    .out   ( a_data_cmp$out )
  );

  // a_colid_cmp temporaries
  wire   [   0:0] a_colid_cmp$clk;
  wire   [   0:0] a_colid_cmp$reset;
  wire   [  31:0] a_colid_cmp$out;

  Reg_0x3392d4dd30174d2 a_colid_cmp
  (
    .clk   ( a_colid_cmp$clk ),
    .reset ( a_colid_cmp$reset ),
    .in_   ( a_colid_cmp$in_ ),
    .out   ( a_colid_cmp$out )
  );

  // temp1 temporaries
  wire   [   0:0] temp1$clk;
  wire   [   0:0] temp1$reset;
  wire   [  31:0] temp1$out;

  Reg_0x3392d4dd30174d2 temp1
  (
    .clk   ( temp1$clk ),
    .reset ( temp1$reset ),
    .in_   ( temp1$in_ ),
    .out   ( temp1$out )
  );

  // length temporaries
  wire   [   0:0] length$clk;
  wire   [   0:0] length$reset;
  wire   [  31:0] length$out;

  Reg_0x3392d4dd30174d2 length
  (
    .clk   ( length$clk ),
    .reset ( length$reset ),
    .in_   ( length$in_ ),
    .out   ( length$out )
  );

  // clear temporaries
  wire   [   0:0] clear$clk;
  wire   [   0:0] clear$reset;
  wire   [   0:0] clear$out;

  Reg_0x5e7e932e291f44db clear
  (
    .clk   ( clear$clk ),
    .reset ( clear$reset ),
    .in_   ( clear$in_ ),
    .out   ( clear$out )
  );

  // signal connections
  assign a_colid_buf$clk      = clk;
  assign a_colid_buf$reset    = reset;
  assign a_colid_cmp$clk      = clk;
  assign a_colid_cmp$reset    = reset;
  assign a_compute_msg[31:0]  = a_colid_cmp$out;
  assign a_compute_msg[63:32] = a_data_cmp$out;
  assign a_compute_val        = a_val_buf$out;
  assign a_data_buf$clk       = clk;
  assign a_data_buf$reset     = reset;
  assign a_data_cmp$clk       = clk;
  assign a_data_cmp$reset     = reset;
  assign a_feeder_in_colid    = a_feeder_in_msg[31:0];
  assign a_feeder_in_data     = a_feeder_in_msg[63:32];
  assign a_rdy_buf$clk        = clk;
  assign a_rdy_buf$in_        = a_compute_rdy;
  assign a_rdy_buf$reset      = reset;
  assign a_val_buf$clk        = clk;
  assign a_val_buf$reset      = reset;
  assign clear$clk            = clk;
  assign clear$reset          = reset;
  assign length$clk           = clk;
  assign length$reset         = reset;


  assign temp1$clk            = clk;
  assign temp1$reset          = reset;


  // PYMTL SOURCE:
  //
  // @s.tick_rtl
  // def a_feeder_rdy():
  //       if s.state_rst:
  //         s.a_feeder_in.rdy.next = True
  //         s.stall_ar.next = False
  //         s.stall_xr.next = False
  //       elif s.state_cmp:
  //         s.a_feeder_in.rdy.next = s.a_rdy_con and s.x_rdy_con and \
  //             s.s_rdy_con and s.s_val_con and s.f_rdy_con and s.a_compute.rdy
  //         # stall signal for forwarding a 
  //         if s.x_id != s.p.SYS_NUM_COLS-1:
  //           if (not s.a_feeder_out.rdy) and (s.a_feeder_out.val):
  //             s.stall_ar.next = True
  //           else:
  //             s.stall_ar.next = False
  //         else:
  //           s.stall_ar.next = False
  //         # stall signal for sending xbar req
  //         #if s.a_feeder_in_colid[nbits-1:nbits] == 0 or s.finish_xr:
  //         if s.a_feeder_in_colid[nbits-1:nbits] == 0 or s.finish_xr:
  //           if (not s.xbar_req.rdy) and (s.xbar_req.val):
  //             s.stall_xr.next = True
  //             s.finish_xr.next = True
  //           else:
  //             s.stall_xr.next = False
  //             s.finish_xr.next = False
  //         else:
  //           s.stall_xr.next = False
  //           s.finish_xr.next = True
  //         # stall signal for changing tiles
  //         if s.a_feeder_in_colid == s.p.m2 or s.finish_sr:
  //           if (not s.blkdone_sig.rdy) and (s.blkdone_sig.val):
  //             s.stall_sr.next = True
  //             s.finish_sr.next = True
  //           else:
  //             s.stall_sr.next = False
  //             s.finish_sr.next = False
  //         else:
  //           s.stall_sr.next = False
  //           s.finish_sr.next = True

  // logic for a_feeder_rdy()
  always @ (posedge clk) begin
    if (state_rst) begin
      a_feeder_in_rdy <= 1'b1;
      stall_ar <= 1'b0;
      stall_xr <= 1'b0;
    end
    else begin
      if (state_cmp) begin
        a_feeder_in_rdy <= (a_rdy_con&&x_rdy_con&&s_rdy_con&&s_val_con&&f_rdy_con&&a_compute_rdy);
        if ((x_id != (p$SYS_NUM_COLS-1))) begin
          if ((!a_feeder_out_rdy&&a_feeder_out_val)) begin
            stall_ar <= 1'b1;
          end
          else begin
            stall_ar <= 1'b0;
          end
        end
        else begin
          stall_ar <= 1'b0;
        end
        if (((a_feeder_in_colid[(nbits)-1:(nbits-1)] == 0)||finish_xr)) begin
          if ((!xbar_req_rdy&&xbar_req_val)) begin
            stall_xr <= 1'b1;
            finish_xr <= 1'b1;
          end
          else begin
            stall_xr <= 1'b0;
            finish_xr <= 1'b0;
          end
        end
        else begin
          stall_xr <= 1'b0;
          finish_xr <= 1'b1;
        end
        if (((a_feeder_in_colid == p$m2)||finish_sr)) begin
          if ((!blkdone_sig_rdy&&blkdone_sig_val)) begin
            stall_sr <= 1'b1;
            finish_sr <= 1'b1;
          end
          else begin
            stall_sr <= 1'b0;
            finish_sr <= 1'b0;
          end
        end
        else begin
          stall_sr <= 1'b0;
          finish_sr <= 1'b1;
        end
      end
      else begin
      end
    end
  end

  // PYMTL SOURCE:
  //
  // @s.combinational
  // def ctlpath():
  //       if s.state_cmp:
  //         # propagate valid and ready signal
  //         # forward a value if required 
  //         if s.x_id != s.p.SYS_NUM_COLS-1:
  //           s.f_rdy_con.value = s.a_feeder_out.rdy
  //           if s.stall_ar:
  //             s.a_feeder_out.val.value = True
  //           else:
  //             s.a_feeder_out.val.value = s.a_feeder_in.val and s.a_feeder_in.rdy
  //         else:
  //           s.a_feeder_out.val.value = False
  //           s.f_rdy_con.value = True
  //         # col_id > 0; send reqs to xbar for b
  //         if s.compute_mode:
  //           if s.a_feeder_in_colid[nbits-1:nbits] == 0:
  //             #==================== patch 1: random_delay_xbar =======================
  //             if s.a_feeder_in.val and s.a_feeder_in.rdy:
  //               s.x_rdy_con.value = s.xbar_req.rdy
  //             else:
  //               s.x_rdy_con.value = True and (not s.stall_xr)
  //             #==================== patch 1 end =======================
  //             if s.stall_xr:
  //               s.xbar_req.val.value = True
  //             else:
  //               s.xbar_req.val.value = s.a_feeder_in.val and s.a_feeder_in.rdy
  //           else:
  //             if s.stall_xr:
  //               s.xbar_req.val.value = True
  //               s.x_rdy_con.value = s.xbar_req.rdy
  //             else:
  //               s.xbar_req.val.value = False
  //               s.x_rdy_con.value = True
  //         else:
  //           s.x_rdy_con.value = True
  //         # col_id > 0; valid value for MAC operation
  //         #==================== patch 2: fix bug with random xbar_resp delay  =======================
  //         #==================== patch for number_vec == 1 =======================
  //         if s.p.JJ/s.p.SYS_NUM_COLS == 1:
  //           s.a_rdy_con.value = True
  //           s.a_val_buf.in_.value = (s.a_feeder_in.val and s.a_feeder_in.rdy) or \
  //               (not s.a_rdy_buf.out)
  //         #==================== patch end =======================================
  //         # using s.a_rdy_buf.out for propogating delay signal
  //         # NOTE that the following else branch is not being UPDATED!
  //         #==================== patch2 ==========================================================
  //         else:
  //           if s.a_feeder_in_colid[nbits-1:nbits] == 0:  
  //             s.a_rdy_con.value = not (s.stall_ct)
  //             s.a_val_buf.in_.value = (s.a_feeder_in.val and s.a_feeder_in.rdy) or \
  //                 (s.stall_ct) or (not s.a_compute.rdy) or s.clear_pos
  //           else:
  //             s.a_val_buf.in_.value = False or (s.stall_ct) \
  //                 or (not s.a_compute.rdy) or s.clear_neg
  //             s.a_rdy_con.value = not (s.stall_ct)
  //         # col_id = -2, send blkdone to b_feeder to change tile
  //         # hard coded for 32-bit *defined in data_structs
  //         if s.a_feeder_in_colid == s.p.m2:
  //           s.s_rdy_con.value = s.blkdone_sig.rdy # refer to patch1!
  //           if s.stall_sr:
  //             s.blkdone_sig.val.value = True
  //           else:
  //             s.blkdone_sig.val.value = s.a_feeder_in.val and s.a_feeder_in.rdy
  //         else:
  //           if s.stall_sr:
  //             s.blkdone_sig.val.value = True
  //             s.s_rdy_con.value = s.blkdone_sig.rdy
  //           else:
  //             s.blkdone_sig.val.value = False
  //             s.s_rdy_con.value = True
  //         # now waiting for the blkdone ack signal
  //         # is it necessary?
  //         if s.a_feeder_in_colid == s.p.m2:
  //           s.s_val_con.value = s.blkdone_ack.val # refer to patch1!
  //           s.blkdone_ack.rdy.value = s.a_feeder_in.val and s.a_feeder_in.rdy
  //         else:
  //           s.blkdone_ack.rdy.value = False
  //           s.s_val_con.value = True

  // logic for ctlpath()
  always @ (*) begin
    if (state_cmp) begin
      if ((x_id != (p$SYS_NUM_COLS-1))) begin
        f_rdy_con = a_feeder_out_rdy;
        if (stall_ar) begin
          a_feeder_out_val = 1'b1;
        end
        else begin
          a_feeder_out_val = (a_feeder_in_val&&a_feeder_in_rdy);
        end
      end
      else begin
        a_feeder_out_val = 1'b0;
        f_rdy_con = 1'b1;
      end
      if (compute_mode) begin
        if ((a_feeder_in_colid[(nbits)-1:(nbits-1)] == 0)) begin
          if ((a_feeder_in_val&&a_feeder_in_rdy)) begin
            x_rdy_con = xbar_req_rdy;
          end
          else begin
            x_rdy_con = (1'b1&&!stall_xr);
          end
          if (stall_xr) begin
            xbar_req_val = 1'b1;
          end
          else begin
            xbar_req_val = (a_feeder_in_val&&a_feeder_in_rdy);
          end
        end
        else begin
          if (stall_xr) begin
            xbar_req_val = 1'b1;
            x_rdy_con = xbar_req_rdy;
          end
          else begin
            xbar_req_val = 1'b0;
            x_rdy_con = 1'b1;
          end
        end
      end
      else begin
        x_rdy_con = 1'b1;
      end
      if (((p$JJ/p$SYS_NUM_COLS) == 1)) begin
        a_rdy_con = 1'b1;
        a_val_buf$in_ = ((a_feeder_in_val&&a_feeder_in_rdy)||!a_rdy_buf$out);
      end
      else begin
        if ((a_feeder_in_colid[(nbits)-1:(nbits-1)] == 0)) begin
          a_rdy_con = !stall_ct;
          a_val_buf$in_ = ((a_feeder_in_val&&a_feeder_in_rdy)||stall_ct||!a_compute_rdy||clear_pos);
        end
        else begin
          a_val_buf$in_ = (1'b0||stall_ct||!a_compute_rdy||clear_neg);
          a_rdy_con = !stall_ct;
        end
      end
      if ((a_feeder_in_colid == p$m2)) begin
        s_rdy_con = blkdone_sig_rdy;
        if (stall_sr) begin
          blkdone_sig_val = 1'b1;
        end
        else begin
          blkdone_sig_val = (a_feeder_in_val&&a_feeder_in_rdy);
        end
      end
      else begin
        if (stall_sr) begin
          blkdone_sig_val = 1'b1;
          s_rdy_con = blkdone_sig_rdy;
        end
        else begin
          blkdone_sig_val = 1'b0;
          s_rdy_con = 1'b1;
        end
      end
      if ((a_feeder_in_colid == p$m2)) begin
        s_val_con = blkdone_ack_val;
        blkdone_ack_rdy = (a_feeder_in_val&&a_feeder_in_rdy);
      end
      else begin
        blkdone_ack_rdy = 1'b0;
        s_val_con = 1'b1;
      end
    end
    else begin
    end
  end

  // PYMTL SOURCE:
  //
  // @s.combinational
  // def datapath():
  //       if s.state_rst:
  //         s.a_colid_buf.in_.value = s.p.m3
  //       elif s.state_cmp:
  //         # buffer data for forwarding, sending reqs, etc.
  //         if s.a_feeder_in.val and s.a_feeder_in.rdy:
  //           s.a_data_buf.in_.value  = s.a_feeder_in_data
  //           if s.compute_mode: # reduce switching activity
  //             s.a_colid_buf.in_.value = s.a_feeder_in_colid
  //           else:
  //             s.a_colid_buf.in_.value = s.a_colid_buf.out
  //         else:
  //           s.a_data_buf.in_.value  = s.a_data_buf.out
  //           s.a_colid_buf.in_.value = s.a_colid_buf.out
  //         # buffer data for MAC operations
  //         if s.a_feeder_in.val and s.a_feeder_in.rdy and \
  //             s.a_compute.rdy:
  //           s.a_data_cmp.in_.value  = s.a_feeder_in_data
  //           if s.compute_mode: # reduce switching activity
  //             s.a_colid_cmp.in_.value = s.a_feeder_in_colid
  //           else:
  //             s.a_colid_cmp.in_.value = s.a_colid_cmp.out
  //         else:
  //           #if s.a_compute.rdy and (s.length.out == s.p.JJ/s.p.SYS_NUM_COLS-1):
  //           if s.a_compute.rdy:
  //             s.a_data_cmp.in_.value  = s.a_data_buf.out
  //             if s.compute_mode: # reduce switching activity
  //               s.a_colid_cmp.in_.value = s.a_colid_buf.out
  //             else:
  //               s.a_colid_cmp.in_.value = s.a_colid_cmp.out
  //           else:
  //             s.a_data_cmp.in_.value  = s.a_data_cmp.out
  //             s.a_colid_cmp.in_.value = s.a_colid_cmp.out
  //       # forward a value if required
  //       # dense design: put 0 in all registers related to col_id
  //       if s.stall_ar:
  //         s.a_feeder_out.msg.data.value = s.a_data_buf.out
  //         s.a_feeder_out.msg.col_id.value = s.a_colid_buf.out
  //       else:
  //         s.a_feeder_out.msg.data.value = s.a_feeder_in.msg.data
  //         s.a_feeder_out.msg.col_id.value = s.a_feeder_in.msg.col_id
  //       # send reqs to xbar for b
  //       if s.compute_mode: # reduce switching activity
  //         if s.stall_xr:
  //           s.xbar_req.msg.value = s.a_colid_buf.out & (s.p.KK-1)
  //         else:
  //           s.xbar_req.msg.value = s.a_feeder_in_colid & (s.p.KK-1)
  //       else:
  //           s.xbar_req.msg.value = 0
  //
  //       # col_id = -2, send blkdone to b_feeder to change tile
  //       s.blkdone_sig.msg.value = True
  //       # now waiting for the blkdone ack signal
  //       # is it necessary?
  //       s.temp1.in_.value = s.blkdone_ack.msg
  //       # update length
  //       if s.state_rst:
  //         s.stall_ct.value = False
  //         s.clear.in_.value = False
  //       if s.state_cmp:
  //         if s.a_feeder_in.rdy and s.a_feeder_in.val and \
  //             s.a_feeder_in_colid[nbits-1:nbits] == 0:
  //           s.stall_ct.value = True
  //         else:
  //           # stop stalling
  //           #if s.xbar_val_rdy:
  //           if (s.length.out.value+1) == (s.p.JJ/s.p.SYS_NUM_COLS-1):
  //             s.stall_ct.value = False
  //             #else:
  //               #s.stall_ct.value = True
  //
  //         #if s.stall_ct:
  //         if s.length.out == s.p.JJ/s.p.SYS_NUM_COLS-1:
  //           if s.xbar_val_rdy:
  //             s.length.in_.value = 0
  //           else:
  //             s.length.in_.value = s.length.out
  //           if s.stall_ct:
  //             s.clear.in_.value = False
  //         else:
  //           if s.xbar_val_rdy:
  //             s.length.in_.value = s.length.out + 1
  //             # clear value
  //             if (s.length.out.value+1) == (s.p.JJ/s.p.SYS_NUM_COLS-1):
  //               s.clear.in_.value = True
  //             else:
  //               s.clear.in_.value = False
  //           else:
  //             if s.stall_ct:
  //               s.clear.in_.value = False
  //             else:
  //               s.clear.in_.value = s.clear.out
  //             s.length.in_.value = s.length.out
  //         #else:
  //         if s.clear.out and (not s.stall_ct):
  //           s.length.in_.value = 0
  //         else:
  //           if s.xbar_val_rdy:
  //             if s.length.out == s.p.JJ/s.p.SYS_NUM_COLS-1:
  //               s.length.in_.value = 0
  //             else:
  //               s.length.in_.value = s.length.out + 1
  //           else:
  //             s.length.in_.value = s.length.out
  //
  //         # clear pos neg
  //         if s.clear.out:
  //           s.clear_neg.value = False
  //           s.clear_pos.value = False
  //         else:
  //           if s.length.out == s.p.JJ/s.p.SYS_NUM_COLS-1:
  //             s.clear_neg.value = False
  //             s.clear_pos.value = False
  //           else:
  //             # clear neg values 
  //             if (s.length.out.value+1) == (s.p.JJ/s.p.SYS_NUM_COLS-1) and \
  //               s.a_feeder_in_colid[nbits-1:nbits] != 0:
  //               s.clear_neg.value = True
  //             else:
  //               s.clear_neg.value = False
  //             # clear pos values
  //             if (s.length.out.value+1) == (s.p.JJ/s.p.SYS_NUM_COLS-1) and \
  //               s.a_feeder_in_colid[nbits-1:nbits] == 0:
  //               s.clear_pos.value = True
  //             else:
  //               s.clear_pos.value = False

  // logic for datapath()
  always @ (*) begin
    if (state_rst) begin
      a_colid_buf$in_ = p$m3;
    end
    else begin
      if (state_cmp) begin
        if ((a_feeder_in_val&&a_feeder_in_rdy)) begin
          a_data_buf$in_ = a_feeder_in_data;
          if (compute_mode) begin
            a_colid_buf$in_ = a_feeder_in_colid;
          end
          else begin
            a_colid_buf$in_ = a_colid_buf$out;
          end
        end
        else begin
          a_data_buf$in_ = a_data_buf$out;
          a_colid_buf$in_ = a_colid_buf$out;
        end
        if ((a_feeder_in_val&&a_feeder_in_rdy&&a_compute_rdy)) begin
          a_data_cmp$in_ = a_feeder_in_data;
          if (compute_mode) begin
            a_colid_cmp$in_ = a_feeder_in_colid;
          end
          else begin
            a_colid_cmp$in_ = a_colid_cmp$out;
          end
        end
        else begin
          if (a_compute_rdy) begin
            a_data_cmp$in_ = a_data_buf$out;
            if (compute_mode) begin
              a_colid_cmp$in_ = a_colid_buf$out;
            end
            else begin
              a_colid_cmp$in_ = a_colid_cmp$out;
            end
          end
          else begin
            a_data_cmp$in_ = a_data_cmp$out;
            a_colid_cmp$in_ = a_colid_cmp$out;
          end
        end
      end
      else begin
      end
    end
    if (stall_ar) begin
      a_feeder_out_msg[(64)-1:32] = a_data_buf$out;
      a_feeder_out_msg[(32)-1:0] = a_colid_buf$out;
    end
    else begin
      a_feeder_out_msg[(64)-1:32] = a_feeder_in_msg[(64)-1:32];
      a_feeder_out_msg[(32)-1:0] = a_feeder_in_msg[(32)-1:0];
    end
    if (compute_mode) begin
      if (stall_xr) begin
        xbar_req_msg = (a_colid_buf$out&(p$KK-1));
      end
      else begin
        xbar_req_msg = (a_feeder_in_colid&(p$KK-1));
      end
    end
    else begin
      xbar_req_msg = 0;
    end
    blkdone_sig_msg = 1'b1;
    temp1$in_ = blkdone_ack_msg;
    if (state_rst) begin
      stall_ct = 1'b0;
      clear$in_ = 1'b0;
    end
    else begin
    end
    if (state_cmp) begin
      if ((a_feeder_in_rdy&&a_feeder_in_val&&(a_feeder_in_colid[(nbits)-1:(nbits-1)] == 0))) begin
        stall_ct = 1'b1;
      end
      else begin
        if (((length$out+1) == ((p$JJ/p$SYS_NUM_COLS)-1))) begin
          stall_ct = 1'b0;
        end
        else begin
        end
      end
      if ((length$out == ((p$JJ/p$SYS_NUM_COLS)-1))) begin
        if (xbar_val_rdy) begin
          length$in_ = 0;
        end
        else begin
          length$in_ = length$out;
        end
        if (stall_ct) begin
          clear$in_ = 1'b0;
        end
        else begin
        end
      end
      else begin
        if (xbar_val_rdy) begin
          length$in_ = (length$out+1);
          if (((length$out+1) == ((p$JJ/p$SYS_NUM_COLS)-1))) begin
            clear$in_ = 1'b1;
          end
          else begin
            clear$in_ = 1'b0;
          end
        end
        else begin
          if (stall_ct) begin
            clear$in_ = 1'b0;
          end
          else begin
            clear$in_ = clear$out;
          end
          length$in_ = length$out;
        end
      end
      if ((clear$out&&!stall_ct)) begin
        length$in_ = 0;
      end
      else begin
        if (xbar_val_rdy) begin
          if ((length$out == ((p$JJ/p$SYS_NUM_COLS)-1))) begin
            length$in_ = 0;
          end
          else begin
            length$in_ = (length$out+1);
          end
        end
        else begin
          length$in_ = length$out;
        end
      end
      if (clear$out) begin
        clear_neg = 1'b0;
        clear_pos = 1'b0;
      end
      else begin
        if ((length$out == ((p$JJ/p$SYS_NUM_COLS)-1))) begin
          clear_neg = 1'b0;
          clear_pos = 1'b0;
        end
        else begin
          if ((((length$out+1) == ((p$JJ/p$SYS_NUM_COLS)-1))&&(a_feeder_in_colid[(nbits)-1:(nbits-1)] != 0))) begin
            clear_neg = 1'b1;
          end
          else begin
            clear_neg = 1'b0;
          end
          if ((((length$out+1) == ((p$JJ/p$SYS_NUM_COLS)-1))&&(a_feeder_in_colid[(nbits)-1:(nbits-1)] == 0))) begin
            clear_pos = 1'b1;
          end
          else begin
            clear_pos = 1'b0;
          end
        end
      end
    end
    else begin
    end
  end


endmodule // fetch_values_0x2868aa3edaec330e
`default_nettype wire

//-----------------------------------------------------------------------------
// compute_drain_0x3ddd647ff49d40d6
//-----------------------------------------------------------------------------
// PyMTL: dump_vcd = False
// PyMTL: spmm.compute_drain {"nbits": 32}
// PyMTL: verilator_xinit = zeros
`default_nettype none
module compute_drain_0x3ddd647ff49d40d6
(
  input  wire [  63:0] a_compute_msg,
  output reg  [   0:0] a_compute_rdy,
  input  wire [   0:0] a_compute_val,
  output wire [   0:0] all_done,
  input  wire [   0:0] clk,
  input  wire [   0:0] compute_mode,
  input  wire [   0:0] reset,
  input  wire [   0:0] state_cmp,
  input  wire [   0:0] state_rst,
  input  wire [  63:0] xbar_resp_msg,
  output reg  [   0:0] xbar_resp_rdy,
  input  wire [   0:0] xbar_resp_val,
  output reg  [   0:0] xbar_val_rdy,
  output reg  [ 127:0] y_unloader_msg,
  input  wire [   0:0] y_unloader_rdy,
  output reg  [   0:0] y_unloader_val
);

  // wire declarations
  wire   [  31:0] a_compute_data;
  wire   [  31:0] a_compute_colid;
  wire   [  31:0] vec_b$000;
  wire   [  31:0] vec_b$001;
  wire   [  31:0] vec_c$000;
  wire   [  31:0] vec_c$001;
  wire   [  31:0] cd$000;
  wire   [  31:0] cd$001;
  wire   [   0:0] a_rdy_con;
  wire   [   0:0] x_rdy_con;
  wire   [   0:0] drain_rdy_con;
  wire   [   0:0] mac_done;
  wire   [  31:0] mac_res$000;
  wire   [  31:0] mac_res$001;
  wire   [   0:0] mac_req_rdy$000;
  wire   [   0:0] mac_req_rdy$001;
  wire   [   0:0] mac_resp_val$000;
  wire   [   0:0] mac_resp_val$001;


  // register declarations
  reg    [   0:0] a_val_con;
  reg    [   0:0] a_val_value;
  reg    [  31:0] ccount$in_;
  reg    [   0:0] db_value_val;
  reg    [  31:0] dcount$in_;
  reg    [   0:0] drain_rdy;
  reg    [  31:0] drain_row_id$in_;
  reg    [   0:0] drain_val;
  reg    [   0:0] finish_update;
  reg    [   0:0] first_m1;
  reg    [   0:0] mac_req_rdyv;
  reg    [   0:0] mac_req_val;
  reg    [   0:0] mac_resp_rdy;
  reg    [   0:0] mac_resp_rdy_next;
  reg    [   0:0] mac_resp_valv;
  reg    [   0:0] mac_val_con;
  reg    [  31:0] mcount$in_;
  reg    [   0:0] r_idx;
  reg    [   0:0] r_rdy_con;
  reg    [   0:0] row_id_buf$en;
  reg    [  31:0] row_id_buf$in_;
  reg    [   0:0] row_id_buf_rdy$in_;
  reg    [   0:0] row_id_buf_val;
  reg    [   0:0] unload_rdy_con;
  reg    [  31:0] val_data;
  reg    [   0:0] w_idx;
  reg    [   0:0] x_val_con;

  // localparam declarations
  localparam nbits = 32;
  localparam p$JJ = 8;
  localparam p$J_VEC_SZ = 2;
  localparam p$KK = 8;
  localparam p$SYS_NUM_COLS = 8;
  localparam p$m1 = 4294967295;
  localparam p$m2 = 4294967294;

  // loop variable declarations
  integer i;
  integer j;











  // row_id_buf temporaries
  wire   [   0:0] row_id_buf$clk;
  wire   [   0:0] row_id_buf$reset;
  wire   [  31:0] row_id_buf$out;

  RegEn_0x3392d4dd30174d2 row_id_buf
  (
    .clk   ( row_id_buf$clk ),
    .reset ( row_id_buf$reset ),
    .in_   ( row_id_buf$in_ ),
    .en    ( row_id_buf$en ),
    .out   ( row_id_buf$out )
  );

  // row_id_buf_rdy temporaries
  wire   [   0:0] row_id_buf_rdy$clk;
  wire   [   0:0] row_id_buf_rdy$reset;
  wire   [   0:0] row_id_buf_rdy$out;

  Reg_0x5e7e932e291f44db row_id_buf_rdy
  (
    .clk   ( row_id_buf_rdy$clk ),
    .reset ( row_id_buf_rdy$reset ),
    .in_   ( row_id_buf_rdy$in_ ),
    .out   ( row_id_buf_rdy$out )
  );

  // drain_counter temporaries
  wire   [   0:0] drain_counter$clk;
  wire   [   0:0] drain_counter$reset;
  wire   [  31:0] drain_counter$in_;
  wire   [  31:0] drain_counter$out;

  Reg_0x3392d4dd30174d2 drain_counter
  (
    .clk   ( drain_counter$clk ),
    .reset ( drain_counter$reset ),
    .in_   ( drain_counter$in_ ),
    .out   ( drain_counter$out )
  );

  // drain_row_id temporaries
  wire   [   0:0] drain_row_id$clk;
  wire   [   0:0] drain_row_id$reset;
  wire   [  31:0] drain_row_id$out;

  Reg_0x3392d4dd30174d2 drain_row_id
  (
    .clk   ( drain_row_id$clk ),
    .reset ( drain_row_id$reset ),
    .in_   ( drain_row_id$in_ ),
    .out   ( drain_row_id$out )
  );

  // mcount temporaries
  wire   [   0:0] mcount$clk;
  wire   [   0:0] mcount$reset;
  wire   [  31:0] mcount$out;

  Reg_0x3392d4dd30174d2 mcount
  (
    .clk   ( mcount$clk ),
    .reset ( mcount$reset ),
    .in_   ( mcount$in_ ),
    .out   ( mcount$out )
  );

  // dcount temporaries
  wire   [   0:0] dcount$clk;
  wire   [   0:0] dcount$reset;
  wire   [  31:0] dcount$out;

  Reg_0x3392d4dd30174d2 dcount
  (
    .clk   ( dcount$clk ),
    .reset ( dcount$reset ),
    .in_   ( dcount$in_ ),
    .out   ( dcount$out )
  );

  // ccount temporaries
  wire   [   0:0] ccount$clk;
  wire   [   0:0] ccount$reset;
  wire   [  31:0] ccount$out;

  Reg_0x3392d4dd30174d2 ccount
  (
    .clk   ( ccount$clk ),
    .reset ( ccount$reset ),
    .in_   ( ccount$in_ ),
    .out   ( ccount$out )
  );

  // cb$000 temporaries
  wire   [   0:0] cb$000$clk;
  wire   [   0:0] cb$000$reset;
  wire   [  31:0] cb$000$in_;
  wire   [  31:0] cb$000$out;

  Reg_0x3392d4dd30174d2 cb$000
  (
    .clk   ( cb$000$clk ),
    .reset ( cb$000$reset ),
    .in_   ( cb$000$in_ ),
    .out   ( cb$000$out )
  );

  // cb$001 temporaries
  wire   [   0:0] cb$001$clk;
  wire   [   0:0] cb$001$reset;
  wire   [  31:0] cb$001$in_;
  wire   [  31:0] cb$001$out;

  Reg_0x3392d4dd30174d2 cb$001
  (
    .clk   ( cb$001$clk ),
    .reset ( cb$001$reset ),
    .in_   ( cb$001$in_ ),
    .out   ( cb$001$out )
  );

  // cb$002 temporaries
  wire   [   0:0] cb$002$clk;
  wire   [   0:0] cb$002$reset;
  wire   [  31:0] cb$002$in_;
  wire   [  31:0] cb$002$out;

  Reg_0x3392d4dd30174d2 cb$002
  (
    .clk   ( cb$002$clk ),
    .reset ( cb$002$reset ),
    .in_   ( cb$002$in_ ),
    .out   ( cb$002$out )
  );

  // cb$003 temporaries
  wire   [   0:0] cb$003$clk;
  wire   [   0:0] cb$003$reset;
  wire   [  31:0] cb$003$in_;
  wire   [  31:0] cb$003$out;

  Reg_0x3392d4dd30174d2 cb$003
  (
    .clk   ( cb$003$clk ),
    .reset ( cb$003$reset ),
    .in_   ( cb$003$in_ ),
    .out   ( cb$003$out )
  );

  // mac$000 temporaries
  wire   [   0:0] mac$000$clk;
  wire   [   0:0] mac$000$reset;
  wire   [  95:0] mac$000$req_msg;
  wire   [   0:0] mac$000$req_val;
  wire   [   0:0] mac$000$resp_rdy;
  wire   [   0:0] mac$000$req_rdy;
  wire   [  31:0] mac$000$resp_msg;
  wire   [   0:0] mac$000$resp_val;

  MACUnit_0x2e562212793116f1 mac$000
  (
    .clk      ( mac$000$clk ),
    .reset    ( mac$000$reset ),
    .req_msg  ( mac$000$req_msg ),
    .req_val  ( mac$000$req_val ),
    .resp_rdy ( mac$000$resp_rdy ),
    .req_rdy  ( mac$000$req_rdy ),
    .resp_msg ( mac$000$resp_msg ),
    .resp_val ( mac$000$resp_val )
  );

  // mac$001 temporaries
  wire   [   0:0] mac$001$clk;
  wire   [   0:0] mac$001$reset;
  wire   [  95:0] mac$001$req_msg;
  wire   [   0:0] mac$001$req_val;
  wire   [   0:0] mac$001$resp_rdy;
  wire   [   0:0] mac$001$req_rdy;
  wire   [  31:0] mac$001$resp_msg;
  wire   [   0:0] mac$001$resp_val;

  MACUnit_0x2e562212793116f1 mac$001
  (
    .clk      ( mac$001$clk ),
    .reset    ( mac$001$reset ),
    .req_msg  ( mac$001$req_msg ),
    .req_val  ( mac$001$req_val ),
    .resp_rdy ( mac$001$resp_rdy ),
    .req_rdy  ( mac$001$req_rdy ),
    .resp_msg ( mac$001$resp_msg ),
    .resp_val ( mac$001$resp_val )
  );

  // signal connections
  assign a_compute_colid        = a_compute_msg[31:0];
  assign a_compute_data         = a_compute_msg[63:32];
  assign cb$000$clk             = clk;
  assign cb$000$reset           = reset;
  assign cb$001$clk             = clk;
  assign cb$001$reset           = reset;
  assign cb$002$clk             = clk;
  assign cb$002$reset           = reset;
  assign cb$003$clk             = clk;
  assign cb$003$reset           = reset;
  assign ccount$clk             = clk;
  assign ccount$reset           = reset;
  assign dcount$clk             = clk;
  assign dcount$reset           = reset;
  assign drain_counter$clk      = clk;
  assign drain_counter$reset    = reset;
  assign drain_row_id$clk       = clk;
  assign drain_row_id$reset     = reset;
  assign mac$000$clk            = clk;
  assign mac$000$req_msg[31:0]  = vec_c$000;
  assign mac$000$req_msg[63:32] = vec_b$000;
  assign mac$000$req_msg[95:64] = val_data;
  assign mac$000$req_val        = mac_req_val;
  assign mac$000$reset          = reset;
  assign mac$000$resp_rdy       = mac_resp_rdy;
  assign mac$001$clk            = clk;
  assign mac$001$req_msg[31:0]  = vec_c$001;
  assign mac$001$req_msg[63:32] = vec_b$001;
  assign mac$001$req_msg[95:64] = val_data;
  assign mac$001$req_val        = mac_req_val;
  assign mac$001$reset          = reset;
  assign mac$001$resp_rdy       = mac_resp_rdy;
  assign mac_req_rdy$000        = mac$000$req_rdy;
  assign mac_req_rdy$001        = mac$001$req_rdy;
  assign mac_res$000            = mac$000$resp_msg;
  assign mac_res$001            = mac$001$resp_msg;
  assign mac_resp_val$000       = mac$000$resp_val;
  assign mac_resp_val$001       = mac$001$resp_val;
  assign mcount$clk             = clk;
  assign mcount$reset           = reset;


  assign row_id_buf$clk         = clk;
  assign row_id_buf$reset       = reset;
  assign row_id_buf_rdy$clk     = clk;
  assign row_id_buf_rdy$reset   = reset;

  // array declarations
  reg    [  31:0] cb$in_[0:3];
  assign cb$000$in_ = cb$in_[  0];
  assign cb$001$in_ = cb$in_[  1];
  assign cb$002$in_ = cb$in_[  2];
  assign cb$003$in_ = cb$in_[  3];
  wire   [  31:0] cb$out[0:3];
  assign cb$out[  0] = cb$000$out;
  assign cb$out[  1] = cb$001$out;
  assign cb$out[  2] = cb$002$out;
  assign cb$out[  3] = cb$003$out;
  reg    [  31:0] cd[0:1];
  assign cd$000 = cd[  0];
  assign cd$001 = cd[  1];
  wire   [   0:0] mac_req_rdy[0:1];
  assign mac_req_rdy[  0] = mac_req_rdy$000;
  assign mac_req_rdy[  1] = mac_req_rdy$001;
  wire   [  31:0] mac_res[0:1];
  assign mac_res[  0] = mac_res$000;
  assign mac_res[  1] = mac_res$001;
  wire   [   0:0] mac_resp_val[0:1];
  assign mac_resp_val[  0] = mac_resp_val$000;
  assign mac_resp_val[  1] = mac_resp_val$001;
  reg    [  31:0] vec_b[0:1];
  assign vec_b$000 = vec_b[  0];
  assign vec_b$001 = vec_b[  1];
  reg    [  31:0] vec_c[0:1];
  assign vec_c$000 = vec_c[  0];
  assign vec_c$001 = vec_c[  1];

  // PYMTL SOURCE:
  //
  // @s.tick_rtl
  // def switch_c_buffer():
  //       if s.state_rst:
  //         s.w_idx.next = True
  //         #s.r_idx.next = False
  //         #s.finish_sw.next = False
  //       elif s.state_cmp:
  //         #if s.drain_rdy and s.drain_val.in_ and (not s.finish_sw):
  //         if s.drain_rdy and s.drain_val:
  //           s.w_idx.next = not s.w_idx

  // logic for switch_c_buffer()
  always @ (posedge clk) begin
    if (state_rst) begin
      w_idx <= 1'b1;
    end
    else begin
      if (state_cmp) begin
        if ((drain_rdy&&drain_val)) begin
          w_idx <= !w_idx;
        end
        else begin
        end
      end
      else begin
      end
    end
  end

  // PYMTL SOURCE:
  //
  // @s.tick_rtl
  // def ignore_first_m1():
  //       if s.state_rst:
  //         s.finish_update.next = False
  //         s.first_m1.next = True
  //       if s.state_cmp:
  //         if (s.a_compute_colid == s.p.m1) or \
  //             (s.a_compute_colid == s.p.m2):
  //           if s.a_compute_colid == s.p.m1:
  //             s.first_m1.next = False
  //           if s.a_compute_colid == s.p.m2:
  //             s.first_m1.next = True
  //           s.finish_update.next = True
  //         else:
  //           s.finish_update.next = False

  // logic for ignore_first_m1()
  always @ (posedge clk) begin
    if (state_rst) begin
      finish_update <= 1'b0;
      first_m1 <= 1'b1;
    end
    else begin
    end
    if (state_cmp) begin
      if (((a_compute_colid == p$m1)||(a_compute_colid == p$m2))) begin
        if ((a_compute_colid == p$m1)) begin
          first_m1 <= 1'b0;
        end
        else begin
        end
        if ((a_compute_colid == p$m2)) begin
          first_m1 <= 1'b1;
        end
        else begin
        end
        finish_update <= 1'b1;
      end
      else begin
        finish_update <= 1'b0;
      end
    end
    else begin
    end
  end

  // PYMTL SOURCE:
  //
  // @s.tick_rtl
  // def update_db_value_val():
  //       s.db_value_val.next = s.xbar_val_rdy

  // logic for update_db_value_val()
  always @ (posedge clk) begin
    db_value_val <= xbar_val_rdy;
  end

  // PYMTL SOURCE:
  //
  // @s.tick_rtl
  // def extra():
  //       if s.state_cmp:
  //         s.mac_resp_rdy_next.next = s.drain_rdy or (not s.drain_val)
  //       else:
  //         s.mac_resp_rdy_next.next = True

  // logic for extra()
  always @ (posedge clk) begin
    if (state_cmp) begin
      mac_resp_rdy_next <= (drain_rdy||!drain_val);
    end
    else begin
      mac_resp_rdy_next <= 1'b1;
    end
  end

  // PYMTL SOURCE:
  //
  // @s.combinational
  // def update_r_idx():
  //       if s.state_rst:
  //         s.r_idx.value = False
  //       elif s.state_cmp:
  //         if s.drain_rdy and s.drain_val:
  //           s.r_idx.value = s.w_idx

  // logic for update_r_idx()
  always @ (*) begin
    if (state_rst) begin
      r_idx = 1'b0;
    end
    else begin
      if (state_cmp) begin
        if ((drain_rdy&&drain_val)) begin
          r_idx = w_idx;
        end
        else begin
        end
      end
      else begin
      end
    end
  end

  // PYMTL SOURCE:
  //
  // @s.combinational 
  // def ctlpath():
  //       if s.state_rst:
  //         s.a_compute.rdy.value = True
  //         s.drain_rdy.value = True
  //         s.unload_rdy_con.value = True
  //         s.row_id_buf_rdy.in_.value = True
  //       if s.state_cmp:
  //         # propagate rdy and val signals
  //         # a value
  //         # a_val_con: not being used 
  //         if s.a_compute_colid[nbits-1:nbits] == 0:
  //           s.a_val_con.value = s.a_compute.val # reserve for future
  //           #s.a_val_con.value = True
  //           #s.a_rdy_con.value = (s.length.out == s.p.JJ/s.p.SYS_NUM_COLS-1)
  //         else:
  //           s.a_val_con.value = False
  //           #s.a_rdy_con.value = True
  //         # valid value for MAC operation
  //         #s.a_val_value.value = (s.a_compute_colid[nbits-1:nbits] == 0)
  //         s.a_val_value.value = s.a_val_con
  //
  //         # b vector
  //         s.x_val_con.value = s.xbar_resp.val
  //         s.xbar_resp.rdy.value = s.mac_req_rdyv and s.a_val_value
  //         # buffer row id
  //         if s.a_compute_colid == s.p.m1:
  //           s.row_id_buf.en.value = True
  //           s.r_rdy_con.value = s.row_id_buf_rdy.out
  //         else:
  //           s.row_id_buf.en.value = False
  //           s.r_rdy_con.value = True
  //
  //         # drain valid
  //         if (s.a_compute_colid == s.p.m1) or \
  //             (s.a_compute_colid == s.p.m2):
  //           s.row_id_buf_val.value = True
  //         else:
  //           s.row_id_buf_val.value = False
  //         
  //         # connect val and rdy
  //         if (not s.xbar_resp.val) and s.xbar_resp.rdy:
  //           s.a_compute.rdy.value = False
  //         else:
  //           s.a_compute.rdy.value = True
  //         s.xbar_val_rdy.value = s.xbar_resp.val and s.xbar_resp.rdy
  //         if s.db_value_val:
  //           if s.ccount.out == (s.p.KK*s.p.JJ/s.p.SYS_NUM_COLS-1):
  //             if not s.mac_resp_rdy_next:
  //               s.ccount.in_.value = s.ccount.out
  //             else:
  //               s.ccount.in_.value = 0
  //           else:
  //             s.ccount.in_.value = s.ccount.out + 1
  //         else:
  //           s.ccount.in_.value = s.ccount.out
  //         # 
  //         #s.a_compute.rdy.value = s.r_rdy_con and s.mac_req_rdyv and \
  //         #    s.xbar_resp.val
  //         s.mac_req_val.value = s.a_val_value and s.x_val_con
  //
  //         # MAC done
  //         if s.mcount.out == s.p.JJ/s.p.SYS_NUM_COLS-1:
  //           s.mac_val_con.value = True
  //         else:
  //           s.mac_val_con.value = False
  //
  //         # drain results
  //         if s.compute_mode:
  //           s.drain_val.value = s.row_id_buf_val and (not s.finish_update) and\
  //           (not s.first_m1) or (not s.mac_resp_rdy_next)
  //         else:
  //           s.drain_val.value = (s.ccount.out == s.p.KK*s.p.JJ/s.p.SYS_NUM_COLS-1) and \
  //           s.db_value_val or (not s.mac_resp_rdy_next)
  //         s.mac_resp_rdy.value = s.drain_rdy or (not s.drain_val)
  //         # drain, stall, and done
  //         # drain the C_buffer and send the values of C_unloader channel.
  //         # -- stall the pipeline if blocked on this channel
  //         # -- send a -1 for addr when state if "done" 
  //         # drain controller 
  //         if s.dcount.out == s.p.JJ/s.p.SYS_NUM_COLS-1:
  //           s.unload_rdy_con.value = True
  //         else:
  //           s.unload_rdy_con.value = False
  //         s.y_unloader.val.value = s.drain_val and s.y_unloader.rdy \
  //             or (not s.unload_rdy_con)
  //         # stall MAC operations when drain val but still draining
  //         s.drain_rdy.value = s.y_unloader.rdy and s.unload_rdy_con
  //         s.row_id_buf_rdy.in_.value = s.y_unloader.rdy and s.unload_rdy_con

  // logic for ctlpath()
  always @ (*) begin
    if (state_rst) begin
      a_compute_rdy = 1'b1;
      drain_rdy = 1'b1;
      unload_rdy_con = 1'b1;
      row_id_buf_rdy$in_ = 1'b1;
    end
    else begin
    end
    if (state_cmp) begin
      if ((a_compute_colid[(nbits)-1:(nbits-1)] == 0)) begin
        a_val_con = a_compute_val;
      end
      else begin
        a_val_con = 1'b0;
      end
      a_val_value = a_val_con;
      x_val_con = xbar_resp_val;
      xbar_resp_rdy = (mac_req_rdyv&&a_val_value);
      if ((a_compute_colid == p$m1)) begin
        row_id_buf$en = 1'b1;
        r_rdy_con = row_id_buf_rdy$out;
      end
      else begin
        row_id_buf$en = 1'b0;
        r_rdy_con = 1'b1;
      end
      if (((a_compute_colid == p$m1)||(a_compute_colid == p$m2))) begin
        row_id_buf_val = 1'b1;
      end
      else begin
        row_id_buf_val = 1'b0;
      end
      if ((!xbar_resp_val&&xbar_resp_rdy)) begin
        a_compute_rdy = 1'b0;
      end
      else begin
        a_compute_rdy = 1'b1;
      end
      xbar_val_rdy = (xbar_resp_val&&xbar_resp_rdy);
      if (db_value_val) begin
        if ((ccount$out == (((p$KK*p$JJ)/p$SYS_NUM_COLS)-1))) begin
          if (!mac_resp_rdy_next) begin
            ccount$in_ = ccount$out;
          end
          else begin
            ccount$in_ = 0;
          end
        end
        else begin
          ccount$in_ = (ccount$out+1);
        end
      end
      else begin
        ccount$in_ = ccount$out;
      end
      mac_req_val = (a_val_value&&x_val_con);
      if ((mcount$out == ((p$JJ/p$SYS_NUM_COLS)-1))) begin
        mac_val_con = 1'b1;
      end
      else begin
        mac_val_con = 1'b0;
      end
      if (compute_mode) begin
        drain_val = ((row_id_buf_val&&!finish_update&&!first_m1)||!mac_resp_rdy_next);
      end
      else begin
        drain_val = (((ccount$out == (((p$KK*p$JJ)/p$SYS_NUM_COLS)-1))&&db_value_val)||!mac_resp_rdy_next);
      end
      mac_resp_rdy = (drain_rdy||!drain_val);
      if ((dcount$out == ((p$JJ/p$SYS_NUM_COLS)-1))) begin
        unload_rdy_con = 1'b1;
      end
      else begin
        unload_rdy_con = 1'b0;
      end
      y_unloader_val = ((drain_val&&y_unloader_rdy)||!unload_rdy_con);
      drain_rdy = (y_unloader_rdy&&unload_rdy_con);
      row_id_buf_rdy$in_ = (y_unloader_rdy&&unload_rdy_con);
    end
    else begin
    end
  end

  // PYMTL SOURCE:
  //
  // @s.combinational
  // def data_path():
  //       
  //       #---- J_VEC_SZ -----------------------------------
  //       # s.mac_req_rdyv.value &= s.mac_req_rdy[i]
  //       # probabaly required to be changed...
  //       #s.mac_req_rdyv.value = s.mac_req_rdy[0] 
  //       #s.mac_resp_valv.value = s.mac_resp_val[0]
  //       #-------------------------------------------------
  //       s.mac_req_rdyv.value = 1
  //       s.mac_resp_valv.value = 1
  //       for i in range(s.p.J_VEC_SZ):
  //         if s.mac_req_rdy[i] == 0:
  //           s.mac_req_rdyv.value = 0
  //         if s.mac_resp_val[i] == 0:
  //           s.mac_resp_valv.value = 0
  //       #------------------------------------------
  //       
  //       if s.state_rst:
  //         #s.length.in_.value = s.p.JJ/s.p.SYS_NUM_COLS-1
  //         #s.mcount.in_.value = s.p.JJ/s.p.SYS_NUM_COLS-1
  //         s.dcount.in_.value = s.p.JJ/s.p.SYS_NUM_COLS-1
  //       elif s.state_cmp:
  //         # buffer row id for draining
  //         s.row_id_buf.in_.value = s.a_compute_data
  //         # holding the drain row id for current draining
  //         #if s.drain_val.in_:
  //         #if s.drain_rdy and s.drain_val.in_ and (not s.finish_sw):
  //         if s.drain_rdy and s.drain_val:
  //           s.drain_row_id.in_.value = s.row_id_buf.out
  //         else:
  //           s.drain_row_id.in_.value = s.drain_row_id.out
  //
  //         # fetch b and switch c
  //         s.val_data.value = s.a_compute_data
  //         # fetch b and shift C_buffer
  //         
  //         #---- J_VEC_SZ -----------------------------------
  //         # s.vec_b[0].value = s.xbar_resp.msg.data0
  //         #-------------------------------------------------
  //         for j in range(s.p.J_VEC_SZ):
  //           s.vec_b[j].value = s.xbar_resp.msg[nbits*j:nbits*j+nbits] # vector with size J_VEC_SZ
  //         #-------------------------------------------------
  //         for i in range(s.p.J_VEC_SZ):
  //           s.vec_c[i].value = s.cb[s.p.J_VEC_SZ*s.w_idx*s.p.JJ/s.p.SYS_NUM_COLS+s.p.J_VEC_SZ*(s.p.JJ/s.p.SYS_NUM_COLS-1)+i].out
  //         
  //         # update s.length
  //         #if s.mac_req_val and s.mac_req_rdy:
  //         #  if s.length.out == s.p.JJ/s.p.SYS_NUM_COLS-1:
  //         #    s.length.in_.value = 0
  //         #  else:
  //         #    s.length.in_.value = s.length.out + 1
  //
  //         # store results into C buffer
  //         if s.mac_req_val:
  //           # count results
  //           if s.mcount.out == s.p.JJ/s.p.SYS_NUM_COLS-1:
  //             s.mcount.in_.value = 0
  //           else:
  //             s.mcount.in_.value = s.mcount.out + 1
  //
  //           # store results
  //           # to the first vector of C Buffer
  //           for i in range(s.p.J_VEC_SZ):
  //             s.cb[s.p.J_VEC_SZ*s.w_idx*s.p.JJ/s.p.SYS_NUM_COLS+i].in_.value = s.mac_res[i]
  //           # shift compute buffer
  //           for i in range(s.p.JJ/s.p.SYS_NUM_COLS-1,0,-1):
  //             for j in range(s.p.J_VEC_SZ):
  //               s.cb[s.p.J_VEC_SZ*s.w_idx*s.p.JJ/s.p.SYS_NUM_COLS+i*s.p.J_VEC_SZ+j].in_.value\
  //                   = s.cb[s.p.J_VEC_SZ*s.w_idx*s.p.JJ/s.p.SYS_NUM_COLS+(i-1)*s.p.J_VEC_SZ+j].out
  //         else:
  //           s.mcount.in_.value = s.mcount.out
  //           # keep values in the buffer
  //           for i in range(s.p.J_VEC_SZ):
  //             s.cb[s.p.J_VEC_SZ*s.w_idx*s.p.JJ/s.p.SYS_NUM_COLS+i].in_.value \
  //               = s.cb[s.p.J_VEC_SZ*s.w_idx*s.p.JJ/s.p.SYS_NUM_COLS+i].out
  //           for i in range(s.p.JJ/s.p.SYS_NUM_COLS-1,0,-1):
  //             for j in range(s.p.J_VEC_SZ):
  //               s.cb[s.p.J_VEC_SZ*s.w_idx*s.p.JJ/s.p.SYS_NUM_COLS+i*s.p.J_VEC_SZ+j].in_.value\
  //                   = s.cb[s.p.J_VEC_SZ*s.w_idx*s.p.JJ/s.p.SYS_NUM_COLS+i*s.p.J_VEC_SZ+j].out
  //
  //         # draining
  //         if s.y_unloader.val and s.y_unloader.rdy: 
  //           # count draining
  //           if s.dcount.out == s.p.JJ/s.p.SYS_NUM_COLS-1:
  //             s.dcount.in_.value = 0
  //           else:
  //             s.dcount.in_.value = s.dcount.out + 1
  //           
  //           # fetch results from C buffer
  //           # from the last vecotr of C Buffer
  //           for i in range(s.p.J_VEC_SZ):
  //             s.cd[i].value = \
  //             s.cb[s.p.J_VEC_SZ*s.r_idx*s.p.JJ/s.p.SYS_NUM_COLS+(s.p.JJ/s.p.SYS_NUM_COLS-1)*s.p.J_VEC_SZ+i].out
  //           # shift drain buffer
  //           for i in range(s.p.JJ/s.p.SYS_NUM_COLS-1,0,-1):
  //             for j in range(s.p.J_VEC_SZ):
  //               s.cb[s.p.J_VEC_SZ*s.r_idx*s.p.JJ/s.p.SYS_NUM_COLS+i*s.p.J_VEC_SZ+j].in_.value\
  //                  = s.cb[s.p.J_VEC_SZ*s.r_idx*s.p.JJ/s.p.SYS_NUM_COLS+(i-1)*s.p.J_VEC_SZ+j].out
  //           # clear values in C buffer for next MAC operations
  //           for i in range(s.p.J_VEC_SZ):
  //             s.cb[s.p.J_VEC_SZ*s.r_idx*s.p.JJ/s.p.SYS_NUM_COLS+i].in_.value = 0
  //           # drain values to y_unloader
  //           #---- J_VEC_SZ -----------------------------------
  //           #s.y_unloader.msg.data0 = s.cd[0]
  //           #-------------------------------------------------
  //           for i in range(s.p.J_VEC_SZ):
  //             s.y_unloader.msg[nbits*i:nbits*i+nbits] = s.cd[i]
  //           #-------------------------------------------------
  //           if s.all_done: # done state
  //             s.y_unloader.msg.addri.value  = -1
  //             s.y_unloader.msg.addrjj.value = -1
  //           else:
  //             if s.drain_val:
  //               s.y_unloader.msg.addri.value  = s.drain_row_id.in_
  //             else:
  //               s.y_unloader.msg.addri.value  = s.drain_row_id.out
  //             s.y_unloader.msg.addrjj.value = s.dcount.in_
  //         else:
  //           s.dcount.in_.value = s.dcount.out
  //           # keep values in drain buffer
  //           for i in range(s.p.JJ/s.p.SYS_NUM_COLS-1,0,-1):
  //             for j in range(s.p.J_VEC_SZ):
  //               s.cb[s.p.J_VEC_SZ*s.r_idx*s.p.JJ/s.p.SYS_NUM_COLS+i*s.p.J_VEC_SZ+j].in_.value\
  //                  = s.cb[s.p.J_VEC_SZ*s.r_idx*s.p.JJ/s.p.SYS_NUM_COLS+i*s.p.J_VEC_SZ+j].out
  //           # clear values in C buffer for next MAC operations
  //           for i in range(s.p.J_VEC_SZ):
  //             s.cb[s.p.J_VEC_SZ*s.r_idx*s.p.JJ/s.p.SYS_NUM_COLS+i].in_.value = s.cb[s.p.J_VEC_SZ*s.r_idx*s.p.JJ/s.p.SYS_NUM_COLS+i].out

  // logic for data_path()
  always @ (*) begin
    mac_req_rdyv = 1;
    mac_resp_valv = 1;
    for (i=0; i < p$J_VEC_SZ; i=i+1)
    begin
      if ((mac_req_rdy[i] == 0)) begin
        mac_req_rdyv = 0;
      end
      else begin
      end
      if ((mac_resp_val[i] == 0)) begin
        mac_resp_valv = 0;
      end
      else begin
      end
    end
    if (state_rst) begin
      dcount$in_ = ((p$JJ/p$SYS_NUM_COLS)-1);
    end
    else begin
      if (state_cmp) begin
        row_id_buf$in_ = a_compute_data;
        if ((drain_rdy&&drain_val)) begin
          drain_row_id$in_ = row_id_buf$out;
        end
        else begin
          drain_row_id$in_ = drain_row_id$out;
        end
        val_data = a_compute_data;
        for (j=0; j < p$J_VEC_SZ; j=j+1)
        begin
          vec_b[j] = xbar_resp_msg[(nbits*j) +: nbits];
        end
        for (i=0; i < p$J_VEC_SZ; i=i+1)
        begin
          vec_c[i] = cb$out[(((((p$J_VEC_SZ*w_idx)*p$JJ)/p$SYS_NUM_COLS)+(p$J_VEC_SZ*((p$JJ/p$SYS_NUM_COLS)-1)))+i)];
        end
        if (mac_req_val) begin
          if ((mcount$out == ((p$JJ/p$SYS_NUM_COLS)-1))) begin
            mcount$in_ = 0;
          end
          else begin
            mcount$in_ = (mcount$out+1);
          end
          for (i=0; i < p$J_VEC_SZ; i=i+1)
          begin
            cb$in_[((((p$J_VEC_SZ*w_idx)*p$JJ)/p$SYS_NUM_COLS)+i)] = mac_res[i];
          end
          for (i=((p$JJ/p$SYS_NUM_COLS)-1); i > 0; i=i+-1)
          begin
            for (j=0; j < p$J_VEC_SZ; j=j+1)
            begin
              cb$in_[(((((p$J_VEC_SZ*w_idx)*p$JJ)/p$SYS_NUM_COLS)+(i*p$J_VEC_SZ))+j)] = cb$out[(((((p$J_VEC_SZ*w_idx)*p$JJ)/p$SYS_NUM_COLS)+((i-1)*p$J_VEC_SZ))+j)];
            end
          end
        end
        else begin
          mcount$in_ = mcount$out;
          for (i=0; i < p$J_VEC_SZ; i=i+1)
          begin
            cb$in_[((((p$J_VEC_SZ*w_idx)*p$JJ)/p$SYS_NUM_COLS)+i)] = cb$out[((((p$J_VEC_SZ*w_idx)*p$JJ)/p$SYS_NUM_COLS)+i)];
          end
          for (i=((p$JJ/p$SYS_NUM_COLS)-1); i > 0; i=i+-1)
          begin
            for (j=0; j < p$J_VEC_SZ; j=j+1)
            begin
              cb$in_[(((((p$J_VEC_SZ*w_idx)*p$JJ)/p$SYS_NUM_COLS)+(i*p$J_VEC_SZ))+j)] = cb$out[(((((p$J_VEC_SZ*w_idx)*p$JJ)/p$SYS_NUM_COLS)+(i*p$J_VEC_SZ))+j)];
            end
          end
        end
        if ((y_unloader_val&&y_unloader_rdy)) begin
          if ((dcount$out == ((p$JJ/p$SYS_NUM_COLS)-1))) begin
            dcount$in_ = 0;
          end
          else begin
            dcount$in_ = (dcount$out+1);
          end
          for (i=0; i < p$J_VEC_SZ; i=i+1)
          begin
            cd[i] = cb$out[(((((p$J_VEC_SZ*r_idx)*p$JJ)/p$SYS_NUM_COLS)+(((p$JJ/p$SYS_NUM_COLS)-1)*p$J_VEC_SZ))+i)];
          end
          for (i=((p$JJ/p$SYS_NUM_COLS)-1); i > 0; i=i+-1)
          begin
            for (j=0; j < p$J_VEC_SZ; j=j+1)
            begin
              cb$in_[(((((p$J_VEC_SZ*r_idx)*p$JJ)/p$SYS_NUM_COLS)+(i*p$J_VEC_SZ))+j)] = cb$out[(((((p$J_VEC_SZ*r_idx)*p$JJ)/p$SYS_NUM_COLS)+((i-1)*p$J_VEC_SZ))+j)];
            end
          end
          for (i=0; i < p$J_VEC_SZ; i=i+1)
          begin
            cb$in_[((((p$J_VEC_SZ*r_idx)*p$JJ)/p$SYS_NUM_COLS)+i)] = 0;
          end
          for (i=0; i < p$J_VEC_SZ; i=i+1)
          begin
            y_unloader_msg[(nbits*i) +: nbits] = cd[i];
          end
          if (all_done) begin
            y_unloader_msg[(128)-1:96] = -1;
            y_unloader_msg[(96)-1:64] = -1;
          end
          else begin
            if (drain_val) begin
              y_unloader_msg[(128)-1:96] = drain_row_id$in_;
            end
            else begin
              y_unloader_msg[(128)-1:96] = drain_row_id$out;
            end
            y_unloader_msg[(96)-1:64] = dcount$in_;
          end
        end
        else begin
          dcount$in_ = dcount$out;
          for (i=((p$JJ/p$SYS_NUM_COLS)-1); i > 0; i=i+-1)
          begin
            for (j=0; j < p$J_VEC_SZ; j=j+1)
            begin
              cb$in_[(((((p$J_VEC_SZ*r_idx)*p$JJ)/p$SYS_NUM_COLS)+(i*p$J_VEC_SZ))+j)] = cb$out[(((((p$J_VEC_SZ*r_idx)*p$JJ)/p$SYS_NUM_COLS)+(i*p$J_VEC_SZ))+j)];
            end
          end
          for (i=0; i < p$J_VEC_SZ; i=i+1)
          begin
            cb$in_[((((p$J_VEC_SZ*r_idx)*p$JJ)/p$SYS_NUM_COLS)+i)] = cb$out[((((p$J_VEC_SZ*r_idx)*p$JJ)/p$SYS_NUM_COLS)+i)];
          end
        end
      end
      else begin
      end
    end
  end


endmodule // compute_drain_0x3ddd647ff49d40d6
`default_nettype wire

//-----------------------------------------------------------------------------
// RegEn_0x3392d4dd30174d2
//-----------------------------------------------------------------------------
// PyMTL: dump_vcd = False
// PyMTL: pclib.rtl.regs {"dtype": 32}
// PyMTL: verilator_xinit = zeros
`default_nettype none
module RegEn_0x3392d4dd30174d2
(
  input  wire [   0:0] clk,
  input  wire [   0:0] en,
  input  wire [  31:0] in_,
  output reg  [  31:0] out,
  input  wire [   0:0] reset
);



  // PYMTL SOURCE:
  //
  // @s.posedge_clk
  // def seq_logic():
  //       if s.en:
  //         s.out.next = s.in_

  // logic for seq_logic()
  always @ (posedge clk) begin
    if (en) begin
      out <= in_;
    end
    else begin
    end
  end


endmodule // RegEn_0x3392d4dd30174d2
`default_nettype wire

//-----------------------------------------------------------------------------
// MACUnit_0x2e562212793116f1
//-----------------------------------------------------------------------------
// PyMTL: dump_vcd = False
// PyMTL: spmm.MACUnit {"nbits": 32}
// PyMTL: verilator_xinit = zeros
`default_nettype none
module MACUnit_0x2e562212793116f1
(
  input  wire [   0:0] clk,
  input  wire [  95:0] req_msg,
  output reg  [   0:0] req_rdy,
  input  wire [   0:0] req_val,
  input  wire [   0:0] reset,
  output wire [  31:0] resp_msg,
  input  wire [   0:0] resp_rdy,
  output reg  [   0:0] resp_val
);

  // register declarations
  reg    [  63:0] tmp_result;

  // signal connections
  assign resp_msg = tmp_result[31:0];


  // PYMTL SOURCE:
  //
  // @s.combinational
  // def comb_result():
  //       s.tmp_result.value = s.req.msg.op1 * s.req.msg.op2 + s.req.msg.op3

  // logic for comb_result()
  always @ (*) begin
    tmp_result = ((req_msg[(96)-1:64]*req_msg[(64)-1:32])+req_msg[(32)-1:0]);
  end

  // PYMTL SOURCE:
  //
  // @s.combinational
  // def propagate_sigs():
  //       s.req.rdy.value  = s.resp.rdy
  //       s.resp.val.value = s.req.val

  // logic for propagate_sigs()
  always @ (*) begin
    req_rdy = resp_rdy;
    resp_val = req_val;
  end


endmodule // MACUnit_0x2e562212793116f1
`default_nettype wire

//-----------------------------------------------------------------------------
// crossbar_0x48d3814e38ed84e5
//-----------------------------------------------------------------------------
// PyMTL: dump_vcd = False
// PyMTL: xbar.crossbar {"nbits": 32, "nports": 8}
// PyMTL: verilator_xinit = zeros
`default_nettype none
module crossbar_0x48d3814e38ed84e5
(
  output wire [  31:0] bank_req$000_msg,
  input  wire [   0:0] bank_req$000_rdy,
  output wire [   0:0] bank_req$000_val,
  output wire [  31:0] bank_req$001_msg,
  input  wire [   0:0] bank_req$001_rdy,
  output wire [   0:0] bank_req$001_val,
  output wire [  31:0] bank_req$002_msg,
  input  wire [   0:0] bank_req$002_rdy,
  output wire [   0:0] bank_req$002_val,
  output wire [  31:0] bank_req$003_msg,
  input  wire [   0:0] bank_req$003_rdy,
  output wire [   0:0] bank_req$003_val,
  output wire [  31:0] bank_req$004_msg,
  input  wire [   0:0] bank_req$004_rdy,
  output wire [   0:0] bank_req$004_val,
  output wire [  31:0] bank_req$005_msg,
  input  wire [   0:0] bank_req$005_rdy,
  output wire [   0:0] bank_req$005_val,
  output wire [  31:0] bank_req$006_msg,
  input  wire [   0:0] bank_req$006_rdy,
  output wire [   0:0] bank_req$006_val,
  output wire [  31:0] bank_req$007_msg,
  input  wire [   0:0] bank_req$007_rdy,
  output wire [   0:0] bank_req$007_val,
  input  wire [  63:0] bank_resp$000_msg,
  output wire [   0:0] bank_resp$000_rdy,
  input  wire [   0:0] bank_resp$000_val,
  input  wire [  63:0] bank_resp$001_msg,
  output wire [   0:0] bank_resp$001_rdy,
  input  wire [   0:0] bank_resp$001_val,
  input  wire [  63:0] bank_resp$002_msg,
  output wire [   0:0] bank_resp$002_rdy,
  input  wire [   0:0] bank_resp$002_val,
  input  wire [  63:0] bank_resp$003_msg,
  output wire [   0:0] bank_resp$003_rdy,
  input  wire [   0:0] bank_resp$003_val,
  input  wire [  63:0] bank_resp$004_msg,
  output wire [   0:0] bank_resp$004_rdy,
  input  wire [   0:0] bank_resp$004_val,
  input  wire [  63:0] bank_resp$005_msg,
  output wire [   0:0] bank_resp$005_rdy,
  input  wire [   0:0] bank_resp$005_val,
  input  wire [  63:0] bank_resp$006_msg,
  output wire [   0:0] bank_resp$006_rdy,
  input  wire [   0:0] bank_resp$006_val,
  input  wire [  63:0] bank_resp$007_msg,
  output wire [   0:0] bank_resp$007_rdy,
  input  wire [   0:0] bank_resp$007_val,
  input  wire [   0:0] clk,
  input  wire [   0:0] reset,
  input  wire [  31:0] xbar_req$000_msg,
  output wire [   0:0] xbar_req$000_rdy,
  input  wire [   0:0] xbar_req$000_val,
  input  wire [  31:0] xbar_req$001_msg,
  output wire [   0:0] xbar_req$001_rdy,
  input  wire [   0:0] xbar_req$001_val,
  input  wire [  31:0] xbar_req$002_msg,
  output wire [   0:0] xbar_req$002_rdy,
  input  wire [   0:0] xbar_req$002_val,
  input  wire [  31:0] xbar_req$003_msg,
  output wire [   0:0] xbar_req$003_rdy,
  input  wire [   0:0] xbar_req$003_val,
  input  wire [  31:0] xbar_req$004_msg,
  output wire [   0:0] xbar_req$004_rdy,
  input  wire [   0:0] xbar_req$004_val,
  input  wire [  31:0] xbar_req$005_msg,
  output wire [   0:0] xbar_req$005_rdy,
  input  wire [   0:0] xbar_req$005_val,
  input  wire [  31:0] xbar_req$006_msg,
  output wire [   0:0] xbar_req$006_rdy,
  input  wire [   0:0] xbar_req$006_val,
  input  wire [  31:0] xbar_req$007_msg,
  output wire [   0:0] xbar_req$007_rdy,
  input  wire [   0:0] xbar_req$007_val,
  output wire [  63:0] xbar_resp$000_msg,
  input  wire [   0:0] xbar_resp$000_rdy,
  output wire [   0:0] xbar_resp$000_val,
  output wire [  63:0] xbar_resp$001_msg,
  input  wire [   0:0] xbar_resp$001_rdy,
  output wire [   0:0] xbar_resp$001_val,
  output wire [  63:0] xbar_resp$002_msg,
  input  wire [   0:0] xbar_resp$002_rdy,
  output wire [   0:0] xbar_resp$002_val,
  output wire [  63:0] xbar_resp$003_msg,
  input  wire [   0:0] xbar_resp$003_rdy,
  output wire [   0:0] xbar_resp$003_val,
  output wire [  63:0] xbar_resp$004_msg,
  input  wire [   0:0] xbar_resp$004_rdy,
  output wire [   0:0] xbar_resp$004_val,
  output wire [  63:0] xbar_resp$005_msg,
  input  wire [   0:0] xbar_resp$005_rdy,
  output wire [   0:0] xbar_resp$005_val,
  output wire [  63:0] xbar_resp$006_msg,
  input  wire [   0:0] xbar_resp$006_rdy,
  output wire [   0:0] xbar_resp$006_val,
  output wire [  63:0] xbar_resp$007_msg,
  input  wire [   0:0] xbar_resp$007_rdy,
  output wire [   0:0] xbar_resp$007_val
);

  // wire declarations
  wire   [  31:0] vec_bank_resp$000$000;
  wire   [  31:0] vec_bank_resp$000$001;
  wire   [  31:0] vec_bank_resp$001$000;
  wire   [  31:0] vec_bank_resp$001$001;
  wire   [  31:0] vec_bank_resp$002$000;
  wire   [  31:0] vec_bank_resp$002$001;
  wire   [  31:0] vec_bank_resp$003$000;
  wire   [  31:0] vec_bank_resp$003$001;
  wire   [  31:0] vec_bank_resp$004$000;
  wire   [  31:0] vec_bank_resp$004$001;
  wire   [  31:0] vec_bank_resp$005$000;
  wire   [  31:0] vec_bank_resp$005$001;
  wire   [  31:0] vec_bank_resp$006$000;
  wire   [  31:0] vec_bank_resp$006$001;
  wire   [  31:0] vec_bank_resp$007$000;
  wire   [  31:0] vec_bank_resp$007$001;
  wire   [  31:0] vec_xbar_resp$000$000;
  wire   [  31:0] vec_xbar_resp$000$001;
  wire   [  31:0] vec_xbar_resp$001$000;
  wire   [  31:0] vec_xbar_resp$001$001;
  wire   [  31:0] vec_xbar_resp$002$000;
  wire   [  31:0] vec_xbar_resp$002$001;
  wire   [  31:0] vec_xbar_resp$003$000;
  wire   [  31:0] vec_xbar_resp$003$001;
  wire   [  31:0] vec_xbar_resp$004$000;
  wire   [  31:0] vec_xbar_resp$004$001;
  wire   [  31:0] vec_xbar_resp$005$000;
  wire   [  31:0] vec_xbar_resp$005$001;
  wire   [  31:0] vec_xbar_resp$006$000;
  wire   [  31:0] vec_xbar_resp$006$001;
  wire   [  31:0] vec_xbar_resp$007$000;
  wire   [  31:0] vec_xbar_resp$007$001;












  // ctrl temporaries
  wire   [   0:0] ctrl$clk;
  wire   [   0:0] ctrl$reset;
  wire   [  31:0] ctrl$xbar_req$000_msg;
  wire   [   0:0] ctrl$xbar_req$000_val;
  wire   [  31:0] ctrl$xbar_req$001_msg;
  wire   [   0:0] ctrl$xbar_req$001_val;
  wire   [  31:0] ctrl$xbar_req$002_msg;
  wire   [   0:0] ctrl$xbar_req$002_val;
  wire   [  31:0] ctrl$xbar_req$003_msg;
  wire   [   0:0] ctrl$xbar_req$003_val;
  wire   [  31:0] ctrl$xbar_req$004_msg;
  wire   [   0:0] ctrl$xbar_req$004_val;
  wire   [  31:0] ctrl$xbar_req$005_msg;
  wire   [   0:0] ctrl$xbar_req$005_val;
  wire   [  31:0] ctrl$xbar_req$006_msg;
  wire   [   0:0] ctrl$xbar_req$006_val;
  wire   [  31:0] ctrl$xbar_req$007_msg;
  wire   [   0:0] ctrl$xbar_req$007_val;
  wire   [   0:0] ctrl$a_out_valid$000;
  wire   [   0:0] ctrl$a_out_valid$001;
  wire   [   0:0] ctrl$a_out_valid$002;
  wire   [   0:0] ctrl$a_out_valid$003;
  wire   [   0:0] ctrl$a_out_valid$004;
  wire   [   0:0] ctrl$a_out_valid$005;
  wire   [   0:0] ctrl$a_out_valid$006;
  wire   [   0:0] ctrl$a_out_valid$007;
  wire   [   2:0] ctrl$a_out$000;
  wire   [   2:0] ctrl$a_out$001;
  wire   [   2:0] ctrl$a_out$002;
  wire   [   2:0] ctrl$a_out$003;
  wire   [   2:0] ctrl$a_out$004;
  wire   [   2:0] ctrl$a_out$005;
  wire   [   2:0] ctrl$a_out$006;
  wire   [   2:0] ctrl$a_out$007;
  wire   [   0:0] ctrl$xbar_resp_rdy$000;
  wire   [   0:0] ctrl$xbar_resp_rdy$001;
  wire   [   0:0] ctrl$xbar_resp_rdy$002;
  wire   [   0:0] ctrl$xbar_resp_rdy$003;
  wire   [   0:0] ctrl$xbar_resp_rdy$004;
  wire   [   0:0] ctrl$xbar_resp_rdy$005;
  wire   [   0:0] ctrl$xbar_resp_rdy$006;
  wire   [   0:0] ctrl$xbar_resp_rdy$007;
  wire   [   0:0] ctrl$bank_req_rdy$000;
  wire   [   0:0] ctrl$bank_req_rdy$001;
  wire   [   0:0] ctrl$bank_req_rdy$002;
  wire   [   0:0] ctrl$bank_req_rdy$003;
  wire   [   0:0] ctrl$bank_req_rdy$004;
  wire   [   0:0] ctrl$bank_req_rdy$005;
  wire   [   0:0] ctrl$bank_req_rdy$006;
  wire   [   0:0] ctrl$bank_req_rdy$007;
  wire   [   0:0] ctrl$bank_resp_val$000;
  wire   [   0:0] ctrl$bank_resp_val$001;
  wire   [   0:0] ctrl$bank_resp_val$002;
  wire   [   0:0] ctrl$bank_resp_val$003;
  wire   [   0:0] ctrl$bank_resp_val$004;
  wire   [   0:0] ctrl$bank_resp_val$005;
  wire   [   0:0] ctrl$bank_resp_val$006;
  wire   [   0:0] ctrl$bank_resp_val$007;
  wire   [   0:0] ctrl$xbar_req$000_rdy;
  wire   [   0:0] ctrl$xbar_req$001_rdy;
  wire   [   0:0] ctrl$xbar_req$002_rdy;
  wire   [   0:0] ctrl$xbar_req$003_rdy;
  wire   [   0:0] ctrl$xbar_req$004_rdy;
  wire   [   0:0] ctrl$xbar_req$005_rdy;
  wire   [   0:0] ctrl$xbar_req$006_rdy;
  wire   [   0:0] ctrl$xbar_req$007_rdy;
  wire   [   0:0] ctrl$a_in_valid$000;
  wire   [   0:0] ctrl$a_in_valid$001;
  wire   [   0:0] ctrl$a_in_valid$002;
  wire   [   0:0] ctrl$a_in_valid$003;
  wire   [   0:0] ctrl$a_in_valid$004;
  wire   [   0:0] ctrl$a_in_valid$005;
  wire   [   0:0] ctrl$a_in_valid$006;
  wire   [   0:0] ctrl$a_in_valid$007;
  wire   [   0:0] ctrl$a_in_valid$008;
  wire   [   0:0] ctrl$a_in_valid$009;
  wire   [   0:0] ctrl$a_in_valid$010;
  wire   [   0:0] ctrl$a_in_valid$011;
  wire   [   0:0] ctrl$a_in_valid$012;
  wire   [   0:0] ctrl$a_in_valid$013;
  wire   [   0:0] ctrl$a_in_valid$014;
  wire   [   0:0] ctrl$a_in_valid$015;
  wire   [   0:0] ctrl$a_in_valid$016;
  wire   [   0:0] ctrl$a_in_valid$017;
  wire   [   0:0] ctrl$a_in_valid$018;
  wire   [   0:0] ctrl$a_in_valid$019;
  wire   [   0:0] ctrl$a_in_valid$020;
  wire   [   0:0] ctrl$a_in_valid$021;
  wire   [   0:0] ctrl$a_in_valid$022;
  wire   [   0:0] ctrl$a_in_valid$023;
  wire   [   0:0] ctrl$a_in_valid$024;
  wire   [   0:0] ctrl$a_in_valid$025;
  wire   [   0:0] ctrl$a_in_valid$026;
  wire   [   0:0] ctrl$a_in_valid$027;
  wire   [   0:0] ctrl$a_in_valid$028;
  wire   [   0:0] ctrl$a_in_valid$029;
  wire   [   0:0] ctrl$a_in_valid$030;
  wire   [   0:0] ctrl$a_in_valid$031;
  wire   [   0:0] ctrl$a_in_valid$032;
  wire   [   0:0] ctrl$a_in_valid$033;
  wire   [   0:0] ctrl$a_in_valid$034;
  wire   [   0:0] ctrl$a_in_valid$035;
  wire   [   0:0] ctrl$a_in_valid$036;
  wire   [   0:0] ctrl$a_in_valid$037;
  wire   [   0:0] ctrl$a_in_valid$038;
  wire   [   0:0] ctrl$a_in_valid$039;
  wire   [   0:0] ctrl$a_in_valid$040;
  wire   [   0:0] ctrl$a_in_valid$041;
  wire   [   0:0] ctrl$a_in_valid$042;
  wire   [   0:0] ctrl$a_in_valid$043;
  wire   [   0:0] ctrl$a_in_valid$044;
  wire   [   0:0] ctrl$a_in_valid$045;
  wire   [   0:0] ctrl$a_in_valid$046;
  wire   [   0:0] ctrl$a_in_valid$047;
  wire   [   0:0] ctrl$a_in_valid$048;
  wire   [   0:0] ctrl$a_in_valid$049;
  wire   [   0:0] ctrl$a_in_valid$050;
  wire   [   0:0] ctrl$a_in_valid$051;
  wire   [   0:0] ctrl$a_in_valid$052;
  wire   [   0:0] ctrl$a_in_valid$053;
  wire   [   0:0] ctrl$a_in_valid$054;
  wire   [   0:0] ctrl$a_in_valid$055;
  wire   [   0:0] ctrl$a_in_valid$056;
  wire   [   0:0] ctrl$a_in_valid$057;
  wire   [   0:0] ctrl$a_in_valid$058;
  wire   [   0:0] ctrl$a_in_valid$059;
  wire   [   0:0] ctrl$a_in_valid$060;
  wire   [   0:0] ctrl$a_in_valid$061;
  wire   [   0:0] ctrl$a_in_valid$062;
  wire   [   0:0] ctrl$a_in_valid$063;
  wire   [   2:0] ctrl$mi_select$000;
  wire   [   2:0] ctrl$mi_select$001;
  wire   [   2:0] ctrl$mi_select$002;
  wire   [   2:0] ctrl$mi_select$003;
  wire   [   2:0] ctrl$mi_select$004;
  wire   [   2:0] ctrl$mi_select$005;
  wire   [   2:0] ctrl$mi_select$006;
  wire   [   2:0] ctrl$mi_select$007;
  wire   [   2:0] ctrl$mo_select$000;
  wire   [   2:0] ctrl$mo_select$001;
  wire   [   2:0] ctrl$mo_select$002;
  wire   [   2:0] ctrl$mo_select$003;
  wire   [   2:0] ctrl$mo_select$004;
  wire   [   2:0] ctrl$mo_select$005;
  wire   [   2:0] ctrl$mo_select$006;
  wire   [   2:0] ctrl$mo_select$007;
  wire   [   0:0] ctrl$xbar_resp_val$000;
  wire   [   0:0] ctrl$xbar_resp_val$001;
  wire   [   0:0] ctrl$xbar_resp_val$002;
  wire   [   0:0] ctrl$xbar_resp_val$003;
  wire   [   0:0] ctrl$xbar_resp_val$004;
  wire   [   0:0] ctrl$xbar_resp_val$005;
  wire   [   0:0] ctrl$xbar_resp_val$006;
  wire   [   0:0] ctrl$xbar_resp_val$007;
  wire   [   0:0] ctrl$bank_req_val$000;
  wire   [   0:0] ctrl$bank_req_val$001;
  wire   [   0:0] ctrl$bank_req_val$002;
  wire   [   0:0] ctrl$bank_req_val$003;
  wire   [   0:0] ctrl$bank_req_val$004;
  wire   [   0:0] ctrl$bank_req_val$005;
  wire   [   0:0] ctrl$bank_req_val$006;
  wire   [   0:0] ctrl$bank_req_val$007;
  wire   [   0:0] ctrl$bank_resp_rdy$000;
  wire   [   0:0] ctrl$bank_resp_rdy$001;
  wire   [   0:0] ctrl$bank_resp_rdy$002;
  wire   [   0:0] ctrl$bank_resp_rdy$003;
  wire   [   0:0] ctrl$bank_resp_rdy$004;
  wire   [   0:0] ctrl$bank_resp_rdy$005;
  wire   [   0:0] ctrl$bank_resp_rdy$006;
  wire   [   0:0] ctrl$bank_resp_rdy$007;

  Control_0x5bcef2db11135bb6 ctrl
  (
    .clk               ( ctrl$clk ),
    .reset             ( ctrl$reset ),
    .xbar_req$000_msg  ( ctrl$xbar_req$000_msg ),
    .xbar_req$000_val  ( ctrl$xbar_req$000_val ),
    .xbar_req$001_msg  ( ctrl$xbar_req$001_msg ),
    .xbar_req$001_val  ( ctrl$xbar_req$001_val ),
    .xbar_req$002_msg  ( ctrl$xbar_req$002_msg ),
    .xbar_req$002_val  ( ctrl$xbar_req$002_val ),
    .xbar_req$003_msg  ( ctrl$xbar_req$003_msg ),
    .xbar_req$003_val  ( ctrl$xbar_req$003_val ),
    .xbar_req$004_msg  ( ctrl$xbar_req$004_msg ),
    .xbar_req$004_val  ( ctrl$xbar_req$004_val ),
    .xbar_req$005_msg  ( ctrl$xbar_req$005_msg ),
    .xbar_req$005_val  ( ctrl$xbar_req$005_val ),
    .xbar_req$006_msg  ( ctrl$xbar_req$006_msg ),
    .xbar_req$006_val  ( ctrl$xbar_req$006_val ),
    .xbar_req$007_msg  ( ctrl$xbar_req$007_msg ),
    .xbar_req$007_val  ( ctrl$xbar_req$007_val ),
    .a_out_valid$000   ( ctrl$a_out_valid$000 ),
    .a_out_valid$001   ( ctrl$a_out_valid$001 ),
    .a_out_valid$002   ( ctrl$a_out_valid$002 ),
    .a_out_valid$003   ( ctrl$a_out_valid$003 ),
    .a_out_valid$004   ( ctrl$a_out_valid$004 ),
    .a_out_valid$005   ( ctrl$a_out_valid$005 ),
    .a_out_valid$006   ( ctrl$a_out_valid$006 ),
    .a_out_valid$007   ( ctrl$a_out_valid$007 ),
    .a_out$000         ( ctrl$a_out$000 ),
    .a_out$001         ( ctrl$a_out$001 ),
    .a_out$002         ( ctrl$a_out$002 ),
    .a_out$003         ( ctrl$a_out$003 ),
    .a_out$004         ( ctrl$a_out$004 ),
    .a_out$005         ( ctrl$a_out$005 ),
    .a_out$006         ( ctrl$a_out$006 ),
    .a_out$007         ( ctrl$a_out$007 ),
    .xbar_resp_rdy$000 ( ctrl$xbar_resp_rdy$000 ),
    .xbar_resp_rdy$001 ( ctrl$xbar_resp_rdy$001 ),
    .xbar_resp_rdy$002 ( ctrl$xbar_resp_rdy$002 ),
    .xbar_resp_rdy$003 ( ctrl$xbar_resp_rdy$003 ),
    .xbar_resp_rdy$004 ( ctrl$xbar_resp_rdy$004 ),
    .xbar_resp_rdy$005 ( ctrl$xbar_resp_rdy$005 ),
    .xbar_resp_rdy$006 ( ctrl$xbar_resp_rdy$006 ),
    .xbar_resp_rdy$007 ( ctrl$xbar_resp_rdy$007 ),
    .bank_req_rdy$000  ( ctrl$bank_req_rdy$000 ),
    .bank_req_rdy$001  ( ctrl$bank_req_rdy$001 ),
    .bank_req_rdy$002  ( ctrl$bank_req_rdy$002 ),
    .bank_req_rdy$003  ( ctrl$bank_req_rdy$003 ),
    .bank_req_rdy$004  ( ctrl$bank_req_rdy$004 ),
    .bank_req_rdy$005  ( ctrl$bank_req_rdy$005 ),
    .bank_req_rdy$006  ( ctrl$bank_req_rdy$006 ),
    .bank_req_rdy$007  ( ctrl$bank_req_rdy$007 ),
    .bank_resp_val$000 ( ctrl$bank_resp_val$000 ),
    .bank_resp_val$001 ( ctrl$bank_resp_val$001 ),
    .bank_resp_val$002 ( ctrl$bank_resp_val$002 ),
    .bank_resp_val$003 ( ctrl$bank_resp_val$003 ),
    .bank_resp_val$004 ( ctrl$bank_resp_val$004 ),
    .bank_resp_val$005 ( ctrl$bank_resp_val$005 ),
    .bank_resp_val$006 ( ctrl$bank_resp_val$006 ),
    .bank_resp_val$007 ( ctrl$bank_resp_val$007 ),
    .xbar_req$000_rdy  ( ctrl$xbar_req$000_rdy ),
    .xbar_req$001_rdy  ( ctrl$xbar_req$001_rdy ),
    .xbar_req$002_rdy  ( ctrl$xbar_req$002_rdy ),
    .xbar_req$003_rdy  ( ctrl$xbar_req$003_rdy ),
    .xbar_req$004_rdy  ( ctrl$xbar_req$004_rdy ),
    .xbar_req$005_rdy  ( ctrl$xbar_req$005_rdy ),
    .xbar_req$006_rdy  ( ctrl$xbar_req$006_rdy ),
    .xbar_req$007_rdy  ( ctrl$xbar_req$007_rdy ),
    .a_in_valid$000    ( ctrl$a_in_valid$000 ),
    .a_in_valid$001    ( ctrl$a_in_valid$001 ),
    .a_in_valid$002    ( ctrl$a_in_valid$002 ),
    .a_in_valid$003    ( ctrl$a_in_valid$003 ),
    .a_in_valid$004    ( ctrl$a_in_valid$004 ),
    .a_in_valid$005    ( ctrl$a_in_valid$005 ),
    .a_in_valid$006    ( ctrl$a_in_valid$006 ),
    .a_in_valid$007    ( ctrl$a_in_valid$007 ),
    .a_in_valid$008    ( ctrl$a_in_valid$008 ),
    .a_in_valid$009    ( ctrl$a_in_valid$009 ),
    .a_in_valid$010    ( ctrl$a_in_valid$010 ),
    .a_in_valid$011    ( ctrl$a_in_valid$011 ),
    .a_in_valid$012    ( ctrl$a_in_valid$012 ),
    .a_in_valid$013    ( ctrl$a_in_valid$013 ),
    .a_in_valid$014    ( ctrl$a_in_valid$014 ),
    .a_in_valid$015    ( ctrl$a_in_valid$015 ),
    .a_in_valid$016    ( ctrl$a_in_valid$016 ),
    .a_in_valid$017    ( ctrl$a_in_valid$017 ),
    .a_in_valid$018    ( ctrl$a_in_valid$018 ),
    .a_in_valid$019    ( ctrl$a_in_valid$019 ),
    .a_in_valid$020    ( ctrl$a_in_valid$020 ),
    .a_in_valid$021    ( ctrl$a_in_valid$021 ),
    .a_in_valid$022    ( ctrl$a_in_valid$022 ),
    .a_in_valid$023    ( ctrl$a_in_valid$023 ),
    .a_in_valid$024    ( ctrl$a_in_valid$024 ),
    .a_in_valid$025    ( ctrl$a_in_valid$025 ),
    .a_in_valid$026    ( ctrl$a_in_valid$026 ),
    .a_in_valid$027    ( ctrl$a_in_valid$027 ),
    .a_in_valid$028    ( ctrl$a_in_valid$028 ),
    .a_in_valid$029    ( ctrl$a_in_valid$029 ),
    .a_in_valid$030    ( ctrl$a_in_valid$030 ),
    .a_in_valid$031    ( ctrl$a_in_valid$031 ),
    .a_in_valid$032    ( ctrl$a_in_valid$032 ),
    .a_in_valid$033    ( ctrl$a_in_valid$033 ),
    .a_in_valid$034    ( ctrl$a_in_valid$034 ),
    .a_in_valid$035    ( ctrl$a_in_valid$035 ),
    .a_in_valid$036    ( ctrl$a_in_valid$036 ),
    .a_in_valid$037    ( ctrl$a_in_valid$037 ),
    .a_in_valid$038    ( ctrl$a_in_valid$038 ),
    .a_in_valid$039    ( ctrl$a_in_valid$039 ),
    .a_in_valid$040    ( ctrl$a_in_valid$040 ),
    .a_in_valid$041    ( ctrl$a_in_valid$041 ),
    .a_in_valid$042    ( ctrl$a_in_valid$042 ),
    .a_in_valid$043    ( ctrl$a_in_valid$043 ),
    .a_in_valid$044    ( ctrl$a_in_valid$044 ),
    .a_in_valid$045    ( ctrl$a_in_valid$045 ),
    .a_in_valid$046    ( ctrl$a_in_valid$046 ),
    .a_in_valid$047    ( ctrl$a_in_valid$047 ),
    .a_in_valid$048    ( ctrl$a_in_valid$048 ),
    .a_in_valid$049    ( ctrl$a_in_valid$049 ),
    .a_in_valid$050    ( ctrl$a_in_valid$050 ),
    .a_in_valid$051    ( ctrl$a_in_valid$051 ),
    .a_in_valid$052    ( ctrl$a_in_valid$052 ),
    .a_in_valid$053    ( ctrl$a_in_valid$053 ),
    .a_in_valid$054    ( ctrl$a_in_valid$054 ),
    .a_in_valid$055    ( ctrl$a_in_valid$055 ),
    .a_in_valid$056    ( ctrl$a_in_valid$056 ),
    .a_in_valid$057    ( ctrl$a_in_valid$057 ),
    .a_in_valid$058    ( ctrl$a_in_valid$058 ),
    .a_in_valid$059    ( ctrl$a_in_valid$059 ),
    .a_in_valid$060    ( ctrl$a_in_valid$060 ),
    .a_in_valid$061    ( ctrl$a_in_valid$061 ),
    .a_in_valid$062    ( ctrl$a_in_valid$062 ),
    .a_in_valid$063    ( ctrl$a_in_valid$063 ),
    .mi_select$000     ( ctrl$mi_select$000 ),
    .mi_select$001     ( ctrl$mi_select$001 ),
    .mi_select$002     ( ctrl$mi_select$002 ),
    .mi_select$003     ( ctrl$mi_select$003 ),
    .mi_select$004     ( ctrl$mi_select$004 ),
    .mi_select$005     ( ctrl$mi_select$005 ),
    .mi_select$006     ( ctrl$mi_select$006 ),
    .mi_select$007     ( ctrl$mi_select$007 ),
    .mo_select$000     ( ctrl$mo_select$000 ),
    .mo_select$001     ( ctrl$mo_select$001 ),
    .mo_select$002     ( ctrl$mo_select$002 ),
    .mo_select$003     ( ctrl$mo_select$003 ),
    .mo_select$004     ( ctrl$mo_select$004 ),
    .mo_select$005     ( ctrl$mo_select$005 ),
    .mo_select$006     ( ctrl$mo_select$006 ),
    .mo_select$007     ( ctrl$mo_select$007 ),
    .xbar_resp_val$000 ( ctrl$xbar_resp_val$000 ),
    .xbar_resp_val$001 ( ctrl$xbar_resp_val$001 ),
    .xbar_resp_val$002 ( ctrl$xbar_resp_val$002 ),
    .xbar_resp_val$003 ( ctrl$xbar_resp_val$003 ),
    .xbar_resp_val$004 ( ctrl$xbar_resp_val$004 ),
    .xbar_resp_val$005 ( ctrl$xbar_resp_val$005 ),
    .xbar_resp_val$006 ( ctrl$xbar_resp_val$006 ),
    .xbar_resp_val$007 ( ctrl$xbar_resp_val$007 ),
    .bank_req_val$000  ( ctrl$bank_req_val$000 ),
    .bank_req_val$001  ( ctrl$bank_req_val$001 ),
    .bank_req_val$002  ( ctrl$bank_req_val$002 ),
    .bank_req_val$003  ( ctrl$bank_req_val$003 ),
    .bank_req_val$004  ( ctrl$bank_req_val$004 ),
    .bank_req_val$005  ( ctrl$bank_req_val$005 ),
    .bank_req_val$006  ( ctrl$bank_req_val$006 ),
    .bank_req_val$007  ( ctrl$bank_req_val$007 ),
    .bank_resp_rdy$000 ( ctrl$bank_resp_rdy$000 ),
    .bank_resp_rdy$001 ( ctrl$bank_resp_rdy$001 ),
    .bank_resp_rdy$002 ( ctrl$bank_resp_rdy$002 ),
    .bank_resp_rdy$003 ( ctrl$bank_resp_rdy$003 ),
    .bank_resp_rdy$004 ( ctrl$bank_resp_rdy$004 ),
    .bank_resp_rdy$005 ( ctrl$bank_resp_rdy$005 ),
    .bank_resp_rdy$006 ( ctrl$bank_resp_rdy$006 ),
    .bank_resp_rdy$007 ( ctrl$bank_resp_rdy$007 )
  );

  // dpath temporaries
  wire   [   0:0] dpath$clk;
  wire   [   0:0] dpath$reset;
  wire   [  31:0] dpath$xbar_req_msg$000;
  wire   [  31:0] dpath$xbar_req_msg$001;
  wire   [  31:0] dpath$xbar_req_msg$002;
  wire   [  31:0] dpath$xbar_req_msg$003;
  wire   [  31:0] dpath$xbar_req_msg$004;
  wire   [  31:0] dpath$xbar_req_msg$005;
  wire   [  31:0] dpath$xbar_req_msg$006;
  wire   [  31:0] dpath$xbar_req_msg$007;
  wire   [   0:0] dpath$a_in_valid$000;
  wire   [   0:0] dpath$a_in_valid$001;
  wire   [   0:0] dpath$a_in_valid$002;
  wire   [   0:0] dpath$a_in_valid$003;
  wire   [   0:0] dpath$a_in_valid$004;
  wire   [   0:0] dpath$a_in_valid$005;
  wire   [   0:0] dpath$a_in_valid$006;
  wire   [   0:0] dpath$a_in_valid$007;
  wire   [   0:0] dpath$a_in_valid$008;
  wire   [   0:0] dpath$a_in_valid$009;
  wire   [   0:0] dpath$a_in_valid$010;
  wire   [   0:0] dpath$a_in_valid$011;
  wire   [   0:0] dpath$a_in_valid$012;
  wire   [   0:0] dpath$a_in_valid$013;
  wire   [   0:0] dpath$a_in_valid$014;
  wire   [   0:0] dpath$a_in_valid$015;
  wire   [   0:0] dpath$a_in_valid$016;
  wire   [   0:0] dpath$a_in_valid$017;
  wire   [   0:0] dpath$a_in_valid$018;
  wire   [   0:0] dpath$a_in_valid$019;
  wire   [   0:0] dpath$a_in_valid$020;
  wire   [   0:0] dpath$a_in_valid$021;
  wire   [   0:0] dpath$a_in_valid$022;
  wire   [   0:0] dpath$a_in_valid$023;
  wire   [   0:0] dpath$a_in_valid$024;
  wire   [   0:0] dpath$a_in_valid$025;
  wire   [   0:0] dpath$a_in_valid$026;
  wire   [   0:0] dpath$a_in_valid$027;
  wire   [   0:0] dpath$a_in_valid$028;
  wire   [   0:0] dpath$a_in_valid$029;
  wire   [   0:0] dpath$a_in_valid$030;
  wire   [   0:0] dpath$a_in_valid$031;
  wire   [   0:0] dpath$a_in_valid$032;
  wire   [   0:0] dpath$a_in_valid$033;
  wire   [   0:0] dpath$a_in_valid$034;
  wire   [   0:0] dpath$a_in_valid$035;
  wire   [   0:0] dpath$a_in_valid$036;
  wire   [   0:0] dpath$a_in_valid$037;
  wire   [   0:0] dpath$a_in_valid$038;
  wire   [   0:0] dpath$a_in_valid$039;
  wire   [   0:0] dpath$a_in_valid$040;
  wire   [   0:0] dpath$a_in_valid$041;
  wire   [   0:0] dpath$a_in_valid$042;
  wire   [   0:0] dpath$a_in_valid$043;
  wire   [   0:0] dpath$a_in_valid$044;
  wire   [   0:0] dpath$a_in_valid$045;
  wire   [   0:0] dpath$a_in_valid$046;
  wire   [   0:0] dpath$a_in_valid$047;
  wire   [   0:0] dpath$a_in_valid$048;
  wire   [   0:0] dpath$a_in_valid$049;
  wire   [   0:0] dpath$a_in_valid$050;
  wire   [   0:0] dpath$a_in_valid$051;
  wire   [   0:0] dpath$a_in_valid$052;
  wire   [   0:0] dpath$a_in_valid$053;
  wire   [   0:0] dpath$a_in_valid$054;
  wire   [   0:0] dpath$a_in_valid$055;
  wire   [   0:0] dpath$a_in_valid$056;
  wire   [   0:0] dpath$a_in_valid$057;
  wire   [   0:0] dpath$a_in_valid$058;
  wire   [   0:0] dpath$a_in_valid$059;
  wire   [   0:0] dpath$a_in_valid$060;
  wire   [   0:0] dpath$a_in_valid$061;
  wire   [   0:0] dpath$a_in_valid$062;
  wire   [   0:0] dpath$a_in_valid$063;
  wire   [   2:0] dpath$mi_select$000;
  wire   [   2:0] dpath$mi_select$001;
  wire   [   2:0] dpath$mi_select$002;
  wire   [   2:0] dpath$mi_select$003;
  wire   [   2:0] dpath$mi_select$004;
  wire   [   2:0] dpath$mi_select$005;
  wire   [   2:0] dpath$mi_select$006;
  wire   [   2:0] dpath$mi_select$007;
  wire   [   2:0] dpath$mo_select$000;
  wire   [   2:0] dpath$mo_select$001;
  wire   [   2:0] dpath$mo_select$002;
  wire   [   2:0] dpath$mo_select$003;
  wire   [   2:0] dpath$mo_select$004;
  wire   [   2:0] dpath$mo_select$005;
  wire   [   2:0] dpath$mo_select$006;
  wire   [   2:0] dpath$mo_select$007;
  wire   [  63:0] dpath$bank_resp_msg$000;
  wire   [  63:0] dpath$bank_resp_msg$001;
  wire   [  63:0] dpath$bank_resp_msg$002;
  wire   [  63:0] dpath$bank_resp_msg$003;
  wire   [  63:0] dpath$bank_resp_msg$004;
  wire   [  63:0] dpath$bank_resp_msg$005;
  wire   [  63:0] dpath$bank_resp_msg$006;
  wire   [  63:0] dpath$bank_resp_msg$007;
  wire   [   2:0] dpath$a_out$000;
  wire   [   2:0] dpath$a_out$001;
  wire   [   2:0] dpath$a_out$002;
  wire   [   2:0] dpath$a_out$003;
  wire   [   2:0] dpath$a_out$004;
  wire   [   2:0] dpath$a_out$005;
  wire   [   2:0] dpath$a_out$006;
  wire   [   2:0] dpath$a_out$007;
  wire   [   0:0] dpath$a_out_valid$000;
  wire   [   0:0] dpath$a_out_valid$001;
  wire   [   0:0] dpath$a_out_valid$002;
  wire   [   0:0] dpath$a_out_valid$003;
  wire   [   0:0] dpath$a_out_valid$004;
  wire   [   0:0] dpath$a_out_valid$005;
  wire   [   0:0] dpath$a_out_valid$006;
  wire   [   0:0] dpath$a_out_valid$007;
  wire   [  31:0] dpath$bank_req_msg$000;
  wire   [  31:0] dpath$bank_req_msg$001;
  wire   [  31:0] dpath$bank_req_msg$002;
  wire   [  31:0] dpath$bank_req_msg$003;
  wire   [  31:0] dpath$bank_req_msg$004;
  wire   [  31:0] dpath$bank_req_msg$005;
  wire   [  31:0] dpath$bank_req_msg$006;
  wire   [  31:0] dpath$bank_req_msg$007;
  wire   [  63:0] dpath$xbar_resp_msg$000;
  wire   [  63:0] dpath$xbar_resp_msg$001;
  wire   [  63:0] dpath$xbar_resp_msg$002;
  wire   [  63:0] dpath$xbar_resp_msg$003;
  wire   [  63:0] dpath$xbar_resp_msg$004;
  wire   [  63:0] dpath$xbar_resp_msg$005;
  wire   [  63:0] dpath$xbar_resp_msg$006;
  wire   [  63:0] dpath$xbar_resp_msg$007;

  Datapath_0x17612b122a0ef6cb dpath
  (
    .clk               ( dpath$clk ),
    .reset             ( dpath$reset ),
    .xbar_req_msg$000  ( dpath$xbar_req_msg$000 ),
    .xbar_req_msg$001  ( dpath$xbar_req_msg$001 ),
    .xbar_req_msg$002  ( dpath$xbar_req_msg$002 ),
    .xbar_req_msg$003  ( dpath$xbar_req_msg$003 ),
    .xbar_req_msg$004  ( dpath$xbar_req_msg$004 ),
    .xbar_req_msg$005  ( dpath$xbar_req_msg$005 ),
    .xbar_req_msg$006  ( dpath$xbar_req_msg$006 ),
    .xbar_req_msg$007  ( dpath$xbar_req_msg$007 ),
    .a_in_valid$000    ( dpath$a_in_valid$000 ),
    .a_in_valid$001    ( dpath$a_in_valid$001 ),
    .a_in_valid$002    ( dpath$a_in_valid$002 ),
    .a_in_valid$003    ( dpath$a_in_valid$003 ),
    .a_in_valid$004    ( dpath$a_in_valid$004 ),
    .a_in_valid$005    ( dpath$a_in_valid$005 ),
    .a_in_valid$006    ( dpath$a_in_valid$006 ),
    .a_in_valid$007    ( dpath$a_in_valid$007 ),
    .a_in_valid$008    ( dpath$a_in_valid$008 ),
    .a_in_valid$009    ( dpath$a_in_valid$009 ),
    .a_in_valid$010    ( dpath$a_in_valid$010 ),
    .a_in_valid$011    ( dpath$a_in_valid$011 ),
    .a_in_valid$012    ( dpath$a_in_valid$012 ),
    .a_in_valid$013    ( dpath$a_in_valid$013 ),
    .a_in_valid$014    ( dpath$a_in_valid$014 ),
    .a_in_valid$015    ( dpath$a_in_valid$015 ),
    .a_in_valid$016    ( dpath$a_in_valid$016 ),
    .a_in_valid$017    ( dpath$a_in_valid$017 ),
    .a_in_valid$018    ( dpath$a_in_valid$018 ),
    .a_in_valid$019    ( dpath$a_in_valid$019 ),
    .a_in_valid$020    ( dpath$a_in_valid$020 ),
    .a_in_valid$021    ( dpath$a_in_valid$021 ),
    .a_in_valid$022    ( dpath$a_in_valid$022 ),
    .a_in_valid$023    ( dpath$a_in_valid$023 ),
    .a_in_valid$024    ( dpath$a_in_valid$024 ),
    .a_in_valid$025    ( dpath$a_in_valid$025 ),
    .a_in_valid$026    ( dpath$a_in_valid$026 ),
    .a_in_valid$027    ( dpath$a_in_valid$027 ),
    .a_in_valid$028    ( dpath$a_in_valid$028 ),
    .a_in_valid$029    ( dpath$a_in_valid$029 ),
    .a_in_valid$030    ( dpath$a_in_valid$030 ),
    .a_in_valid$031    ( dpath$a_in_valid$031 ),
    .a_in_valid$032    ( dpath$a_in_valid$032 ),
    .a_in_valid$033    ( dpath$a_in_valid$033 ),
    .a_in_valid$034    ( dpath$a_in_valid$034 ),
    .a_in_valid$035    ( dpath$a_in_valid$035 ),
    .a_in_valid$036    ( dpath$a_in_valid$036 ),
    .a_in_valid$037    ( dpath$a_in_valid$037 ),
    .a_in_valid$038    ( dpath$a_in_valid$038 ),
    .a_in_valid$039    ( dpath$a_in_valid$039 ),
    .a_in_valid$040    ( dpath$a_in_valid$040 ),
    .a_in_valid$041    ( dpath$a_in_valid$041 ),
    .a_in_valid$042    ( dpath$a_in_valid$042 ),
    .a_in_valid$043    ( dpath$a_in_valid$043 ),
    .a_in_valid$044    ( dpath$a_in_valid$044 ),
    .a_in_valid$045    ( dpath$a_in_valid$045 ),
    .a_in_valid$046    ( dpath$a_in_valid$046 ),
    .a_in_valid$047    ( dpath$a_in_valid$047 ),
    .a_in_valid$048    ( dpath$a_in_valid$048 ),
    .a_in_valid$049    ( dpath$a_in_valid$049 ),
    .a_in_valid$050    ( dpath$a_in_valid$050 ),
    .a_in_valid$051    ( dpath$a_in_valid$051 ),
    .a_in_valid$052    ( dpath$a_in_valid$052 ),
    .a_in_valid$053    ( dpath$a_in_valid$053 ),
    .a_in_valid$054    ( dpath$a_in_valid$054 ),
    .a_in_valid$055    ( dpath$a_in_valid$055 ),
    .a_in_valid$056    ( dpath$a_in_valid$056 ),
    .a_in_valid$057    ( dpath$a_in_valid$057 ),
    .a_in_valid$058    ( dpath$a_in_valid$058 ),
    .a_in_valid$059    ( dpath$a_in_valid$059 ),
    .a_in_valid$060    ( dpath$a_in_valid$060 ),
    .a_in_valid$061    ( dpath$a_in_valid$061 ),
    .a_in_valid$062    ( dpath$a_in_valid$062 ),
    .a_in_valid$063    ( dpath$a_in_valid$063 ),
    .mi_select$000     ( dpath$mi_select$000 ),
    .mi_select$001     ( dpath$mi_select$001 ),
    .mi_select$002     ( dpath$mi_select$002 ),
    .mi_select$003     ( dpath$mi_select$003 ),
    .mi_select$004     ( dpath$mi_select$004 ),
    .mi_select$005     ( dpath$mi_select$005 ),
    .mi_select$006     ( dpath$mi_select$006 ),
    .mi_select$007     ( dpath$mi_select$007 ),
    .mo_select$000     ( dpath$mo_select$000 ),
    .mo_select$001     ( dpath$mo_select$001 ),
    .mo_select$002     ( dpath$mo_select$002 ),
    .mo_select$003     ( dpath$mo_select$003 ),
    .mo_select$004     ( dpath$mo_select$004 ),
    .mo_select$005     ( dpath$mo_select$005 ),
    .mo_select$006     ( dpath$mo_select$006 ),
    .mo_select$007     ( dpath$mo_select$007 ),
    .bank_resp_msg$000 ( dpath$bank_resp_msg$000 ),
    .bank_resp_msg$001 ( dpath$bank_resp_msg$001 ),
    .bank_resp_msg$002 ( dpath$bank_resp_msg$002 ),
    .bank_resp_msg$003 ( dpath$bank_resp_msg$003 ),
    .bank_resp_msg$004 ( dpath$bank_resp_msg$004 ),
    .bank_resp_msg$005 ( dpath$bank_resp_msg$005 ),
    .bank_resp_msg$006 ( dpath$bank_resp_msg$006 ),
    .bank_resp_msg$007 ( dpath$bank_resp_msg$007 ),
    .a_out$000         ( dpath$a_out$000 ),
    .a_out$001         ( dpath$a_out$001 ),
    .a_out$002         ( dpath$a_out$002 ),
    .a_out$003         ( dpath$a_out$003 ),
    .a_out$004         ( dpath$a_out$004 ),
    .a_out$005         ( dpath$a_out$005 ),
    .a_out$006         ( dpath$a_out$006 ),
    .a_out$007         ( dpath$a_out$007 ),
    .a_out_valid$000   ( dpath$a_out_valid$000 ),
    .a_out_valid$001   ( dpath$a_out_valid$001 ),
    .a_out_valid$002   ( dpath$a_out_valid$002 ),
    .a_out_valid$003   ( dpath$a_out_valid$003 ),
    .a_out_valid$004   ( dpath$a_out_valid$004 ),
    .a_out_valid$005   ( dpath$a_out_valid$005 ),
    .a_out_valid$006   ( dpath$a_out_valid$006 ),
    .a_out_valid$007   ( dpath$a_out_valid$007 ),
    .bank_req_msg$000  ( dpath$bank_req_msg$000 ),
    .bank_req_msg$001  ( dpath$bank_req_msg$001 ),
    .bank_req_msg$002  ( dpath$bank_req_msg$002 ),
    .bank_req_msg$003  ( dpath$bank_req_msg$003 ),
    .bank_req_msg$004  ( dpath$bank_req_msg$004 ),
    .bank_req_msg$005  ( dpath$bank_req_msg$005 ),
    .bank_req_msg$006  ( dpath$bank_req_msg$006 ),
    .bank_req_msg$007  ( dpath$bank_req_msg$007 ),
    .xbar_resp_msg$000 ( dpath$xbar_resp_msg$000 ),
    .xbar_resp_msg$001 ( dpath$xbar_resp_msg$001 ),
    .xbar_resp_msg$002 ( dpath$xbar_resp_msg$002 ),
    .xbar_resp_msg$003 ( dpath$xbar_resp_msg$003 ),
    .xbar_resp_msg$004 ( dpath$xbar_resp_msg$004 ),
    .xbar_resp_msg$005 ( dpath$xbar_resp_msg$005 ),
    .xbar_resp_msg$006 ( dpath$xbar_resp_msg$006 ),
    .xbar_resp_msg$007 ( dpath$xbar_resp_msg$007 )
  );

  // signal connections
  assign bank_req$000_msg        = dpath$bank_req_msg$000;
  assign bank_req$000_val        = ctrl$bank_req_val$000;
  assign bank_req$001_msg        = dpath$bank_req_msg$001;
  assign bank_req$001_val        = ctrl$bank_req_val$001;
  assign bank_req$002_msg        = dpath$bank_req_msg$002;
  assign bank_req$002_val        = ctrl$bank_req_val$002;
  assign bank_req$003_msg        = dpath$bank_req_msg$003;
  assign bank_req$003_val        = ctrl$bank_req_val$003;
  assign bank_req$004_msg        = dpath$bank_req_msg$004;
  assign bank_req$004_val        = ctrl$bank_req_val$004;
  assign bank_req$005_msg        = dpath$bank_req_msg$005;
  assign bank_req$005_val        = ctrl$bank_req_val$005;
  assign bank_req$006_msg        = dpath$bank_req_msg$006;
  assign bank_req$006_val        = ctrl$bank_req_val$006;
  assign bank_req$007_msg        = dpath$bank_req_msg$007;
  assign bank_req$007_val        = ctrl$bank_req_val$007;
  assign bank_resp$000_rdy       = ctrl$bank_resp_rdy$000;
  assign bank_resp$001_rdy       = ctrl$bank_resp_rdy$001;
  assign bank_resp$002_rdy       = ctrl$bank_resp_rdy$002;
  assign bank_resp$003_rdy       = ctrl$bank_resp_rdy$003;
  assign bank_resp$004_rdy       = ctrl$bank_resp_rdy$004;
  assign bank_resp$005_rdy       = ctrl$bank_resp_rdy$005;
  assign bank_resp$006_rdy       = ctrl$bank_resp_rdy$006;
  assign bank_resp$007_rdy       = ctrl$bank_resp_rdy$007;
  assign ctrl$a_out$000          = dpath$a_out$000;
  assign ctrl$a_out$001          = dpath$a_out$001;
  assign ctrl$a_out$002          = dpath$a_out$002;
  assign ctrl$a_out$003          = dpath$a_out$003;
  assign ctrl$a_out$004          = dpath$a_out$004;
  assign ctrl$a_out$005          = dpath$a_out$005;
  assign ctrl$a_out$006          = dpath$a_out$006;
  assign ctrl$a_out$007          = dpath$a_out$007;
  assign ctrl$a_out_valid$000    = dpath$a_out_valid$000;
  assign ctrl$a_out_valid$001    = dpath$a_out_valid$001;
  assign ctrl$a_out_valid$002    = dpath$a_out_valid$002;
  assign ctrl$a_out_valid$003    = dpath$a_out_valid$003;
  assign ctrl$a_out_valid$004    = dpath$a_out_valid$004;
  assign ctrl$a_out_valid$005    = dpath$a_out_valid$005;
  assign ctrl$a_out_valid$006    = dpath$a_out_valid$006;
  assign ctrl$a_out_valid$007    = dpath$a_out_valid$007;
  assign ctrl$bank_req_rdy$000   = bank_req$000_rdy;
  assign ctrl$bank_req_rdy$001   = bank_req$001_rdy;
  assign ctrl$bank_req_rdy$002   = bank_req$002_rdy;
  assign ctrl$bank_req_rdy$003   = bank_req$003_rdy;
  assign ctrl$bank_req_rdy$004   = bank_req$004_rdy;
  assign ctrl$bank_req_rdy$005   = bank_req$005_rdy;
  assign ctrl$bank_req_rdy$006   = bank_req$006_rdy;
  assign ctrl$bank_req_rdy$007   = bank_req$007_rdy;
  assign ctrl$bank_resp_val$000  = bank_resp$000_val;
  assign ctrl$bank_resp_val$001  = bank_resp$001_val;
  assign ctrl$bank_resp_val$002  = bank_resp$002_val;
  assign ctrl$bank_resp_val$003  = bank_resp$003_val;
  assign ctrl$bank_resp_val$004  = bank_resp$004_val;
  assign ctrl$bank_resp_val$005  = bank_resp$005_val;
  assign ctrl$bank_resp_val$006  = bank_resp$006_val;
  assign ctrl$bank_resp_val$007  = bank_resp$007_val;
  assign ctrl$clk                = clk;
  assign ctrl$reset              = reset;
  assign ctrl$xbar_req$000_msg   = xbar_req$000_msg;
  assign ctrl$xbar_req$000_val   = xbar_req$000_val;
  assign ctrl$xbar_req$001_msg   = xbar_req$001_msg;
  assign ctrl$xbar_req$001_val   = xbar_req$001_val;
  assign ctrl$xbar_req$002_msg   = xbar_req$002_msg;
  assign ctrl$xbar_req$002_val   = xbar_req$002_val;
  assign ctrl$xbar_req$003_msg   = xbar_req$003_msg;
  assign ctrl$xbar_req$003_val   = xbar_req$003_val;
  assign ctrl$xbar_req$004_msg   = xbar_req$004_msg;
  assign ctrl$xbar_req$004_val   = xbar_req$004_val;
  assign ctrl$xbar_req$005_msg   = xbar_req$005_msg;
  assign ctrl$xbar_req$005_val   = xbar_req$005_val;
  assign ctrl$xbar_req$006_msg   = xbar_req$006_msg;
  assign ctrl$xbar_req$006_val   = xbar_req$006_val;
  assign ctrl$xbar_req$007_msg   = xbar_req$007_msg;
  assign ctrl$xbar_req$007_val   = xbar_req$007_val;
  assign ctrl$xbar_resp_rdy$000  = xbar_resp$000_rdy;
  assign ctrl$xbar_resp_rdy$001  = xbar_resp$001_rdy;
  assign ctrl$xbar_resp_rdy$002  = xbar_resp$002_rdy;
  assign ctrl$xbar_resp_rdy$003  = xbar_resp$003_rdy;
  assign ctrl$xbar_resp_rdy$004  = xbar_resp$004_rdy;
  assign ctrl$xbar_resp_rdy$005  = xbar_resp$005_rdy;
  assign ctrl$xbar_resp_rdy$006  = xbar_resp$006_rdy;
  assign ctrl$xbar_resp_rdy$007  = xbar_resp$007_rdy;
  assign dpath$a_in_valid$000    = ctrl$a_in_valid$000;
  assign dpath$a_in_valid$001    = ctrl$a_in_valid$001;
  assign dpath$a_in_valid$002    = ctrl$a_in_valid$002;
  assign dpath$a_in_valid$003    = ctrl$a_in_valid$003;
  assign dpath$a_in_valid$004    = ctrl$a_in_valid$004;
  assign dpath$a_in_valid$005    = ctrl$a_in_valid$005;
  assign dpath$a_in_valid$006    = ctrl$a_in_valid$006;
  assign dpath$a_in_valid$007    = ctrl$a_in_valid$007;
  assign dpath$a_in_valid$008    = ctrl$a_in_valid$008;
  assign dpath$a_in_valid$009    = ctrl$a_in_valid$009;
  assign dpath$a_in_valid$010    = ctrl$a_in_valid$010;
  assign dpath$a_in_valid$011    = ctrl$a_in_valid$011;
  assign dpath$a_in_valid$012    = ctrl$a_in_valid$012;
  assign dpath$a_in_valid$013    = ctrl$a_in_valid$013;
  assign dpath$a_in_valid$014    = ctrl$a_in_valid$014;
  assign dpath$a_in_valid$015    = ctrl$a_in_valid$015;
  assign dpath$a_in_valid$016    = ctrl$a_in_valid$016;
  assign dpath$a_in_valid$017    = ctrl$a_in_valid$017;
  assign dpath$a_in_valid$018    = ctrl$a_in_valid$018;
  assign dpath$a_in_valid$019    = ctrl$a_in_valid$019;
  assign dpath$a_in_valid$020    = ctrl$a_in_valid$020;
  assign dpath$a_in_valid$021    = ctrl$a_in_valid$021;
  assign dpath$a_in_valid$022    = ctrl$a_in_valid$022;
  assign dpath$a_in_valid$023    = ctrl$a_in_valid$023;
  assign dpath$a_in_valid$024    = ctrl$a_in_valid$024;
  assign dpath$a_in_valid$025    = ctrl$a_in_valid$025;
  assign dpath$a_in_valid$026    = ctrl$a_in_valid$026;
  assign dpath$a_in_valid$027    = ctrl$a_in_valid$027;
  assign dpath$a_in_valid$028    = ctrl$a_in_valid$028;
  assign dpath$a_in_valid$029    = ctrl$a_in_valid$029;
  assign dpath$a_in_valid$030    = ctrl$a_in_valid$030;
  assign dpath$a_in_valid$031    = ctrl$a_in_valid$031;
  assign dpath$a_in_valid$032    = ctrl$a_in_valid$032;
  assign dpath$a_in_valid$033    = ctrl$a_in_valid$033;
  assign dpath$a_in_valid$034    = ctrl$a_in_valid$034;
  assign dpath$a_in_valid$035    = ctrl$a_in_valid$035;
  assign dpath$a_in_valid$036    = ctrl$a_in_valid$036;
  assign dpath$a_in_valid$037    = ctrl$a_in_valid$037;
  assign dpath$a_in_valid$038    = ctrl$a_in_valid$038;
  assign dpath$a_in_valid$039    = ctrl$a_in_valid$039;
  assign dpath$a_in_valid$040    = ctrl$a_in_valid$040;
  assign dpath$a_in_valid$041    = ctrl$a_in_valid$041;
  assign dpath$a_in_valid$042    = ctrl$a_in_valid$042;
  assign dpath$a_in_valid$043    = ctrl$a_in_valid$043;
  assign dpath$a_in_valid$044    = ctrl$a_in_valid$044;
  assign dpath$a_in_valid$045    = ctrl$a_in_valid$045;
  assign dpath$a_in_valid$046    = ctrl$a_in_valid$046;
  assign dpath$a_in_valid$047    = ctrl$a_in_valid$047;
  assign dpath$a_in_valid$048    = ctrl$a_in_valid$048;
  assign dpath$a_in_valid$049    = ctrl$a_in_valid$049;
  assign dpath$a_in_valid$050    = ctrl$a_in_valid$050;
  assign dpath$a_in_valid$051    = ctrl$a_in_valid$051;
  assign dpath$a_in_valid$052    = ctrl$a_in_valid$052;
  assign dpath$a_in_valid$053    = ctrl$a_in_valid$053;
  assign dpath$a_in_valid$054    = ctrl$a_in_valid$054;
  assign dpath$a_in_valid$055    = ctrl$a_in_valid$055;
  assign dpath$a_in_valid$056    = ctrl$a_in_valid$056;
  assign dpath$a_in_valid$057    = ctrl$a_in_valid$057;
  assign dpath$a_in_valid$058    = ctrl$a_in_valid$058;
  assign dpath$a_in_valid$059    = ctrl$a_in_valid$059;
  assign dpath$a_in_valid$060    = ctrl$a_in_valid$060;
  assign dpath$a_in_valid$061    = ctrl$a_in_valid$061;
  assign dpath$a_in_valid$062    = ctrl$a_in_valid$062;
  assign dpath$a_in_valid$063    = ctrl$a_in_valid$063;
  assign dpath$bank_resp_msg$000 = bank_resp$000_msg;
  assign dpath$bank_resp_msg$001 = bank_resp$001_msg;
  assign dpath$bank_resp_msg$002 = bank_resp$002_msg;
  assign dpath$bank_resp_msg$003 = bank_resp$003_msg;
  assign dpath$bank_resp_msg$004 = bank_resp$004_msg;
  assign dpath$bank_resp_msg$005 = bank_resp$005_msg;
  assign dpath$bank_resp_msg$006 = bank_resp$006_msg;
  assign dpath$bank_resp_msg$007 = bank_resp$007_msg;
  assign dpath$clk               = clk;
  assign dpath$mi_select$000     = ctrl$mi_select$000;
  assign dpath$mi_select$001     = ctrl$mi_select$001;
  assign dpath$mi_select$002     = ctrl$mi_select$002;
  assign dpath$mi_select$003     = ctrl$mi_select$003;
  assign dpath$mi_select$004     = ctrl$mi_select$004;
  assign dpath$mi_select$005     = ctrl$mi_select$005;
  assign dpath$mi_select$006     = ctrl$mi_select$006;
  assign dpath$mi_select$007     = ctrl$mi_select$007;
  assign dpath$mo_select$000     = ctrl$mo_select$000;
  assign dpath$mo_select$001     = ctrl$mo_select$001;
  assign dpath$mo_select$002     = ctrl$mo_select$002;
  assign dpath$mo_select$003     = ctrl$mo_select$003;
  assign dpath$mo_select$004     = ctrl$mo_select$004;
  assign dpath$mo_select$005     = ctrl$mo_select$005;
  assign dpath$mo_select$006     = ctrl$mo_select$006;
  assign dpath$mo_select$007     = ctrl$mo_select$007;
  assign dpath$reset             = reset;
  assign dpath$xbar_req_msg$000  = xbar_req$000_msg;
  assign dpath$xbar_req_msg$001  = xbar_req$001_msg;
  assign dpath$xbar_req_msg$002  = xbar_req$002_msg;
  assign dpath$xbar_req_msg$003  = xbar_req$003_msg;
  assign dpath$xbar_req_msg$004  = xbar_req$004_msg;
  assign dpath$xbar_req_msg$005  = xbar_req$005_msg;
  assign dpath$xbar_req_msg$006  = xbar_req$006_msg;
  assign dpath$xbar_req_msg$007  = xbar_req$007_msg;


  assign xbar_req$000_rdy        = ctrl$xbar_req$000_rdy;
  assign xbar_req$001_rdy        = ctrl$xbar_req$001_rdy;
  assign xbar_req$002_rdy        = ctrl$xbar_req$002_rdy;
  assign xbar_req$003_rdy        = ctrl$xbar_req$003_rdy;
  assign xbar_req$004_rdy        = ctrl$xbar_req$004_rdy;
  assign xbar_req$005_rdy        = ctrl$xbar_req$005_rdy;
  assign xbar_req$006_rdy        = ctrl$xbar_req$006_rdy;
  assign xbar_req$007_rdy        = ctrl$xbar_req$007_rdy;
  assign xbar_resp$000_msg       = dpath$xbar_resp_msg$000;
  assign xbar_resp$000_val       = ctrl$xbar_resp_val$000;
  assign xbar_resp$001_msg       = dpath$xbar_resp_msg$001;
  assign xbar_resp$001_val       = ctrl$xbar_resp_val$001;
  assign xbar_resp$002_msg       = dpath$xbar_resp_msg$002;
  assign xbar_resp$002_val       = ctrl$xbar_resp_val$002;
  assign xbar_resp$003_msg       = dpath$xbar_resp_msg$003;
  assign xbar_resp$003_val       = ctrl$xbar_resp_val$003;
  assign xbar_resp$004_msg       = dpath$xbar_resp_msg$004;
  assign xbar_resp$004_val       = ctrl$xbar_resp_val$004;
  assign xbar_resp$005_msg       = dpath$xbar_resp_msg$005;
  assign xbar_resp$005_val       = ctrl$xbar_resp_val$005;
  assign xbar_resp$006_msg       = dpath$xbar_resp_msg$006;
  assign xbar_resp$006_val       = ctrl$xbar_resp_val$006;
  assign xbar_resp$007_msg       = dpath$xbar_resp_msg$007;
  assign xbar_resp$007_val       = ctrl$xbar_resp_val$007;



endmodule // crossbar_0x48d3814e38ed84e5
`default_nettype wire

//-----------------------------------------------------------------------------
// Control_0x5bcef2db11135bb6
//-----------------------------------------------------------------------------
// PyMTL: dump_vcd = False
// PyMTL: xbar.Control {"nbits": 32, "nports": 8}
// PyMTL: verilator_xinit = zeros
`default_nettype none
module Control_0x5bcef2db11135bb6
(
  output wire [   0:0] a_in_valid$000,
  output wire [   0:0] a_in_valid$010,
  output wire [   0:0] a_in_valid$011,
  output wire [   0:0] a_in_valid$012,
  output wire [   0:0] a_in_valid$013,
  output wire [   0:0] a_in_valid$014,
  output wire [   0:0] a_in_valid$015,
  output wire [   0:0] a_in_valid$016,
  output wire [   0:0] a_in_valid$017,
  output wire [   0:0] a_in_valid$018,
  output wire [   0:0] a_in_valid$019,
  output wire [   0:0] a_in_valid$001,
  output wire [   0:0] a_in_valid$020,
  output wire [   0:0] a_in_valid$021,
  output wire [   0:0] a_in_valid$022,
  output wire [   0:0] a_in_valid$023,
  output wire [   0:0] a_in_valid$024,
  output wire [   0:0] a_in_valid$025,
  output wire [   0:0] a_in_valid$026,
  output wire [   0:0] a_in_valid$027,
  output wire [   0:0] a_in_valid$028,
  output wire [   0:0] a_in_valid$029,
  output wire [   0:0] a_in_valid$002,
  output wire [   0:0] a_in_valid$030,
  output wire [   0:0] a_in_valid$031,
  output wire [   0:0] a_in_valid$032,
  output wire [   0:0] a_in_valid$033,
  output wire [   0:0] a_in_valid$034,
  output wire [   0:0] a_in_valid$035,
  output wire [   0:0] a_in_valid$036,
  output wire [   0:0] a_in_valid$037,
  output wire [   0:0] a_in_valid$038,
  output wire [   0:0] a_in_valid$039,
  output wire [   0:0] a_in_valid$003,
  output wire [   0:0] a_in_valid$040,
  output wire [   0:0] a_in_valid$041,
  output wire [   0:0] a_in_valid$042,
  output wire [   0:0] a_in_valid$043,
  output wire [   0:0] a_in_valid$044,
  output wire [   0:0] a_in_valid$045,
  output wire [   0:0] a_in_valid$046,
  output wire [   0:0] a_in_valid$047,
  output wire [   0:0] a_in_valid$048,
  output wire [   0:0] a_in_valid$049,
  output wire [   0:0] a_in_valid$004,
  output wire [   0:0] a_in_valid$050,
  output wire [   0:0] a_in_valid$051,
  output wire [   0:0] a_in_valid$052,
  output wire [   0:0] a_in_valid$053,
  output wire [   0:0] a_in_valid$054,
  output wire [   0:0] a_in_valid$055,
  output wire [   0:0] a_in_valid$056,
  output wire [   0:0] a_in_valid$057,
  output wire [   0:0] a_in_valid$058,
  output wire [   0:0] a_in_valid$059,
  output wire [   0:0] a_in_valid$005,
  output wire [   0:0] a_in_valid$060,
  output wire [   0:0] a_in_valid$061,
  output wire [   0:0] a_in_valid$062,
  output wire [   0:0] a_in_valid$063,
  output wire [   0:0] a_in_valid$006,
  output wire [   0:0] a_in_valid$007,
  output wire [   0:0] a_in_valid$008,
  output wire [   0:0] a_in_valid$009,
  input  wire [   2:0] a_out$000,
  input  wire [   2:0] a_out$001,
  input  wire [   2:0] a_out$002,
  input  wire [   2:0] a_out$003,
  input  wire [   2:0] a_out$004,
  input  wire [   2:0] a_out$005,
  input  wire [   2:0] a_out$006,
  input  wire [   2:0] a_out$007,
  input  wire [   0:0] a_out_valid$000,
  input  wire [   0:0] a_out_valid$001,
  input  wire [   0:0] a_out_valid$002,
  input  wire [   0:0] a_out_valid$003,
  input  wire [   0:0] a_out_valid$004,
  input  wire [   0:0] a_out_valid$005,
  input  wire [   0:0] a_out_valid$006,
  input  wire [   0:0] a_out_valid$007,
  input  wire [   0:0] bank_req_rdy$000,
  input  wire [   0:0] bank_req_rdy$001,
  input  wire [   0:0] bank_req_rdy$002,
  input  wire [   0:0] bank_req_rdy$003,
  input  wire [   0:0] bank_req_rdy$004,
  input  wire [   0:0] bank_req_rdy$005,
  input  wire [   0:0] bank_req_rdy$006,
  input  wire [   0:0] bank_req_rdy$007,
  output wire [   0:0] bank_req_val$000,
  output wire [   0:0] bank_req_val$001,
  output wire [   0:0] bank_req_val$002,
  output wire [   0:0] bank_req_val$003,
  output wire [   0:0] bank_req_val$004,
  output wire [   0:0] bank_req_val$005,
  output wire [   0:0] bank_req_val$006,
  output wire [   0:0] bank_req_val$007,
  output wire [   0:0] bank_resp_rdy$000,
  output wire [   0:0] bank_resp_rdy$001,
  output wire [   0:0] bank_resp_rdy$002,
  output wire [   0:0] bank_resp_rdy$003,
  output wire [   0:0] bank_resp_rdy$004,
  output wire [   0:0] bank_resp_rdy$005,
  output wire [   0:0] bank_resp_rdy$006,
  output wire [   0:0] bank_resp_rdy$007,
  input  wire [   0:0] bank_resp_val$000,
  input  wire [   0:0] bank_resp_val$001,
  input  wire [   0:0] bank_resp_val$002,
  input  wire [   0:0] bank_resp_val$003,
  input  wire [   0:0] bank_resp_val$004,
  input  wire [   0:0] bank_resp_val$005,
  input  wire [   0:0] bank_resp_val$006,
  input  wire [   0:0] bank_resp_val$007,
  input  wire [   0:0] clk,
  output wire [   2:0] mi_select$000,
  output wire [   2:0] mi_select$001,
  output wire [   2:0] mi_select$002,
  output wire [   2:0] mi_select$003,
  output wire [   2:0] mi_select$004,
  output wire [   2:0] mi_select$005,
  output wire [   2:0] mi_select$006,
  output wire [   2:0] mi_select$007,
  output wire [   2:0] mo_select$000,
  output wire [   2:0] mo_select$001,
  output wire [   2:0] mo_select$002,
  output wire [   2:0] mo_select$003,
  output wire [   2:0] mo_select$004,
  output wire [   2:0] mo_select$005,
  output wire [   2:0] mo_select$006,
  output wire [   2:0] mo_select$007,
  input  wire [   0:0] reset,
  input  wire [  31:0] xbar_req$000_msg,
  output wire [   0:0] xbar_req$000_rdy,
  input  wire [   0:0] xbar_req$000_val,
  input  wire [  31:0] xbar_req$001_msg,
  output wire [   0:0] xbar_req$001_rdy,
  input  wire [   0:0] xbar_req$001_val,
  input  wire [  31:0] xbar_req$002_msg,
  output wire [   0:0] xbar_req$002_rdy,
  input  wire [   0:0] xbar_req$002_val,
  input  wire [  31:0] xbar_req$003_msg,
  output wire [   0:0] xbar_req$003_rdy,
  input  wire [   0:0] xbar_req$003_val,
  input  wire [  31:0] xbar_req$004_msg,
  output wire [   0:0] xbar_req$004_rdy,
  input  wire [   0:0] xbar_req$004_val,
  input  wire [  31:0] xbar_req$005_msg,
  output wire [   0:0] xbar_req$005_rdy,
  input  wire [   0:0] xbar_req$005_val,
  input  wire [  31:0] xbar_req$006_msg,
  output wire [   0:0] xbar_req$006_rdy,
  input  wire [   0:0] xbar_req$006_val,
  input  wire [  31:0] xbar_req$007_msg,
  output wire [   0:0] xbar_req$007_rdy,
  input  wire [   0:0] xbar_req$007_val,
  input  wire [   0:0] xbar_resp_rdy$000,
  input  wire [   0:0] xbar_resp_rdy$001,
  input  wire [   0:0] xbar_resp_rdy$002,
  input  wire [   0:0] xbar_resp_rdy$003,
  input  wire [   0:0] xbar_resp_rdy$004,
  input  wire [   0:0] xbar_resp_rdy$005,
  input  wire [   0:0] xbar_resp_rdy$006,
  input  wire [   0:0] xbar_resp_rdy$007,
  output wire [   0:0] xbar_resp_val$000,
  output wire [   0:0] xbar_resp_val$001,
  output wire [   0:0] xbar_resp_val$002,
  output wire [   0:0] xbar_resp_val$003,
  output wire [   0:0] xbar_resp_val$004,
  output wire [   0:0] xbar_resp_val$005,
  output wire [   0:0] xbar_resp_val$006,
  output wire [   0:0] xbar_resp_val$007
);

  // wire declarations
  wire   [   0:0] xbar_req_rdy$000;
  wire   [   0:0] xbar_req_rdy$001;
  wire   [   0:0] xbar_req_rdy$002;
  wire   [   0:0] xbar_req_rdy$003;
  wire   [   0:0] xbar_req_rdy$004;
  wire   [   0:0] xbar_req_rdy$005;
  wire   [   0:0] xbar_req_rdy$006;
  wire   [   0:0] xbar_req_rdy$007;
  wire   [   2:0] where_to_out$000;
  wire   [   2:0] where_to_out$001;
  wire   [   2:0] where_to_out$002;
  wire   [   2:0] where_to_out$003;
  wire   [   2:0] where_to_out$004;
  wire   [   2:0] where_to_out$005;
  wire   [   2:0] where_to_out$006;
  wire   [   2:0] where_to_out$007;
  wire   [   2:0] where_from_out$000;
  wire   [   2:0] where_from_out$001;
  wire   [   2:0] where_from_out$002;
  wire   [   2:0] where_from_out$003;
  wire   [   2:0] where_from_out$004;
  wire   [   2:0] where_from_out$005;
  wire   [   2:0] where_from_out$006;
  wire   [   2:0] where_from_out$007;
  wire   [   0:0] decoder_where_from_out$000;
  wire   [   0:0] decoder_where_from_out$001;
  wire   [   0:0] decoder_where_from_out$002;
  wire   [   0:0] decoder_where_from_out$003;
  wire   [   0:0] decoder_where_from_out$004;
  wire   [   0:0] decoder_where_from_out$005;
  wire   [   0:0] decoder_where_from_out$006;
  wire   [   0:0] decoder_where_from_out$007;
  wire   [   0:0] decoder_where_from_out$008;
  wire   [   0:0] decoder_where_from_out$009;
  wire   [   0:0] decoder_where_from_out$010;
  wire   [   0:0] decoder_where_from_out$011;
  wire   [   0:0] decoder_where_from_out$012;
  wire   [   0:0] decoder_where_from_out$013;
  wire   [   0:0] decoder_where_from_out$014;
  wire   [   0:0] decoder_where_from_out$015;
  wire   [   0:0] decoder_where_from_out$016;
  wire   [   0:0] decoder_where_from_out$017;
  wire   [   0:0] decoder_where_from_out$018;
  wire   [   0:0] decoder_where_from_out$019;
  wire   [   0:0] decoder_where_from_out$020;
  wire   [   0:0] decoder_where_from_out$021;
  wire   [   0:0] decoder_where_from_out$022;
  wire   [   0:0] decoder_where_from_out$023;
  wire   [   0:0] decoder_where_from_out$024;
  wire   [   0:0] decoder_where_from_out$025;
  wire   [   0:0] decoder_where_from_out$026;
  wire   [   0:0] decoder_where_from_out$027;
  wire   [   0:0] decoder_where_from_out$028;
  wire   [   0:0] decoder_where_from_out$029;
  wire   [   0:0] decoder_where_from_out$030;
  wire   [   0:0] decoder_where_from_out$031;
  wire   [   0:0] decoder_where_from_out$032;
  wire   [   0:0] decoder_where_from_out$033;
  wire   [   0:0] decoder_where_from_out$034;
  wire   [   0:0] decoder_where_from_out$035;
  wire   [   0:0] decoder_where_from_out$036;
  wire   [   0:0] decoder_where_from_out$037;
  wire   [   0:0] decoder_where_from_out$038;
  wire   [   0:0] decoder_where_from_out$039;
  wire   [   0:0] decoder_where_from_out$040;
  wire   [   0:0] decoder_where_from_out$041;
  wire   [   0:0] decoder_where_from_out$042;
  wire   [   0:0] decoder_where_from_out$043;
  wire   [   0:0] decoder_where_from_out$044;
  wire   [   0:0] decoder_where_from_out$045;
  wire   [   0:0] decoder_where_from_out$046;
  wire   [   0:0] decoder_where_from_out$047;
  wire   [   0:0] decoder_where_from_out$048;
  wire   [   0:0] decoder_where_from_out$049;
  wire   [   0:0] decoder_where_from_out$050;
  wire   [   0:0] decoder_where_from_out$051;
  wire   [   0:0] decoder_where_from_out$052;
  wire   [   0:0] decoder_where_from_out$053;
  wire   [   0:0] decoder_where_from_out$054;
  wire   [   0:0] decoder_where_from_out$055;
  wire   [   0:0] decoder_where_from_out$056;
  wire   [   0:0] decoder_where_from_out$057;
  wire   [   0:0] decoder_where_from_out$058;
  wire   [   0:0] decoder_where_from_out$059;
  wire   [   0:0] decoder_where_from_out$060;
  wire   [   0:0] decoder_where_from_out$061;
  wire   [   0:0] decoder_where_from_out$062;
  wire   [   0:0] decoder_where_from_out$063;
  wire   [   0:0] decoder_a_out_out$000;
  wire   [   0:0] decoder_a_out_out$001;
  wire   [   0:0] decoder_a_out_out$002;
  wire   [   0:0] decoder_a_out_out$003;
  wire   [   0:0] decoder_a_out_out$004;
  wire   [   0:0] decoder_a_out_out$005;
  wire   [   0:0] decoder_a_out_out$006;
  wire   [   0:0] decoder_a_out_out$007;
  wire   [   0:0] decoder_a_out_out$008;
  wire   [   0:0] decoder_a_out_out$009;
  wire   [   0:0] decoder_a_out_out$010;
  wire   [   0:0] decoder_a_out_out$011;
  wire   [   0:0] decoder_a_out_out$012;
  wire   [   0:0] decoder_a_out_out$013;
  wire   [   0:0] decoder_a_out_out$014;
  wire   [   0:0] decoder_a_out_out$015;
  wire   [   0:0] decoder_a_out_out$016;
  wire   [   0:0] decoder_a_out_out$017;
  wire   [   0:0] decoder_a_out_out$018;
  wire   [   0:0] decoder_a_out_out$019;
  wire   [   0:0] decoder_a_out_out$020;
  wire   [   0:0] decoder_a_out_out$021;
  wire   [   0:0] decoder_a_out_out$022;
  wire   [   0:0] decoder_a_out_out$023;
  wire   [   0:0] decoder_a_out_out$024;
  wire   [   0:0] decoder_a_out_out$025;
  wire   [   0:0] decoder_a_out_out$026;
  wire   [   0:0] decoder_a_out_out$027;
  wire   [   0:0] decoder_a_out_out$028;
  wire   [   0:0] decoder_a_out_out$029;
  wire   [   0:0] decoder_a_out_out$030;
  wire   [   0:0] decoder_a_out_out$031;
  wire   [   0:0] decoder_a_out_out$032;
  wire   [   0:0] decoder_a_out_out$033;
  wire   [   0:0] decoder_a_out_out$034;
  wire   [   0:0] decoder_a_out_out$035;
  wire   [   0:0] decoder_a_out_out$036;
  wire   [   0:0] decoder_a_out_out$037;
  wire   [   0:0] decoder_a_out_out$038;
  wire   [   0:0] decoder_a_out_out$039;
  wire   [   0:0] decoder_a_out_out$040;
  wire   [   0:0] decoder_a_out_out$041;
  wire   [   0:0] decoder_a_out_out$042;
  wire   [   0:0] decoder_a_out_out$043;
  wire   [   0:0] decoder_a_out_out$044;
  wire   [   0:0] decoder_a_out_out$045;
  wire   [   0:0] decoder_a_out_out$046;
  wire   [   0:0] decoder_a_out_out$047;
  wire   [   0:0] decoder_a_out_out$048;
  wire   [   0:0] decoder_a_out_out$049;
  wire   [   0:0] decoder_a_out_out$050;
  wire   [   0:0] decoder_a_out_out$051;
  wire   [   0:0] decoder_a_out_out$052;
  wire   [   0:0] decoder_a_out_out$053;
  wire   [   0:0] decoder_a_out_out$054;
  wire   [   0:0] decoder_a_out_out$055;
  wire   [   0:0] decoder_a_out_out$056;
  wire   [   0:0] decoder_a_out_out$057;
  wire   [   0:0] decoder_a_out_out$058;
  wire   [   0:0] decoder_a_out_out$059;
  wire   [   0:0] decoder_a_out_out$060;
  wire   [   0:0] decoder_a_out_out$061;
  wire   [   0:0] decoder_a_out_out$062;
  wire   [   0:0] decoder_a_out_out$063;
  wire   [   0:0] where_to_val_en$000;
  wire   [   0:0] where_to_val_en$001;
  wire   [   0:0] where_to_val_en$002;
  wire   [   0:0] where_to_val_en$003;
  wire   [   0:0] where_to_val_en$004;
  wire   [   0:0] where_to_val_en$005;
  wire   [   0:0] where_to_val_en$006;
  wire   [   0:0] where_to_val_en$007;
  wire   [   0:0] where_to_val_in$000;
  wire   [   0:0] where_to_val_in$001;
  wire   [   0:0] where_to_val_in$002;
  wire   [   0:0] where_to_val_in$003;
  wire   [   0:0] where_to_val_in$004;
  wire   [   0:0] where_to_val_in$005;
  wire   [   0:0] where_to_val_in$006;
  wire   [   0:0] where_to_val_in$007;
  wire   [   0:0] where_to_val_out$000;
  wire   [   0:0] where_to_val_out$001;
  wire   [   0:0] where_to_val_out$002;
  wire   [   0:0] where_to_val_out$003;
  wire   [   0:0] where_to_val_out$004;
  wire   [   0:0] where_to_val_out$005;
  wire   [   0:0] where_to_val_out$006;
  wire   [   0:0] where_to_val_out$007;
  wire   [   0:0] where_to_val_set$000;
  wire   [   0:0] where_to_val_set$001;
  wire   [   0:0] where_to_val_set$002;
  wire   [   0:0] where_to_val_set$003;
  wire   [   0:0] where_to_val_set$004;
  wire   [   0:0] where_to_val_set$005;
  wire   [   0:0] where_to_val_set$006;
  wire   [   0:0] where_to_val_set$007;
  wire   [   0:0] where_to_val_reset$000;
  wire   [   0:0] where_to_val_reset$001;
  wire   [   0:0] where_to_val_reset$002;
  wire   [   0:0] where_to_val_reset$003;
  wire   [   0:0] where_to_val_reset$004;
  wire   [   0:0] where_to_val_reset$005;
  wire   [   0:0] where_to_val_reset$006;
  wire   [   0:0] where_to_val_reset$007;
  wire   [   7:0] where_to_val_set_tmp$000;
  wire   [   7:0] where_to_val_set_tmp$001;
  wire   [   7:0] where_to_val_set_tmp$002;
  wire   [   7:0] where_to_val_set_tmp$003;
  wire   [   7:0] where_to_val_set_tmp$004;
  wire   [   7:0] where_to_val_set_tmp$005;
  wire   [   7:0] where_to_val_set_tmp$006;
  wire   [   7:0] where_to_val_set_tmp$007;
  wire   [   7:0] where_to_val_reset_tmp$000;
  wire   [   7:0] where_to_val_reset_tmp$001;
  wire   [   7:0] where_to_val_reset_tmp$002;
  wire   [   7:0] where_to_val_reset_tmp$003;
  wire   [   7:0] where_to_val_reset_tmp$004;
  wire   [   7:0] where_to_val_reset_tmp$005;
  wire   [   7:0] where_to_val_reset_tmp$006;
  wire   [   7:0] where_to_val_reset_tmp$007;
  wire   [   7:0] xbar_req_rdy_temp$000;
  wire   [   7:0] xbar_req_rdy_temp$001;
  wire   [   7:0] xbar_req_rdy_temp$002;
  wire   [   7:0] xbar_req_rdy_temp$003;
  wire   [   7:0] xbar_req_rdy_temp$004;
  wire   [   7:0] xbar_req_rdy_temp$005;
  wire   [   7:0] xbar_req_rdy_temp$006;
  wire   [   7:0] xbar_req_rdy_temp$007;
  wire   [   7:0] xbar_resp_val_temp$000;
  wire   [   7:0] xbar_resp_val_temp$001;
  wire   [   7:0] xbar_resp_val_temp$002;
  wire   [   7:0] xbar_resp_val_temp$003;
  wire   [   7:0] xbar_resp_val_temp$004;
  wire   [   7:0] xbar_resp_val_temp$005;
  wire   [   7:0] xbar_resp_val_temp$006;
  wire   [   7:0] xbar_resp_val_temp$007;


  // localparam declarations
  localparam nports = 8;
  localparam size = 3;

  // loop variable declarations
  integer i;
  integer j;

  // where_to$000 temporaries
  wire   [   0:0] where_to$000$clk;
  wire   [   0:0] where_to$000$reset;
  wire   [   0:0] where_to$000$en;
  wire   [   2:0] where_to$000$in_;
  wire   [   2:0] where_to$000$out;

  RegEnRst_0x3af9648ac192b2a0 where_to$000
  (
    .clk   ( where_to$000$clk ),
    .reset ( where_to$000$reset ),
    .en    ( where_to$000$en ),
    .in_   ( where_to$000$in_ ),
    .out   ( where_to$000$out )
  );

  // where_to$001 temporaries
  wire   [   0:0] where_to$001$clk;
  wire   [   0:0] where_to$001$reset;
  wire   [   0:0] where_to$001$en;
  wire   [   2:0] where_to$001$in_;
  wire   [   2:0] where_to$001$out;

  RegEnRst_0x3af9648ac192b2a0 where_to$001
  (
    .clk   ( where_to$001$clk ),
    .reset ( where_to$001$reset ),
    .en    ( where_to$001$en ),
    .in_   ( where_to$001$in_ ),
    .out   ( where_to$001$out )
  );

  // where_to$002 temporaries
  wire   [   0:0] where_to$002$clk;
  wire   [   0:0] where_to$002$reset;
  wire   [   0:0] where_to$002$en;
  wire   [   2:0] where_to$002$in_;
  wire   [   2:0] where_to$002$out;

  RegEnRst_0x3af9648ac192b2a0 where_to$002
  (
    .clk   ( where_to$002$clk ),
    .reset ( where_to$002$reset ),
    .en    ( where_to$002$en ),
    .in_   ( where_to$002$in_ ),
    .out   ( where_to$002$out )
  );

  // where_to$003 temporaries
  wire   [   0:0] where_to$003$clk;
  wire   [   0:0] where_to$003$reset;
  wire   [   0:0] where_to$003$en;
  wire   [   2:0] where_to$003$in_;
  wire   [   2:0] where_to$003$out;

  RegEnRst_0x3af9648ac192b2a0 where_to$003
  (
    .clk   ( where_to$003$clk ),
    .reset ( where_to$003$reset ),
    .en    ( where_to$003$en ),
    .in_   ( where_to$003$in_ ),
    .out   ( where_to$003$out )
  );

  // where_to$004 temporaries
  wire   [   0:0] where_to$004$clk;
  wire   [   0:0] where_to$004$reset;
  wire   [   0:0] where_to$004$en;
  wire   [   2:0] where_to$004$in_;
  wire   [   2:0] where_to$004$out;

  RegEnRst_0x3af9648ac192b2a0 where_to$004
  (
    .clk   ( where_to$004$clk ),
    .reset ( where_to$004$reset ),
    .en    ( where_to$004$en ),
    .in_   ( where_to$004$in_ ),
    .out   ( where_to$004$out )
  );

  // where_to$005 temporaries
  wire   [   0:0] where_to$005$clk;
  wire   [   0:0] where_to$005$reset;
  wire   [   0:0] where_to$005$en;
  wire   [   2:0] where_to$005$in_;
  wire   [   2:0] where_to$005$out;

  RegEnRst_0x3af9648ac192b2a0 where_to$005
  (
    .clk   ( where_to$005$clk ),
    .reset ( where_to$005$reset ),
    .en    ( where_to$005$en ),
    .in_   ( where_to$005$in_ ),
    .out   ( where_to$005$out )
  );

  // where_to$006 temporaries
  wire   [   0:0] where_to$006$clk;
  wire   [   0:0] where_to$006$reset;
  wire   [   0:0] where_to$006$en;
  wire   [   2:0] where_to$006$in_;
  wire   [   2:0] where_to$006$out;

  RegEnRst_0x3af9648ac192b2a0 where_to$006
  (
    .clk   ( where_to$006$clk ),
    .reset ( where_to$006$reset ),
    .en    ( where_to$006$en ),
    .in_   ( where_to$006$in_ ),
    .out   ( where_to$006$out )
  );

  // where_to$007 temporaries
  wire   [   0:0] where_to$007$clk;
  wire   [   0:0] where_to$007$reset;
  wire   [   0:0] where_to$007$en;
  wire   [   2:0] where_to$007$in_;
  wire   [   2:0] where_to$007$out;

  RegEnRst_0x3af9648ac192b2a0 where_to$007
  (
    .clk   ( where_to$007$clk ),
    .reset ( where_to$007$reset ),
    .en    ( where_to$007$en ),
    .in_   ( where_to$007$in_ ),
    .out   ( where_to$007$out )
  );

  // where_from$000 temporaries
  wire   [   0:0] where_from$000$clk;
  wire   [   0:0] where_from$000$reset;
  wire   [   0:0] where_from$000$en;
  wire   [   2:0] where_from$000$in_;
  wire   [   2:0] where_from$000$out;

  RegEnRst_0x3af9648ac192b2a0 where_from$000
  (
    .clk   ( where_from$000$clk ),
    .reset ( where_from$000$reset ),
    .en    ( where_from$000$en ),
    .in_   ( where_from$000$in_ ),
    .out   ( where_from$000$out )
  );

  // where_from$001 temporaries
  wire   [   0:0] where_from$001$clk;
  wire   [   0:0] where_from$001$reset;
  wire   [   0:0] where_from$001$en;
  wire   [   2:0] where_from$001$in_;
  wire   [   2:0] where_from$001$out;

  RegEnRst_0x3af9648ac192b2a0 where_from$001
  (
    .clk   ( where_from$001$clk ),
    .reset ( where_from$001$reset ),
    .en    ( where_from$001$en ),
    .in_   ( where_from$001$in_ ),
    .out   ( where_from$001$out )
  );

  // where_from$002 temporaries
  wire   [   0:0] where_from$002$clk;
  wire   [   0:0] where_from$002$reset;
  wire   [   0:0] where_from$002$en;
  wire   [   2:0] where_from$002$in_;
  wire   [   2:0] where_from$002$out;

  RegEnRst_0x3af9648ac192b2a0 where_from$002
  (
    .clk   ( where_from$002$clk ),
    .reset ( where_from$002$reset ),
    .en    ( where_from$002$en ),
    .in_   ( where_from$002$in_ ),
    .out   ( where_from$002$out )
  );

  // where_from$003 temporaries
  wire   [   0:0] where_from$003$clk;
  wire   [   0:0] where_from$003$reset;
  wire   [   0:0] where_from$003$en;
  wire   [   2:0] where_from$003$in_;
  wire   [   2:0] where_from$003$out;

  RegEnRst_0x3af9648ac192b2a0 where_from$003
  (
    .clk   ( where_from$003$clk ),
    .reset ( where_from$003$reset ),
    .en    ( where_from$003$en ),
    .in_   ( where_from$003$in_ ),
    .out   ( where_from$003$out )
  );

  // where_from$004 temporaries
  wire   [   0:0] where_from$004$clk;
  wire   [   0:0] where_from$004$reset;
  wire   [   0:0] where_from$004$en;
  wire   [   2:0] where_from$004$in_;
  wire   [   2:0] where_from$004$out;

  RegEnRst_0x3af9648ac192b2a0 where_from$004
  (
    .clk   ( where_from$004$clk ),
    .reset ( where_from$004$reset ),
    .en    ( where_from$004$en ),
    .in_   ( where_from$004$in_ ),
    .out   ( where_from$004$out )
  );

  // where_from$005 temporaries
  wire   [   0:0] where_from$005$clk;
  wire   [   0:0] where_from$005$reset;
  wire   [   0:0] where_from$005$en;
  wire   [   2:0] where_from$005$in_;
  wire   [   2:0] where_from$005$out;

  RegEnRst_0x3af9648ac192b2a0 where_from$005
  (
    .clk   ( where_from$005$clk ),
    .reset ( where_from$005$reset ),
    .en    ( where_from$005$en ),
    .in_   ( where_from$005$in_ ),
    .out   ( where_from$005$out )
  );

  // where_from$006 temporaries
  wire   [   0:0] where_from$006$clk;
  wire   [   0:0] where_from$006$reset;
  wire   [   0:0] where_from$006$en;
  wire   [   2:0] where_from$006$in_;
  wire   [   2:0] where_from$006$out;

  RegEnRst_0x3af9648ac192b2a0 where_from$006
  (
    .clk   ( where_from$006$clk ),
    .reset ( where_from$006$reset ),
    .en    ( where_from$006$en ),
    .in_   ( where_from$006$in_ ),
    .out   ( where_from$006$out )
  );

  // where_from$007 temporaries
  wire   [   0:0] where_from$007$clk;
  wire   [   0:0] where_from$007$reset;
  wire   [   0:0] where_from$007$en;
  wire   [   2:0] where_from$007$in_;
  wire   [   2:0] where_from$007$out;

  RegEnRst_0x3af9648ac192b2a0 where_from$007
  (
    .clk   ( where_from$007$clk ),
    .reset ( where_from$007$reset ),
    .en    ( where_from$007$en ),
    .in_   ( where_from$007$in_ ),
    .out   ( where_from$007$out )
  );

  // decoder_where_from$000 temporaries
  wire   [   0:0] decoder_where_from$000$clk;
  wire   [   0:0] decoder_where_from$000$reset;
  wire   [   2:0] decoder_where_from$000$in_;
  wire   [   7:0] decoder_where_from$000$out;

  Decoder_0x71aec56d73104bf5 decoder_where_from$000
  (
    .clk   ( decoder_where_from$000$clk ),
    .reset ( decoder_where_from$000$reset ),
    .in_   ( decoder_where_from$000$in_ ),
    .out   ( decoder_where_from$000$out )
  );

  // decoder_where_from$001 temporaries
  wire   [   0:0] decoder_where_from$001$clk;
  wire   [   0:0] decoder_where_from$001$reset;
  wire   [   2:0] decoder_where_from$001$in_;
  wire   [   7:0] decoder_where_from$001$out;

  Decoder_0x71aec56d73104bf5 decoder_where_from$001
  (
    .clk   ( decoder_where_from$001$clk ),
    .reset ( decoder_where_from$001$reset ),
    .in_   ( decoder_where_from$001$in_ ),
    .out   ( decoder_where_from$001$out )
  );

  // decoder_where_from$002 temporaries
  wire   [   0:0] decoder_where_from$002$clk;
  wire   [   0:0] decoder_where_from$002$reset;
  wire   [   2:0] decoder_where_from$002$in_;
  wire   [   7:0] decoder_where_from$002$out;

  Decoder_0x71aec56d73104bf5 decoder_where_from$002
  (
    .clk   ( decoder_where_from$002$clk ),
    .reset ( decoder_where_from$002$reset ),
    .in_   ( decoder_where_from$002$in_ ),
    .out   ( decoder_where_from$002$out )
  );

  // decoder_where_from$003 temporaries
  wire   [   0:0] decoder_where_from$003$clk;
  wire   [   0:0] decoder_where_from$003$reset;
  wire   [   2:0] decoder_where_from$003$in_;
  wire   [   7:0] decoder_where_from$003$out;

  Decoder_0x71aec56d73104bf5 decoder_where_from$003
  (
    .clk   ( decoder_where_from$003$clk ),
    .reset ( decoder_where_from$003$reset ),
    .in_   ( decoder_where_from$003$in_ ),
    .out   ( decoder_where_from$003$out )
  );

  // decoder_where_from$004 temporaries
  wire   [   0:0] decoder_where_from$004$clk;
  wire   [   0:0] decoder_where_from$004$reset;
  wire   [   2:0] decoder_where_from$004$in_;
  wire   [   7:0] decoder_where_from$004$out;

  Decoder_0x71aec56d73104bf5 decoder_where_from$004
  (
    .clk   ( decoder_where_from$004$clk ),
    .reset ( decoder_where_from$004$reset ),
    .in_   ( decoder_where_from$004$in_ ),
    .out   ( decoder_where_from$004$out )
  );

  // decoder_where_from$005 temporaries
  wire   [   0:0] decoder_where_from$005$clk;
  wire   [   0:0] decoder_where_from$005$reset;
  wire   [   2:0] decoder_where_from$005$in_;
  wire   [   7:0] decoder_where_from$005$out;

  Decoder_0x71aec56d73104bf5 decoder_where_from$005
  (
    .clk   ( decoder_where_from$005$clk ),
    .reset ( decoder_where_from$005$reset ),
    .in_   ( decoder_where_from$005$in_ ),
    .out   ( decoder_where_from$005$out )
  );

  // decoder_where_from$006 temporaries
  wire   [   0:0] decoder_where_from$006$clk;
  wire   [   0:0] decoder_where_from$006$reset;
  wire   [   2:0] decoder_where_from$006$in_;
  wire   [   7:0] decoder_where_from$006$out;

  Decoder_0x71aec56d73104bf5 decoder_where_from$006
  (
    .clk   ( decoder_where_from$006$clk ),
    .reset ( decoder_where_from$006$reset ),
    .in_   ( decoder_where_from$006$in_ ),
    .out   ( decoder_where_from$006$out )
  );

  // decoder_where_from$007 temporaries
  wire   [   0:0] decoder_where_from$007$clk;
  wire   [   0:0] decoder_where_from$007$reset;
  wire   [   2:0] decoder_where_from$007$in_;
  wire   [   7:0] decoder_where_from$007$out;

  Decoder_0x71aec56d73104bf5 decoder_where_from$007
  (
    .clk   ( decoder_where_from$007$clk ),
    .reset ( decoder_where_from$007$reset ),
    .in_   ( decoder_where_from$007$in_ ),
    .out   ( decoder_where_from$007$out )
  );

  // decoder_a_out$000 temporaries
  wire   [   0:0] decoder_a_out$000$clk;
  wire   [   0:0] decoder_a_out$000$reset;
  wire   [   2:0] decoder_a_out$000$in_;
  wire   [   7:0] decoder_a_out$000$out;

  Decoder_0x71aec56d73104bf5 decoder_a_out$000
  (
    .clk   ( decoder_a_out$000$clk ),
    .reset ( decoder_a_out$000$reset ),
    .in_   ( decoder_a_out$000$in_ ),
    .out   ( decoder_a_out$000$out )
  );

  // decoder_a_out$001 temporaries
  wire   [   0:0] decoder_a_out$001$clk;
  wire   [   0:0] decoder_a_out$001$reset;
  wire   [   2:0] decoder_a_out$001$in_;
  wire   [   7:0] decoder_a_out$001$out;

  Decoder_0x71aec56d73104bf5 decoder_a_out$001
  (
    .clk   ( decoder_a_out$001$clk ),
    .reset ( decoder_a_out$001$reset ),
    .in_   ( decoder_a_out$001$in_ ),
    .out   ( decoder_a_out$001$out )
  );

  // decoder_a_out$002 temporaries
  wire   [   0:0] decoder_a_out$002$clk;
  wire   [   0:0] decoder_a_out$002$reset;
  wire   [   2:0] decoder_a_out$002$in_;
  wire   [   7:0] decoder_a_out$002$out;

  Decoder_0x71aec56d73104bf5 decoder_a_out$002
  (
    .clk   ( decoder_a_out$002$clk ),
    .reset ( decoder_a_out$002$reset ),
    .in_   ( decoder_a_out$002$in_ ),
    .out   ( decoder_a_out$002$out )
  );

  // decoder_a_out$003 temporaries
  wire   [   0:0] decoder_a_out$003$clk;
  wire   [   0:0] decoder_a_out$003$reset;
  wire   [   2:0] decoder_a_out$003$in_;
  wire   [   7:0] decoder_a_out$003$out;

  Decoder_0x71aec56d73104bf5 decoder_a_out$003
  (
    .clk   ( decoder_a_out$003$clk ),
    .reset ( decoder_a_out$003$reset ),
    .in_   ( decoder_a_out$003$in_ ),
    .out   ( decoder_a_out$003$out )
  );

  // decoder_a_out$004 temporaries
  wire   [   0:0] decoder_a_out$004$clk;
  wire   [   0:0] decoder_a_out$004$reset;
  wire   [   2:0] decoder_a_out$004$in_;
  wire   [   7:0] decoder_a_out$004$out;

  Decoder_0x71aec56d73104bf5 decoder_a_out$004
  (
    .clk   ( decoder_a_out$004$clk ),
    .reset ( decoder_a_out$004$reset ),
    .in_   ( decoder_a_out$004$in_ ),
    .out   ( decoder_a_out$004$out )
  );

  // decoder_a_out$005 temporaries
  wire   [   0:0] decoder_a_out$005$clk;
  wire   [   0:0] decoder_a_out$005$reset;
  wire   [   2:0] decoder_a_out$005$in_;
  wire   [   7:0] decoder_a_out$005$out;

  Decoder_0x71aec56d73104bf5 decoder_a_out$005
  (
    .clk   ( decoder_a_out$005$clk ),
    .reset ( decoder_a_out$005$reset ),
    .in_   ( decoder_a_out$005$in_ ),
    .out   ( decoder_a_out$005$out )
  );

  // decoder_a_out$006 temporaries
  wire   [   0:0] decoder_a_out$006$clk;
  wire   [   0:0] decoder_a_out$006$reset;
  wire   [   2:0] decoder_a_out$006$in_;
  wire   [   7:0] decoder_a_out$006$out;

  Decoder_0x71aec56d73104bf5 decoder_a_out$006
  (
    .clk   ( decoder_a_out$006$clk ),
    .reset ( decoder_a_out$006$reset ),
    .in_   ( decoder_a_out$006$in_ ),
    .out   ( decoder_a_out$006$out )
  );

  // decoder_a_out$007 temporaries
  wire   [   0:0] decoder_a_out$007$clk;
  wire   [   0:0] decoder_a_out$007$reset;
  wire   [   2:0] decoder_a_out$007$in_;
  wire   [   7:0] decoder_a_out$007$out;

  Decoder_0x71aec56d73104bf5 decoder_a_out$007
  (
    .clk   ( decoder_a_out$007$clk ),
    .reset ( decoder_a_out$007$reset ),
    .in_   ( decoder_a_out$007$in_ ),
    .out   ( decoder_a_out$007$out )
  );

  // where_to_val$000 temporaries
  wire   [   0:0] where_to_val$000$clk;
  wire   [   0:0] where_to_val$000$reset;
  wire   [   0:0] where_to_val$000$en;
  wire   [   0:0] where_to_val$000$in_;
  wire   [   0:0] where_to_val$000$out;

  RegEnRst_0x3f928fe66716045e where_to_val$000
  (
    .clk   ( where_to_val$000$clk ),
    .reset ( where_to_val$000$reset ),
    .en    ( where_to_val$000$en ),
    .in_   ( where_to_val$000$in_ ),
    .out   ( where_to_val$000$out )
  );

  // where_to_val$001 temporaries
  wire   [   0:0] where_to_val$001$clk;
  wire   [   0:0] where_to_val$001$reset;
  wire   [   0:0] where_to_val$001$en;
  wire   [   0:0] where_to_val$001$in_;
  wire   [   0:0] where_to_val$001$out;

  RegEnRst_0x3f928fe66716045e where_to_val$001
  (
    .clk   ( where_to_val$001$clk ),
    .reset ( where_to_val$001$reset ),
    .en    ( where_to_val$001$en ),
    .in_   ( where_to_val$001$in_ ),
    .out   ( where_to_val$001$out )
  );

  // where_to_val$002 temporaries
  wire   [   0:0] where_to_val$002$clk;
  wire   [   0:0] where_to_val$002$reset;
  wire   [   0:0] where_to_val$002$en;
  wire   [   0:0] where_to_val$002$in_;
  wire   [   0:0] where_to_val$002$out;

  RegEnRst_0x3f928fe66716045e where_to_val$002
  (
    .clk   ( where_to_val$002$clk ),
    .reset ( where_to_val$002$reset ),
    .en    ( where_to_val$002$en ),
    .in_   ( where_to_val$002$in_ ),
    .out   ( where_to_val$002$out )
  );

  // where_to_val$003 temporaries
  wire   [   0:0] where_to_val$003$clk;
  wire   [   0:0] where_to_val$003$reset;
  wire   [   0:0] where_to_val$003$en;
  wire   [   0:0] where_to_val$003$in_;
  wire   [   0:0] where_to_val$003$out;

  RegEnRst_0x3f928fe66716045e where_to_val$003
  (
    .clk   ( where_to_val$003$clk ),
    .reset ( where_to_val$003$reset ),
    .en    ( where_to_val$003$en ),
    .in_   ( where_to_val$003$in_ ),
    .out   ( where_to_val$003$out )
  );

  // where_to_val$004 temporaries
  wire   [   0:0] where_to_val$004$clk;
  wire   [   0:0] where_to_val$004$reset;
  wire   [   0:0] where_to_val$004$en;
  wire   [   0:0] where_to_val$004$in_;
  wire   [   0:0] where_to_val$004$out;

  RegEnRst_0x3f928fe66716045e where_to_val$004
  (
    .clk   ( where_to_val$004$clk ),
    .reset ( where_to_val$004$reset ),
    .en    ( where_to_val$004$en ),
    .in_   ( where_to_val$004$in_ ),
    .out   ( where_to_val$004$out )
  );

  // where_to_val$005 temporaries
  wire   [   0:0] where_to_val$005$clk;
  wire   [   0:0] where_to_val$005$reset;
  wire   [   0:0] where_to_val$005$en;
  wire   [   0:0] where_to_val$005$in_;
  wire   [   0:0] where_to_val$005$out;

  RegEnRst_0x3f928fe66716045e where_to_val$005
  (
    .clk   ( where_to_val$005$clk ),
    .reset ( where_to_val$005$reset ),
    .en    ( where_to_val$005$en ),
    .in_   ( where_to_val$005$in_ ),
    .out   ( where_to_val$005$out )
  );

  // where_to_val$006 temporaries
  wire   [   0:0] where_to_val$006$clk;
  wire   [   0:0] where_to_val$006$reset;
  wire   [   0:0] where_to_val$006$en;
  wire   [   0:0] where_to_val$006$in_;
  wire   [   0:0] where_to_val$006$out;

  RegEnRst_0x3f928fe66716045e where_to_val$006
  (
    .clk   ( where_to_val$006$clk ),
    .reset ( where_to_val$006$reset ),
    .en    ( where_to_val$006$en ),
    .in_   ( where_to_val$006$in_ ),
    .out   ( where_to_val$006$out )
  );

  // where_to_val$007 temporaries
  wire   [   0:0] where_to_val$007$clk;
  wire   [   0:0] where_to_val$007$reset;
  wire   [   0:0] where_to_val$007$en;
  wire   [   0:0] where_to_val$007$in_;
  wire   [   0:0] where_to_val$007$out;

  RegEnRst_0x3f928fe66716045e where_to_val$007
  (
    .clk   ( where_to_val$007$clk ),
    .reset ( where_to_val$007$reset ),
    .en    ( where_to_val$007$en ),
    .in_   ( where_to_val$007$in_ ),
    .out   ( where_to_val$007$out )
  );

  // signal connections
  assign decoder_a_out$000$clk        = clk;
  assign decoder_a_out$000$in_        = a_out$000;
  assign decoder_a_out$000$reset      = reset;
  assign decoder_a_out$001$clk        = clk;
  assign decoder_a_out$001$in_        = a_out$001;
  assign decoder_a_out$001$reset      = reset;
  assign decoder_a_out$002$clk        = clk;
  assign decoder_a_out$002$in_        = a_out$002;
  assign decoder_a_out$002$reset      = reset;
  assign decoder_a_out$003$clk        = clk;
  assign decoder_a_out$003$in_        = a_out$003;
  assign decoder_a_out$003$reset      = reset;
  assign decoder_a_out$004$clk        = clk;
  assign decoder_a_out$004$in_        = a_out$004;
  assign decoder_a_out$004$reset      = reset;
  assign decoder_a_out$005$clk        = clk;
  assign decoder_a_out$005$in_        = a_out$005;
  assign decoder_a_out$005$reset      = reset;
  assign decoder_a_out$006$clk        = clk;
  assign decoder_a_out$006$in_        = a_out$006;
  assign decoder_a_out$006$reset      = reset;
  assign decoder_a_out$007$clk        = clk;
  assign decoder_a_out$007$in_        = a_out$007;
  assign decoder_a_out$007$reset      = reset;
  assign decoder_a_out_out$000        = decoder_a_out$000$out[0];
  assign decoder_a_out_out$001        = decoder_a_out$000$out[1];
  assign decoder_a_out_out$002        = decoder_a_out$000$out[2];
  assign decoder_a_out_out$003        = decoder_a_out$000$out[3];
  assign decoder_a_out_out$004        = decoder_a_out$000$out[4];
  assign decoder_a_out_out$005        = decoder_a_out$000$out[5];
  assign decoder_a_out_out$006        = decoder_a_out$000$out[6];
  assign decoder_a_out_out$007        = decoder_a_out$000$out[7];
  assign decoder_a_out_out$008        = decoder_a_out$001$out[0];
  assign decoder_a_out_out$009        = decoder_a_out$001$out[1];
  assign decoder_a_out_out$010        = decoder_a_out$001$out[2];
  assign decoder_a_out_out$011        = decoder_a_out$001$out[3];
  assign decoder_a_out_out$012        = decoder_a_out$001$out[4];
  assign decoder_a_out_out$013        = decoder_a_out$001$out[5];
  assign decoder_a_out_out$014        = decoder_a_out$001$out[6];
  assign decoder_a_out_out$015        = decoder_a_out$001$out[7];
  assign decoder_a_out_out$016        = decoder_a_out$002$out[0];
  assign decoder_a_out_out$017        = decoder_a_out$002$out[1];
  assign decoder_a_out_out$018        = decoder_a_out$002$out[2];
  assign decoder_a_out_out$019        = decoder_a_out$002$out[3];
  assign decoder_a_out_out$020        = decoder_a_out$002$out[4];
  assign decoder_a_out_out$021        = decoder_a_out$002$out[5];
  assign decoder_a_out_out$022        = decoder_a_out$002$out[6];
  assign decoder_a_out_out$023        = decoder_a_out$002$out[7];
  assign decoder_a_out_out$024        = decoder_a_out$003$out[0];
  assign decoder_a_out_out$025        = decoder_a_out$003$out[1];
  assign decoder_a_out_out$026        = decoder_a_out$003$out[2];
  assign decoder_a_out_out$027        = decoder_a_out$003$out[3];
  assign decoder_a_out_out$028        = decoder_a_out$003$out[4];
  assign decoder_a_out_out$029        = decoder_a_out$003$out[5];
  assign decoder_a_out_out$030        = decoder_a_out$003$out[6];
  assign decoder_a_out_out$031        = decoder_a_out$003$out[7];
  assign decoder_a_out_out$032        = decoder_a_out$004$out[0];
  assign decoder_a_out_out$033        = decoder_a_out$004$out[1];
  assign decoder_a_out_out$034        = decoder_a_out$004$out[2];
  assign decoder_a_out_out$035        = decoder_a_out$004$out[3];
  assign decoder_a_out_out$036        = decoder_a_out$004$out[4];
  assign decoder_a_out_out$037        = decoder_a_out$004$out[5];
  assign decoder_a_out_out$038        = decoder_a_out$004$out[6];
  assign decoder_a_out_out$039        = decoder_a_out$004$out[7];
  assign decoder_a_out_out$040        = decoder_a_out$005$out[0];
  assign decoder_a_out_out$041        = decoder_a_out$005$out[1];
  assign decoder_a_out_out$042        = decoder_a_out$005$out[2];
  assign decoder_a_out_out$043        = decoder_a_out$005$out[3];
  assign decoder_a_out_out$044        = decoder_a_out$005$out[4];
  assign decoder_a_out_out$045        = decoder_a_out$005$out[5];
  assign decoder_a_out_out$046        = decoder_a_out$005$out[6];
  assign decoder_a_out_out$047        = decoder_a_out$005$out[7];
  assign decoder_a_out_out$048        = decoder_a_out$006$out[0];
  assign decoder_a_out_out$049        = decoder_a_out$006$out[1];
  assign decoder_a_out_out$050        = decoder_a_out$006$out[2];
  assign decoder_a_out_out$051        = decoder_a_out$006$out[3];
  assign decoder_a_out_out$052        = decoder_a_out$006$out[4];
  assign decoder_a_out_out$053        = decoder_a_out$006$out[5];
  assign decoder_a_out_out$054        = decoder_a_out$006$out[6];
  assign decoder_a_out_out$055        = decoder_a_out$006$out[7];
  assign decoder_a_out_out$056        = decoder_a_out$007$out[0];
  assign decoder_a_out_out$057        = decoder_a_out$007$out[1];
  assign decoder_a_out_out$058        = decoder_a_out$007$out[2];
  assign decoder_a_out_out$059        = decoder_a_out$007$out[3];
  assign decoder_a_out_out$060        = decoder_a_out$007$out[4];
  assign decoder_a_out_out$061        = decoder_a_out$007$out[5];
  assign decoder_a_out_out$062        = decoder_a_out$007$out[6];
  assign decoder_a_out_out$063        = decoder_a_out$007$out[7];
  assign decoder_where_from$000$clk   = clk;
  assign decoder_where_from$000$in_   = where_from_out$000;
  assign decoder_where_from$000$reset = reset;
  assign decoder_where_from$001$clk   = clk;
  assign decoder_where_from$001$in_   = where_from_out$001;
  assign decoder_where_from$001$reset = reset;
  assign decoder_where_from$002$clk   = clk;
  assign decoder_where_from$002$in_   = where_from_out$002;
  assign decoder_where_from$002$reset = reset;
  assign decoder_where_from$003$clk   = clk;
  assign decoder_where_from$003$in_   = where_from_out$003;
  assign decoder_where_from$003$reset = reset;
  assign decoder_where_from$004$clk   = clk;
  assign decoder_where_from$004$in_   = where_from_out$004;
  assign decoder_where_from$004$reset = reset;
  assign decoder_where_from$005$clk   = clk;
  assign decoder_where_from$005$in_   = where_from_out$005;
  assign decoder_where_from$005$reset = reset;
  assign decoder_where_from$006$clk   = clk;
  assign decoder_where_from$006$in_   = where_from_out$006;
  assign decoder_where_from$006$reset = reset;
  assign decoder_where_from$007$clk   = clk;
  assign decoder_where_from$007$in_   = where_from_out$007;
  assign decoder_where_from$007$reset = reset;
  assign decoder_where_from_out$000   = decoder_where_from$000$out[0];
  assign decoder_where_from_out$001   = decoder_where_from$000$out[1];
  assign decoder_where_from_out$002   = decoder_where_from$000$out[2];
  assign decoder_where_from_out$003   = decoder_where_from$000$out[3];
  assign decoder_where_from_out$004   = decoder_where_from$000$out[4];
  assign decoder_where_from_out$005   = decoder_where_from$000$out[5];
  assign decoder_where_from_out$006   = decoder_where_from$000$out[6];
  assign decoder_where_from_out$007   = decoder_where_from$000$out[7];
  assign decoder_where_from_out$008   = decoder_where_from$001$out[0];
  assign decoder_where_from_out$009   = decoder_where_from$001$out[1];
  assign decoder_where_from_out$010   = decoder_where_from$001$out[2];
  assign decoder_where_from_out$011   = decoder_where_from$001$out[3];
  assign decoder_where_from_out$012   = decoder_where_from$001$out[4];
  assign decoder_where_from_out$013   = decoder_where_from$001$out[5];
  assign decoder_where_from_out$014   = decoder_where_from$001$out[6];
  assign decoder_where_from_out$015   = decoder_where_from$001$out[7];
  assign decoder_where_from_out$016   = decoder_where_from$002$out[0];
  assign decoder_where_from_out$017   = decoder_where_from$002$out[1];
  assign decoder_where_from_out$018   = decoder_where_from$002$out[2];
  assign decoder_where_from_out$019   = decoder_where_from$002$out[3];
  assign decoder_where_from_out$020   = decoder_where_from$002$out[4];
  assign decoder_where_from_out$021   = decoder_where_from$002$out[5];
  assign decoder_where_from_out$022   = decoder_where_from$002$out[6];
  assign decoder_where_from_out$023   = decoder_where_from$002$out[7];
  assign decoder_where_from_out$024   = decoder_where_from$003$out[0];
  assign decoder_where_from_out$025   = decoder_where_from$003$out[1];
  assign decoder_where_from_out$026   = decoder_where_from$003$out[2];
  assign decoder_where_from_out$027   = decoder_where_from$003$out[3];
  assign decoder_where_from_out$028   = decoder_where_from$003$out[4];
  assign decoder_where_from_out$029   = decoder_where_from$003$out[5];
  assign decoder_where_from_out$030   = decoder_where_from$003$out[6];
  assign decoder_where_from_out$031   = decoder_where_from$003$out[7];
  assign decoder_where_from_out$032   = decoder_where_from$004$out[0];
  assign decoder_where_from_out$033   = decoder_where_from$004$out[1];
  assign decoder_where_from_out$034   = decoder_where_from$004$out[2];
  assign decoder_where_from_out$035   = decoder_where_from$004$out[3];
  assign decoder_where_from_out$036   = decoder_where_from$004$out[4];
  assign decoder_where_from_out$037   = decoder_where_from$004$out[5];
  assign decoder_where_from_out$038   = decoder_where_from$004$out[6];
  assign decoder_where_from_out$039   = decoder_where_from$004$out[7];
  assign decoder_where_from_out$040   = decoder_where_from$005$out[0];
  assign decoder_where_from_out$041   = decoder_where_from$005$out[1];
  assign decoder_where_from_out$042   = decoder_where_from$005$out[2];
  assign decoder_where_from_out$043   = decoder_where_from$005$out[3];
  assign decoder_where_from_out$044   = decoder_where_from$005$out[4];
  assign decoder_where_from_out$045   = decoder_where_from$005$out[5];
  assign decoder_where_from_out$046   = decoder_where_from$005$out[6];
  assign decoder_where_from_out$047   = decoder_where_from$005$out[7];
  assign decoder_where_from_out$048   = decoder_where_from$006$out[0];
  assign decoder_where_from_out$049   = decoder_where_from$006$out[1];
  assign decoder_where_from_out$050   = decoder_where_from$006$out[2];
  assign decoder_where_from_out$051   = decoder_where_from$006$out[3];
  assign decoder_where_from_out$052   = decoder_where_from$006$out[4];
  assign decoder_where_from_out$053   = decoder_where_from$006$out[5];
  assign decoder_where_from_out$054   = decoder_where_from$006$out[6];
  assign decoder_where_from_out$055   = decoder_where_from$006$out[7];
  assign decoder_where_from_out$056   = decoder_where_from$007$out[0];
  assign decoder_where_from_out$057   = decoder_where_from$007$out[1];
  assign decoder_where_from_out$058   = decoder_where_from$007$out[2];
  assign decoder_where_from_out$059   = decoder_where_from$007$out[3];
  assign decoder_where_from_out$060   = decoder_where_from$007$out[4];
  assign decoder_where_from_out$061   = decoder_where_from$007$out[5];
  assign decoder_where_from_out$062   = decoder_where_from$007$out[6];
  assign decoder_where_from_out$063   = decoder_where_from$007$out[7];
  assign where_from$000$clk           = clk;
  assign where_from$000$en            = bank_req_val$000;
  assign where_from$000$in_           = a_out$000;
  assign where_from$000$reset         = reset;
  assign where_from$001$clk           = clk;
  assign where_from$001$en            = bank_req_val$001;
  assign where_from$001$in_           = a_out$001;
  assign where_from$001$reset         = reset;
  assign where_from$002$clk           = clk;
  assign where_from$002$en            = bank_req_val$002;
  assign where_from$002$in_           = a_out$002;
  assign where_from$002$reset         = reset;
  assign where_from$003$clk           = clk;
  assign where_from$003$en            = bank_req_val$003;
  assign where_from$003$in_           = a_out$003;
  assign where_from$003$reset         = reset;
  assign where_from$004$clk           = clk;
  assign where_from$004$en            = bank_req_val$004;
  assign where_from$004$in_           = a_out$004;
  assign where_from$004$reset         = reset;
  assign where_from$005$clk           = clk;
  assign where_from$005$en            = bank_req_val$005;
  assign where_from$005$in_           = a_out$005;
  assign where_from$005$reset         = reset;
  assign where_from$006$clk           = clk;
  assign where_from$006$en            = bank_req_val$006;
  assign where_from$006$in_           = a_out$006;
  assign where_from$006$reset         = reset;
  assign where_from$007$clk           = clk;
  assign where_from$007$en            = bank_req_val$007;
  assign where_from$007$in_           = a_out$007;
  assign where_from$007$reset         = reset;
  assign where_from_out$000           = where_from$000$out;
  assign where_from_out$001           = where_from$001$out;
  assign where_from_out$002           = where_from$002$out;
  assign where_from_out$003           = where_from$003$out;
  assign where_from_out$004           = where_from$004$out;
  assign where_from_out$005           = where_from$005$out;
  assign where_from_out$006           = where_from$006$out;
  assign where_from_out$007           = where_from$007$out;
  assign where_to$000$clk             = clk;
  assign where_to$000$en              = xbar_req$000_val;
  assign where_to$000$in_             = xbar_req$000_msg[2:0];
  assign where_to$000$reset           = reset;
  assign where_to$001$clk             = clk;
  assign where_to$001$en              = xbar_req$001_val;
  assign where_to$001$in_             = xbar_req$001_msg[2:0];
  assign where_to$001$reset           = reset;
  assign where_to$002$clk             = clk;
  assign where_to$002$en              = xbar_req$002_val;
  assign where_to$002$in_             = xbar_req$002_msg[2:0];
  assign where_to$002$reset           = reset;
  assign where_to$003$clk             = clk;
  assign where_to$003$en              = xbar_req$003_val;
  assign where_to$003$in_             = xbar_req$003_msg[2:0];
  assign where_to$003$reset           = reset;
  assign where_to$004$clk             = clk;
  assign where_to$004$en              = xbar_req$004_val;
  assign where_to$004$in_             = xbar_req$004_msg[2:0];
  assign where_to$004$reset           = reset;
  assign where_to$005$clk             = clk;
  assign where_to$005$en              = xbar_req$005_val;
  assign where_to$005$in_             = xbar_req$005_msg[2:0];
  assign where_to$005$reset           = reset;
  assign where_to$006$clk             = clk;
  assign where_to$006$en              = xbar_req$006_val;
  assign where_to$006$in_             = xbar_req$006_msg[2:0];
  assign where_to$006$reset           = reset;
  assign where_to$007$clk             = clk;
  assign where_to$007$en              = xbar_req$007_val;
  assign where_to$007$in_             = xbar_req$007_msg[2:0];
  assign where_to$007$reset           = reset;
  assign where_to_out$000             = where_to$000$out;
  assign where_to_out$001             = where_to$001$out;
  assign where_to_out$002             = where_to$002$out;
  assign where_to_out$003             = where_to$003$out;
  assign where_to_out$004             = where_to$004$out;
  assign where_to_out$005             = where_to$005$out;
  assign where_to_out$006             = where_to$006$out;
  assign where_to_out$007             = where_to$007$out;
  assign where_to_val$000$clk         = clk;
  assign where_to_val$000$en          = where_to_val_en$000;
  assign where_to_val$000$in_         = where_to_val_in$000;
  assign where_to_val$000$reset       = reset;
  assign where_to_val$001$clk         = clk;
  assign where_to_val$001$en          = where_to_val_en$001;
  assign where_to_val$001$in_         = where_to_val_in$001;
  assign where_to_val$001$reset       = reset;
  assign where_to_val$002$clk         = clk;
  assign where_to_val$002$en          = where_to_val_en$002;
  assign where_to_val$002$in_         = where_to_val_in$002;
  assign where_to_val$002$reset       = reset;
  assign where_to_val$003$clk         = clk;
  assign where_to_val$003$en          = where_to_val_en$003;
  assign where_to_val$003$in_         = where_to_val_in$003;
  assign where_to_val$003$reset       = reset;
  assign where_to_val$004$clk         = clk;
  assign where_to_val$004$en          = where_to_val_en$004;
  assign where_to_val$004$in_         = where_to_val_in$004;
  assign where_to_val$004$reset       = reset;
  assign where_to_val$005$clk         = clk;
  assign where_to_val$005$en          = where_to_val_en$005;
  assign where_to_val$005$in_         = where_to_val_in$005;
  assign where_to_val$005$reset       = reset;
  assign where_to_val$006$clk         = clk;
  assign where_to_val$006$en          = where_to_val_en$006;
  assign where_to_val$006$in_         = where_to_val_in$006;
  assign where_to_val$006$reset       = reset;
  assign where_to_val$007$clk         = clk;
  assign where_to_val$007$en          = where_to_val_en$007;
  assign where_to_val$007$in_         = where_to_val_in$007;
  assign where_to_val$007$reset       = reset;
  assign where_to_val_out$000         = where_to_val$000$out;
  assign where_to_val_out$001         = where_to_val$001$out;
  assign where_to_val_out$002         = where_to_val$002$out;
  assign where_to_val_out$003         = where_to_val$003$out;
  assign where_to_val_out$004         = where_to_val$004$out;
  assign where_to_val_out$005         = where_to_val$005$out;
  assign where_to_val_out$006         = where_to_val$006$out;
  assign where_to_val_out$007         = where_to_val$007$out;
  assign xbar_req$000_rdy             = xbar_req_rdy$000;
  assign xbar_req$001_rdy             = xbar_req_rdy$001;
  assign xbar_req$002_rdy             = xbar_req_rdy$002;
  assign xbar_req$003_rdy             = xbar_req_rdy$003;
  assign xbar_req$004_rdy             = xbar_req_rdy$004;
  assign xbar_req$005_rdy             = xbar_req_rdy$005;
  assign xbar_req$006_rdy             = xbar_req_rdy$006;
  assign xbar_req$007_rdy             = xbar_req_rdy$007;

  // array declarations
  reg    [   0:0] a_in_valid[0:63];
  assign a_in_valid$000 = a_in_valid[  0];
  assign a_in_valid$001 = a_in_valid[  1];
  assign a_in_valid$002 = a_in_valid[  2];
  assign a_in_valid$003 = a_in_valid[  3];
  assign a_in_valid$004 = a_in_valid[  4];
  assign a_in_valid$005 = a_in_valid[  5];
  assign a_in_valid$006 = a_in_valid[  6];
  assign a_in_valid$007 = a_in_valid[  7];
  assign a_in_valid$008 = a_in_valid[  8];
  assign a_in_valid$009 = a_in_valid[  9];
  assign a_in_valid$010 = a_in_valid[ 10];
  assign a_in_valid$011 = a_in_valid[ 11];
  assign a_in_valid$012 = a_in_valid[ 12];
  assign a_in_valid$013 = a_in_valid[ 13];
  assign a_in_valid$014 = a_in_valid[ 14];
  assign a_in_valid$015 = a_in_valid[ 15];
  assign a_in_valid$016 = a_in_valid[ 16];
  assign a_in_valid$017 = a_in_valid[ 17];
  assign a_in_valid$018 = a_in_valid[ 18];
  assign a_in_valid$019 = a_in_valid[ 19];
  assign a_in_valid$020 = a_in_valid[ 20];
  assign a_in_valid$021 = a_in_valid[ 21];
  assign a_in_valid$022 = a_in_valid[ 22];
  assign a_in_valid$023 = a_in_valid[ 23];
  assign a_in_valid$024 = a_in_valid[ 24];
  assign a_in_valid$025 = a_in_valid[ 25];
  assign a_in_valid$026 = a_in_valid[ 26];
  assign a_in_valid$027 = a_in_valid[ 27];
  assign a_in_valid$028 = a_in_valid[ 28];
  assign a_in_valid$029 = a_in_valid[ 29];
  assign a_in_valid$030 = a_in_valid[ 30];
  assign a_in_valid$031 = a_in_valid[ 31];
  assign a_in_valid$032 = a_in_valid[ 32];
  assign a_in_valid$033 = a_in_valid[ 33];
  assign a_in_valid$034 = a_in_valid[ 34];
  assign a_in_valid$035 = a_in_valid[ 35];
  assign a_in_valid$036 = a_in_valid[ 36];
  assign a_in_valid$037 = a_in_valid[ 37];
  assign a_in_valid$038 = a_in_valid[ 38];
  assign a_in_valid$039 = a_in_valid[ 39];
  assign a_in_valid$040 = a_in_valid[ 40];
  assign a_in_valid$041 = a_in_valid[ 41];
  assign a_in_valid$042 = a_in_valid[ 42];
  assign a_in_valid$043 = a_in_valid[ 43];
  assign a_in_valid$044 = a_in_valid[ 44];
  assign a_in_valid$045 = a_in_valid[ 45];
  assign a_in_valid$046 = a_in_valid[ 46];
  assign a_in_valid$047 = a_in_valid[ 47];
  assign a_in_valid$048 = a_in_valid[ 48];
  assign a_in_valid$049 = a_in_valid[ 49];
  assign a_in_valid$050 = a_in_valid[ 50];
  assign a_in_valid$051 = a_in_valid[ 51];
  assign a_in_valid$052 = a_in_valid[ 52];
  assign a_in_valid$053 = a_in_valid[ 53];
  assign a_in_valid$054 = a_in_valid[ 54];
  assign a_in_valid$055 = a_in_valid[ 55];
  assign a_in_valid$056 = a_in_valid[ 56];
  assign a_in_valid$057 = a_in_valid[ 57];
  assign a_in_valid$058 = a_in_valid[ 58];
  assign a_in_valid$059 = a_in_valid[ 59];
  assign a_in_valid$060 = a_in_valid[ 60];
  assign a_in_valid$061 = a_in_valid[ 61];
  assign a_in_valid$062 = a_in_valid[ 62];
  assign a_in_valid$063 = a_in_valid[ 63];
  wire   [   2:0] a_out[0:7];
  assign a_out[  0] = a_out$000;
  assign a_out[  1] = a_out$001;
  assign a_out[  2] = a_out$002;
  assign a_out[  3] = a_out$003;
  assign a_out[  4] = a_out$004;
  assign a_out[  5] = a_out$005;
  assign a_out[  6] = a_out$006;
  assign a_out[  7] = a_out$007;
  wire   [   0:0] a_out_valid[0:7];
  assign a_out_valid[  0] = a_out_valid$000;
  assign a_out_valid[  1] = a_out_valid$001;
  assign a_out_valid[  2] = a_out_valid$002;
  assign a_out_valid[  3] = a_out_valid$003;
  assign a_out_valid[  4] = a_out_valid$004;
  assign a_out_valid[  5] = a_out_valid$005;
  assign a_out_valid[  6] = a_out_valid$006;
  assign a_out_valid[  7] = a_out_valid$007;
  wire   [   0:0] bank_req_rdy[0:7];
  assign bank_req_rdy[  0] = bank_req_rdy$000;
  assign bank_req_rdy[  1] = bank_req_rdy$001;
  assign bank_req_rdy[  2] = bank_req_rdy$002;
  assign bank_req_rdy[  3] = bank_req_rdy$003;
  assign bank_req_rdy[  4] = bank_req_rdy$004;
  assign bank_req_rdy[  5] = bank_req_rdy$005;
  assign bank_req_rdy[  6] = bank_req_rdy$006;
  assign bank_req_rdy[  7] = bank_req_rdy$007;
  reg    [   0:0] bank_req_val[0:7];
  assign bank_req_val$000 = bank_req_val[  0];
  assign bank_req_val$001 = bank_req_val[  1];
  assign bank_req_val$002 = bank_req_val[  2];
  assign bank_req_val$003 = bank_req_val[  3];
  assign bank_req_val$004 = bank_req_val[  4];
  assign bank_req_val$005 = bank_req_val[  5];
  assign bank_req_val$006 = bank_req_val[  6];
  assign bank_req_val$007 = bank_req_val[  7];
  reg    [   0:0] bank_resp_rdy[0:7];
  assign bank_resp_rdy$000 = bank_resp_rdy[  0];
  assign bank_resp_rdy$001 = bank_resp_rdy[  1];
  assign bank_resp_rdy$002 = bank_resp_rdy[  2];
  assign bank_resp_rdy$003 = bank_resp_rdy[  3];
  assign bank_resp_rdy$004 = bank_resp_rdy[  4];
  assign bank_resp_rdy$005 = bank_resp_rdy[  5];
  assign bank_resp_rdy$006 = bank_resp_rdy[  6];
  assign bank_resp_rdy$007 = bank_resp_rdy[  7];
  wire   [   0:0] bank_resp_val[0:7];
  assign bank_resp_val[  0] = bank_resp_val$000;
  assign bank_resp_val[  1] = bank_resp_val$001;
  assign bank_resp_val[  2] = bank_resp_val$002;
  assign bank_resp_val[  3] = bank_resp_val$003;
  assign bank_resp_val[  4] = bank_resp_val$004;
  assign bank_resp_val[  5] = bank_resp_val$005;
  assign bank_resp_val[  6] = bank_resp_val$006;
  assign bank_resp_val[  7] = bank_resp_val$007;
  wire   [   0:0] decoder_a_out_out[0:63];
  assign decoder_a_out_out[  0] = decoder_a_out_out$000;
  assign decoder_a_out_out[  1] = decoder_a_out_out$001;
  assign decoder_a_out_out[  2] = decoder_a_out_out$002;
  assign decoder_a_out_out[  3] = decoder_a_out_out$003;
  assign decoder_a_out_out[  4] = decoder_a_out_out$004;
  assign decoder_a_out_out[  5] = decoder_a_out_out$005;
  assign decoder_a_out_out[  6] = decoder_a_out_out$006;
  assign decoder_a_out_out[  7] = decoder_a_out_out$007;
  assign decoder_a_out_out[  8] = decoder_a_out_out$008;
  assign decoder_a_out_out[  9] = decoder_a_out_out$009;
  assign decoder_a_out_out[ 10] = decoder_a_out_out$010;
  assign decoder_a_out_out[ 11] = decoder_a_out_out$011;
  assign decoder_a_out_out[ 12] = decoder_a_out_out$012;
  assign decoder_a_out_out[ 13] = decoder_a_out_out$013;
  assign decoder_a_out_out[ 14] = decoder_a_out_out$014;
  assign decoder_a_out_out[ 15] = decoder_a_out_out$015;
  assign decoder_a_out_out[ 16] = decoder_a_out_out$016;
  assign decoder_a_out_out[ 17] = decoder_a_out_out$017;
  assign decoder_a_out_out[ 18] = decoder_a_out_out$018;
  assign decoder_a_out_out[ 19] = decoder_a_out_out$019;
  assign decoder_a_out_out[ 20] = decoder_a_out_out$020;
  assign decoder_a_out_out[ 21] = decoder_a_out_out$021;
  assign decoder_a_out_out[ 22] = decoder_a_out_out$022;
  assign decoder_a_out_out[ 23] = decoder_a_out_out$023;
  assign decoder_a_out_out[ 24] = decoder_a_out_out$024;
  assign decoder_a_out_out[ 25] = decoder_a_out_out$025;
  assign decoder_a_out_out[ 26] = decoder_a_out_out$026;
  assign decoder_a_out_out[ 27] = decoder_a_out_out$027;
  assign decoder_a_out_out[ 28] = decoder_a_out_out$028;
  assign decoder_a_out_out[ 29] = decoder_a_out_out$029;
  assign decoder_a_out_out[ 30] = decoder_a_out_out$030;
  assign decoder_a_out_out[ 31] = decoder_a_out_out$031;
  assign decoder_a_out_out[ 32] = decoder_a_out_out$032;
  assign decoder_a_out_out[ 33] = decoder_a_out_out$033;
  assign decoder_a_out_out[ 34] = decoder_a_out_out$034;
  assign decoder_a_out_out[ 35] = decoder_a_out_out$035;
  assign decoder_a_out_out[ 36] = decoder_a_out_out$036;
  assign decoder_a_out_out[ 37] = decoder_a_out_out$037;
  assign decoder_a_out_out[ 38] = decoder_a_out_out$038;
  assign decoder_a_out_out[ 39] = decoder_a_out_out$039;
  assign decoder_a_out_out[ 40] = decoder_a_out_out$040;
  assign decoder_a_out_out[ 41] = decoder_a_out_out$041;
  assign decoder_a_out_out[ 42] = decoder_a_out_out$042;
  assign decoder_a_out_out[ 43] = decoder_a_out_out$043;
  assign decoder_a_out_out[ 44] = decoder_a_out_out$044;
  assign decoder_a_out_out[ 45] = decoder_a_out_out$045;
  assign decoder_a_out_out[ 46] = decoder_a_out_out$046;
  assign decoder_a_out_out[ 47] = decoder_a_out_out$047;
  assign decoder_a_out_out[ 48] = decoder_a_out_out$048;
  assign decoder_a_out_out[ 49] = decoder_a_out_out$049;
  assign decoder_a_out_out[ 50] = decoder_a_out_out$050;
  assign decoder_a_out_out[ 51] = decoder_a_out_out$051;
  assign decoder_a_out_out[ 52] = decoder_a_out_out$052;
  assign decoder_a_out_out[ 53] = decoder_a_out_out$053;
  assign decoder_a_out_out[ 54] = decoder_a_out_out$054;
  assign decoder_a_out_out[ 55] = decoder_a_out_out$055;
  assign decoder_a_out_out[ 56] = decoder_a_out_out$056;
  assign decoder_a_out_out[ 57] = decoder_a_out_out$057;
  assign decoder_a_out_out[ 58] = decoder_a_out_out$058;
  assign decoder_a_out_out[ 59] = decoder_a_out_out$059;
  assign decoder_a_out_out[ 60] = decoder_a_out_out$060;
  assign decoder_a_out_out[ 61] = decoder_a_out_out$061;
  assign decoder_a_out_out[ 62] = decoder_a_out_out$062;
  assign decoder_a_out_out[ 63] = decoder_a_out_out$063;
  wire   [   0:0] decoder_where_from_out[0:63];
  assign decoder_where_from_out[  0] = decoder_where_from_out$000;
  assign decoder_where_from_out[  1] = decoder_where_from_out$001;
  assign decoder_where_from_out[  2] = decoder_where_from_out$002;
  assign decoder_where_from_out[  3] = decoder_where_from_out$003;
  assign decoder_where_from_out[  4] = decoder_where_from_out$004;
  assign decoder_where_from_out[  5] = decoder_where_from_out$005;
  assign decoder_where_from_out[  6] = decoder_where_from_out$006;
  assign decoder_where_from_out[  7] = decoder_where_from_out$007;
  assign decoder_where_from_out[  8] = decoder_where_from_out$008;
  assign decoder_where_from_out[  9] = decoder_where_from_out$009;
  assign decoder_where_from_out[ 10] = decoder_where_from_out$010;
  assign decoder_where_from_out[ 11] = decoder_where_from_out$011;
  assign decoder_where_from_out[ 12] = decoder_where_from_out$012;
  assign decoder_where_from_out[ 13] = decoder_where_from_out$013;
  assign decoder_where_from_out[ 14] = decoder_where_from_out$014;
  assign decoder_where_from_out[ 15] = decoder_where_from_out$015;
  assign decoder_where_from_out[ 16] = decoder_where_from_out$016;
  assign decoder_where_from_out[ 17] = decoder_where_from_out$017;
  assign decoder_where_from_out[ 18] = decoder_where_from_out$018;
  assign decoder_where_from_out[ 19] = decoder_where_from_out$019;
  assign decoder_where_from_out[ 20] = decoder_where_from_out$020;
  assign decoder_where_from_out[ 21] = decoder_where_from_out$021;
  assign decoder_where_from_out[ 22] = decoder_where_from_out$022;
  assign decoder_where_from_out[ 23] = decoder_where_from_out$023;
  assign decoder_where_from_out[ 24] = decoder_where_from_out$024;
  assign decoder_where_from_out[ 25] = decoder_where_from_out$025;
  assign decoder_where_from_out[ 26] = decoder_where_from_out$026;
  assign decoder_where_from_out[ 27] = decoder_where_from_out$027;
  assign decoder_where_from_out[ 28] = decoder_where_from_out$028;
  assign decoder_where_from_out[ 29] = decoder_where_from_out$029;
  assign decoder_where_from_out[ 30] = decoder_where_from_out$030;
  assign decoder_where_from_out[ 31] = decoder_where_from_out$031;
  assign decoder_where_from_out[ 32] = decoder_where_from_out$032;
  assign decoder_where_from_out[ 33] = decoder_where_from_out$033;
  assign decoder_where_from_out[ 34] = decoder_where_from_out$034;
  assign decoder_where_from_out[ 35] = decoder_where_from_out$035;
  assign decoder_where_from_out[ 36] = decoder_where_from_out$036;
  assign decoder_where_from_out[ 37] = decoder_where_from_out$037;
  assign decoder_where_from_out[ 38] = decoder_where_from_out$038;
  assign decoder_where_from_out[ 39] = decoder_where_from_out$039;
  assign decoder_where_from_out[ 40] = decoder_where_from_out$040;
  assign decoder_where_from_out[ 41] = decoder_where_from_out$041;
  assign decoder_where_from_out[ 42] = decoder_where_from_out$042;
  assign decoder_where_from_out[ 43] = decoder_where_from_out$043;
  assign decoder_where_from_out[ 44] = decoder_where_from_out$044;
  assign decoder_where_from_out[ 45] = decoder_where_from_out$045;
  assign decoder_where_from_out[ 46] = decoder_where_from_out$046;
  assign decoder_where_from_out[ 47] = decoder_where_from_out$047;
  assign decoder_where_from_out[ 48] = decoder_where_from_out$048;
  assign decoder_where_from_out[ 49] = decoder_where_from_out$049;
  assign decoder_where_from_out[ 50] = decoder_where_from_out$050;
  assign decoder_where_from_out[ 51] = decoder_where_from_out$051;
  assign decoder_where_from_out[ 52] = decoder_where_from_out$052;
  assign decoder_where_from_out[ 53] = decoder_where_from_out$053;
  assign decoder_where_from_out[ 54] = decoder_where_from_out$054;
  assign decoder_where_from_out[ 55] = decoder_where_from_out$055;
  assign decoder_where_from_out[ 56] = decoder_where_from_out$056;
  assign decoder_where_from_out[ 57] = decoder_where_from_out$057;
  assign decoder_where_from_out[ 58] = decoder_where_from_out$058;
  assign decoder_where_from_out[ 59] = decoder_where_from_out$059;
  assign decoder_where_from_out[ 60] = decoder_where_from_out$060;
  assign decoder_where_from_out[ 61] = decoder_where_from_out$061;
  assign decoder_where_from_out[ 62] = decoder_where_from_out$062;
  assign decoder_where_from_out[ 63] = decoder_where_from_out$063;
  reg    [   2:0] mi_select[0:7];
  assign mi_select$000 = mi_select[  0];
  assign mi_select$001 = mi_select[  1];
  assign mi_select$002 = mi_select[  2];
  assign mi_select$003 = mi_select[  3];
  assign mi_select$004 = mi_select[  4];
  assign mi_select$005 = mi_select[  5];
  assign mi_select$006 = mi_select[  6];
  assign mi_select$007 = mi_select[  7];
  reg    [   2:0] mo_select[0:7];
  assign mo_select$000 = mo_select[  0];
  assign mo_select$001 = mo_select[  1];
  assign mo_select$002 = mo_select[  2];
  assign mo_select$003 = mo_select[  3];
  assign mo_select$004 = mo_select[  4];
  assign mo_select$005 = mo_select[  5];
  assign mo_select$006 = mo_select[  6];
  assign mo_select$007 = mo_select[  7];
  wire   [   2:0] where_from_out[0:7];
  assign where_from_out[  0] = where_from_out$000;
  assign where_from_out[  1] = where_from_out$001;
  assign where_from_out[  2] = where_from_out$002;
  assign where_from_out[  3] = where_from_out$003;
  assign where_from_out[  4] = where_from_out$004;
  assign where_from_out[  5] = where_from_out$005;
  assign where_from_out[  6] = where_from_out$006;
  assign where_from_out[  7] = where_from_out$007;
  wire   [   2:0] where_to_out[0:7];
  assign where_to_out[  0] = where_to_out$000;
  assign where_to_out[  1] = where_to_out$001;
  assign where_to_out[  2] = where_to_out$002;
  assign where_to_out[  3] = where_to_out$003;
  assign where_to_out[  4] = where_to_out$004;
  assign where_to_out[  5] = where_to_out$005;
  assign where_to_out[  6] = where_to_out$006;
  assign where_to_out[  7] = where_to_out$007;
  reg    [   0:0] where_to_val_en[0:7];
  assign where_to_val_en$000 = where_to_val_en[  0];
  assign where_to_val_en$001 = where_to_val_en[  1];
  assign where_to_val_en$002 = where_to_val_en[  2];
  assign where_to_val_en$003 = where_to_val_en[  3];
  assign where_to_val_en$004 = where_to_val_en[  4];
  assign where_to_val_en$005 = where_to_val_en[  5];
  assign where_to_val_en$006 = where_to_val_en[  6];
  assign where_to_val_en$007 = where_to_val_en[  7];
  reg    [   0:0] where_to_val_in[0:7];
  assign where_to_val_in$000 = where_to_val_in[  0];
  assign where_to_val_in$001 = where_to_val_in[  1];
  assign where_to_val_in$002 = where_to_val_in[  2];
  assign where_to_val_in$003 = where_to_val_in[  3];
  assign where_to_val_in$004 = where_to_val_in[  4];
  assign where_to_val_in$005 = where_to_val_in[  5];
  assign where_to_val_in$006 = where_to_val_in[  6];
  assign where_to_val_in$007 = where_to_val_in[  7];
  wire   [   0:0] where_to_val_out[0:7];
  assign where_to_val_out[  0] = where_to_val_out$000;
  assign where_to_val_out[  1] = where_to_val_out$001;
  assign where_to_val_out[  2] = where_to_val_out$002;
  assign where_to_val_out[  3] = where_to_val_out$003;
  assign where_to_val_out[  4] = where_to_val_out$004;
  assign where_to_val_out[  5] = where_to_val_out$005;
  assign where_to_val_out[  6] = where_to_val_out$006;
  assign where_to_val_out[  7] = where_to_val_out$007;
  reg    [   0:0] where_to_val_reset[0:7];
  assign where_to_val_reset$000 = where_to_val_reset[  0];
  assign where_to_val_reset$001 = where_to_val_reset[  1];
  assign where_to_val_reset$002 = where_to_val_reset[  2];
  assign where_to_val_reset$003 = where_to_val_reset[  3];
  assign where_to_val_reset$004 = where_to_val_reset[  4];
  assign where_to_val_reset$005 = where_to_val_reset[  5];
  assign where_to_val_reset$006 = where_to_val_reset[  6];
  assign where_to_val_reset$007 = where_to_val_reset[  7];
  reg    [   7:0] where_to_val_reset_tmp[0:7];
  assign where_to_val_reset_tmp$000 = where_to_val_reset_tmp[  0];
  assign where_to_val_reset_tmp$001 = where_to_val_reset_tmp[  1];
  assign where_to_val_reset_tmp$002 = where_to_val_reset_tmp[  2];
  assign where_to_val_reset_tmp$003 = where_to_val_reset_tmp[  3];
  assign where_to_val_reset_tmp$004 = where_to_val_reset_tmp[  4];
  assign where_to_val_reset_tmp$005 = where_to_val_reset_tmp[  5];
  assign where_to_val_reset_tmp$006 = where_to_val_reset_tmp[  6];
  assign where_to_val_reset_tmp$007 = where_to_val_reset_tmp[  7];
  reg    [   0:0] where_to_val_set[0:7];
  assign where_to_val_set$000 = where_to_val_set[  0];
  assign where_to_val_set$001 = where_to_val_set[  1];
  assign where_to_val_set$002 = where_to_val_set[  2];
  assign where_to_val_set$003 = where_to_val_set[  3];
  assign where_to_val_set$004 = where_to_val_set[  4];
  assign where_to_val_set$005 = where_to_val_set[  5];
  assign where_to_val_set$006 = where_to_val_set[  6];
  assign where_to_val_set$007 = where_to_val_set[  7];
  reg    [   7:0] where_to_val_set_tmp[0:7];
  assign where_to_val_set_tmp$000 = where_to_val_set_tmp[  0];
  assign where_to_val_set_tmp$001 = where_to_val_set_tmp[  1];
  assign where_to_val_set_tmp$002 = where_to_val_set_tmp[  2];
  assign where_to_val_set_tmp$003 = where_to_val_set_tmp[  3];
  assign where_to_val_set_tmp$004 = where_to_val_set_tmp[  4];
  assign where_to_val_set_tmp$005 = where_to_val_set_tmp[  5];
  assign where_to_val_set_tmp$006 = where_to_val_set_tmp[  6];
  assign where_to_val_set_tmp$007 = where_to_val_set_tmp[  7];
  wire   [  31:0] xbar_req_msg[0:7];
  assign xbar_req_msg[  0] = xbar_req$000_msg;
  assign xbar_req_msg[  1] = xbar_req$001_msg;
  assign xbar_req_msg[  2] = xbar_req$002_msg;
  assign xbar_req_msg[  3] = xbar_req$003_msg;
  assign xbar_req_msg[  4] = xbar_req$004_msg;
  assign xbar_req_msg[  5] = xbar_req$005_msg;
  assign xbar_req_msg[  6] = xbar_req$006_msg;
  assign xbar_req_msg[  7] = xbar_req$007_msg;
  reg    [   0:0] xbar_req_rdy[0:7];
  assign xbar_req_rdy$000 = xbar_req_rdy[  0];
  assign xbar_req_rdy$001 = xbar_req_rdy[  1];
  assign xbar_req_rdy$002 = xbar_req_rdy[  2];
  assign xbar_req_rdy$003 = xbar_req_rdy[  3];
  assign xbar_req_rdy$004 = xbar_req_rdy[  4];
  assign xbar_req_rdy$005 = xbar_req_rdy[  5];
  assign xbar_req_rdy$006 = xbar_req_rdy[  6];
  assign xbar_req_rdy$007 = xbar_req_rdy[  7];
  reg    [   7:0] xbar_req_rdy_temp[0:7];
  assign xbar_req_rdy_temp$000 = xbar_req_rdy_temp[  0];
  assign xbar_req_rdy_temp$001 = xbar_req_rdy_temp[  1];
  assign xbar_req_rdy_temp$002 = xbar_req_rdy_temp[  2];
  assign xbar_req_rdy_temp$003 = xbar_req_rdy_temp[  3];
  assign xbar_req_rdy_temp$004 = xbar_req_rdy_temp[  4];
  assign xbar_req_rdy_temp$005 = xbar_req_rdy_temp[  5];
  assign xbar_req_rdy_temp$006 = xbar_req_rdy_temp[  6];
  assign xbar_req_rdy_temp$007 = xbar_req_rdy_temp[  7];
  wire   [   0:0] xbar_req_val[0:7];
  assign xbar_req_val[  0] = xbar_req$000_val;
  assign xbar_req_val[  1] = xbar_req$001_val;
  assign xbar_req_val[  2] = xbar_req$002_val;
  assign xbar_req_val[  3] = xbar_req$003_val;
  assign xbar_req_val[  4] = xbar_req$004_val;
  assign xbar_req_val[  5] = xbar_req$005_val;
  assign xbar_req_val[  6] = xbar_req$006_val;
  assign xbar_req_val[  7] = xbar_req$007_val;
  wire   [   0:0] xbar_resp_rdy[0:7];
  assign xbar_resp_rdy[  0] = xbar_resp_rdy$000;
  assign xbar_resp_rdy[  1] = xbar_resp_rdy$001;
  assign xbar_resp_rdy[  2] = xbar_resp_rdy$002;
  assign xbar_resp_rdy[  3] = xbar_resp_rdy$003;
  assign xbar_resp_rdy[  4] = xbar_resp_rdy$004;
  assign xbar_resp_rdy[  5] = xbar_resp_rdy$005;
  assign xbar_resp_rdy[  6] = xbar_resp_rdy$006;
  assign xbar_resp_rdy[  7] = xbar_resp_rdy$007;
  reg    [   0:0] xbar_resp_val[0:7];
  assign xbar_resp_val$000 = xbar_resp_val[  0];
  assign xbar_resp_val$001 = xbar_resp_val[  1];
  assign xbar_resp_val$002 = xbar_resp_val[  2];
  assign xbar_resp_val$003 = xbar_resp_val[  3];
  assign xbar_resp_val$004 = xbar_resp_val[  4];
  assign xbar_resp_val$005 = xbar_resp_val[  5];
  assign xbar_resp_val$006 = xbar_resp_val[  6];
  assign xbar_resp_val$007 = xbar_resp_val[  7];
  reg    [   7:0] xbar_resp_val_temp[0:7];
  assign xbar_resp_val_temp$000 = xbar_resp_val_temp[  0];
  assign xbar_resp_val_temp$001 = xbar_resp_val_temp[  1];
  assign xbar_resp_val_temp$002 = xbar_resp_val_temp[  2];
  assign xbar_resp_val_temp$003 = xbar_resp_val_temp[  3];
  assign xbar_resp_val_temp$004 = xbar_resp_val_temp[  4];
  assign xbar_resp_val_temp$005 = xbar_resp_val_temp[  5];
  assign xbar_resp_val_temp$006 = xbar_resp_val_temp[  6];
  assign xbar_resp_val_temp$007 = xbar_resp_val_temp[  7];

  // PYMTL SOURCE:
  //
  // @s.combinational
  // def mux_select():
  //       for i in range(nports):
  //         s.mi_select[i].value = s.a_out[i]
  //         s.mo_select[i].value = s.where_to_out[i]

  // logic for mux_select()
  always @ (*) begin
    for (i=0; i < nports; i=i+1)
    begin
      mi_select[i] = a_out[i];
      mo_select[i] = where_to_out[i];
    end
  end

  // PYMTL SOURCE:
  //
  // @s.combinational
  // def request_to_bank():
  //       for i in range(nports):
  //         if (s.bank_req_rdy[i] == 1) and (s.a_out_valid[i] == 1):
  //           s.bank_req_val[i].value = 1
  //         else:
  //           s.bank_req_val[i].value = 0

  // logic for request_to_bank()
  always @ (*) begin
    for (i=0; i < nports; i=i+1)
    begin
      if (((bank_req_rdy[i] == 1)&&(a_out_valid[i] == 1))) begin
        bank_req_val[i] = 1;
      end
      else begin
        bank_req_val[i] = 0;
      end
    end
  end

  // PYMTL SOURCE:
  //
  // @s.combinational
  // def resp_bank():
  //       for i in range(nports):  
  //         if (s.bank_resp_val[i] == 1) and (s.xbar_resp_rdy[s.where_from_out[i]] == 1):
  //           s.bank_resp_rdy[i].value = 1
  //         else:
  //           s.bank_resp_rdy[i].value = 0 

  // logic for resp_bank()
  always @ (*) begin
    for (i=0; i < nports; i=i+1)
    begin
      if (((bank_resp_val[i] == 1)&&(xbar_resp_rdy[where_from_out[i]] == 1))) begin
        bank_resp_rdy[i] = 1;
      end
      else begin
        bank_resp_rdy[i] = 0;
      end
    end
  end

  // PYMTL SOURCE:
  //
  // @s.combinational
  // def where_to_valid_set_reset_tmp():
  //       for i in range(nports):
  //         for j in range(nports):
  //           s.where_to_val_set_tmp[i][j].value = (s.a_out_valid[j] == 1 and s.bank_req_rdy[j] == 1 and s.decoder_a_out_out[j*nports+i] == 1) 
  //           s.where_to_val_reset_tmp[i][j].value = (s.bank_resp_val[j] and s.decoder_where_from_out[i+j*nports] == 1)

  // logic for where_to_valid_set_reset_tmp()
  always @ (*) begin
    for (i=0; i < nports; i=i+1)
    begin
      for (j=0; j < nports; j=j+1)
      begin
        where_to_val_set_tmp[i][j] = ((a_out_valid[j] == 1)&&(bank_req_rdy[j] == 1)&&(decoder_a_out_out[((j*nports)+i)] == 1));
        where_to_val_reset_tmp[i][j] = (bank_resp_val[j]&&(decoder_where_from_out[(i+(j*nports))] == 1));
      end
    end
  end

  // PYMTL SOURCE:
  //
  // @s.combinational
  // def where_to_valid_set_reset():
  //       for i in range(nports):
  //         s.where_to_val_set[i].value = reduce_or(s.where_to_val_set_tmp[i])
  //         s.where_to_val_reset[i].value = reduce_or(s.where_to_val_reset_tmp[i])

  // logic for where_to_valid_set_reset()
  always @ (*) begin
    for (i=0; i < nports; i=i+1)
    begin
      where_to_val_set[i] = (|where_to_val_set_tmp[i]);
      where_to_val_reset[i] = (|where_to_val_reset_tmp[i]);
    end
  end

  // PYMTL SOURCE:
  //
  // @s.combinational
  // def where_to_valid_inputs():
  //       for i in range(nports):
  //         s.where_to_val_in[i].value = s.where_to_val_set[i].value        
  //         s.where_to_val_en[i].value = s.where_to_val_set[i].value or s.where_to_val_reset[i].value

  // logic for where_to_valid_inputs()
  always @ (*) begin
    for (i=0; i < nports; i=i+1)
    begin
      where_to_val_in[i] = where_to_val_set[i];
      where_to_val_en[i] = (where_to_val_set[i]||where_to_val_reset[i]);
    end
  end

  // PYMTL SOURCE:
  //
  // @s.combinational
  // def arbiters_in_valid():
  //       for i in range(nports):
  //         for j in range(nports):
  //           s.a_in_valid[i*nports+j].value = (not s.where_to_val_out[j]) and s.xbar_req[j].val and (s.xbar_req[j].msg[0:size] == i) and s.xbar_resp_rdy[j]

  // logic for arbiters_in_valid()
  always @ (*) begin
    for (i=0; i < nports; i=i+1)
    begin
      for (j=0; j < nports; j=j+1)
      begin
        a_in_valid[((i*nports)+j)] = (!where_to_val_out[j]&&xbar_req_val[j]&&(xbar_req_msg[j][(size)-1:0] == i)&&xbar_resp_rdy[j]);
      end
    end
  end

  // PYMTL SOURCE:
  //
  // @s.combinational
  // def xbar_req_rdy_temp():
  //       for i in range(nports):
  //         for j in range(nports):
  //           s.xbar_req_rdy_temp[i][j].value = (s.bank_resp_val[j] and s.decoder_where_from_out[j*nports+i] == 1) 

  // logic for xbar_req_rdy_temp()
  always @ (*) begin
    for (i=0; i < nports; i=i+1)
    begin
      for (j=0; j < nports; j=j+1)
      begin
        xbar_req_rdy_temp[i][j] = (bank_resp_val[j]&&(decoder_where_from_out[((j*nports)+i)] == 1));
      end
    end
  end

  // PYMTL SOURCE:
  //
  // @s.combinational
  // def xbar_resp_val_temp():
  //       for i in range(nports): 
  //         for j in range(nports):
  //           s.xbar_resp_val_temp[i][j].value = (s.bank_resp_val[j] and s.decoder_where_from_out[j*nports+i] == 1)

  // logic for xbar_resp_val_temp()
  always @ (*) begin
    for (i=0; i < nports; i=i+1)
    begin
      for (j=0; j < nports; j=j+1)
      begin
        xbar_resp_val_temp[i][j] = (bank_resp_val[j]&&(decoder_where_from_out[((j*nports)+i)] == 1));
      end
    end
  end

  // PYMTL SOURCE:
  //
  // @s.combinational
  // def xbar_req_rdy():
  //       for i in range(nports):
  //         s.xbar_req_rdy[i].value = reduce_or(s.xbar_req_rdy_temp[i])

  // logic for xbar_req_rdy()
  always @ (*) begin
    for (i=0; i < nports; i=i+1)
    begin
      xbar_req_rdy[i] = (|xbar_req_rdy_temp[i]);
    end
  end

  // PYMTL SOURCE:
  //
  // @s.combinational
  // def xbar_resp_val():
  //       for i in range(nports):
  //         s.xbar_resp_val[i].value = reduce_or(s.xbar_resp_val_temp[i])

  // logic for xbar_resp_val()
  always @ (*) begin
    for (i=0; i < nports; i=i+1)
    begin
      xbar_resp_val[i] = (|xbar_resp_val_temp[i]);
    end
  end


endmodule // Control_0x5bcef2db11135bb6
`default_nettype wire

//-----------------------------------------------------------------------------
// RegEnRst_0x3af9648ac192b2a0
//-----------------------------------------------------------------------------
// PyMTL: dump_vcd = False
// PyMTL: pclib.rtl.regs {"dtype": 3, "reset_value": 0}
// PyMTL: verilator_xinit = zeros
`default_nettype none
module RegEnRst_0x3af9648ac192b2a0
(
  input  wire [   0:0] clk,
  input  wire [   0:0] en,
  input  wire [   2:0] in_,
  output reg  [   2:0] out,
  input  wire [   0:0] reset
);

  // localparam declarations
  localparam reset_value = 0;



  // PYMTL SOURCE:
  //
  // @s.posedge_clk
  // def seq_logic():
  //       if s.reset:
  //         s.out.next = reset_value
  //       elif s.en:
  //         s.out.next = s.in_

  // logic for seq_logic()
  always @ (posedge clk) begin
    if (reset) begin
      out <= reset_value;
    end
    else begin
      if (en) begin
        out <= in_;
      end
      else begin
      end
    end
  end


endmodule // RegEnRst_0x3af9648ac192b2a0
`default_nettype wire

//-----------------------------------------------------------------------------
// Decoder_0x71aec56d73104bf5
//-----------------------------------------------------------------------------
// PyMTL: dump_vcd = False
// PyMTL: pclib.rtl.Decoder {"out_nbits": 8, "sel_nbits": 3}
// PyMTL: verilator_xinit = zeros
`default_nettype none
module Decoder_0x71aec56d73104bf5
(
  input  wire [   0:0] clk,
  input  wire [   2:0] in_,
  output reg  [   7:0] out,
  input  wire [   0:0] reset
);

  // localparam declarations
  localparam out_nbits = 8;

  // loop variable declarations
  integer i;



  // PYMTL SOURCE:
  //
  // @s.combinational
  // def logic():
  //       for i in range( out_nbits ):
  //         s.out[i].value = (s.in_ == i)

  // logic for logic()
  always @ (*) begin
    for (i=0; i < out_nbits; i=i+1)
    begin
      out[i] = (in_ == i);
    end
  end


endmodule // Decoder_0x71aec56d73104bf5
`default_nettype wire

//-----------------------------------------------------------------------------
// RegEnRst_0x3f928fe66716045e
//-----------------------------------------------------------------------------
// PyMTL: dump_vcd = False
// PyMTL: pclib.rtl.regs {"dtype": 1, "reset_value": 0}
// PyMTL: verilator_xinit = zeros
`default_nettype none
module RegEnRst_0x3f928fe66716045e
(
  input  wire [   0:0] clk,
  input  wire [   0:0] en,
  input  wire [   0:0] in_,
  output reg  [   0:0] out,
  input  wire [   0:0] reset
);

  // localparam declarations
  localparam reset_value = 0;



  // PYMTL SOURCE:
  //
  // @s.posedge_clk
  // def seq_logic():
  //       if s.reset:
  //         s.out.next = reset_value
  //       elif s.en:
  //         s.out.next = s.in_

  // logic for seq_logic()
  always @ (posedge clk) begin
    if (reset) begin
      out <= reset_value;
    end
    else begin
      if (en) begin
        out <= in_;
      end
      else begin
      end
    end
  end


endmodule // RegEnRst_0x3f928fe66716045e
`default_nettype wire

//-----------------------------------------------------------------------------
// Datapath_0x17612b122a0ef6cb
//-----------------------------------------------------------------------------
// PyMTL: dump_vcd = False
// PyMTL: xbar.Datapath {"nbits": 32, "nports": 8}
// PyMTL: verilator_xinit = zeros
`default_nettype none
module Datapath_0x17612b122a0ef6cb
(
  input  wire [   0:0] a_in_valid$000,
  input  wire [   0:0] a_in_valid$010,
  input  wire [   0:0] a_in_valid$011,
  input  wire [   0:0] a_in_valid$012,
  input  wire [   0:0] a_in_valid$013,
  input  wire [   0:0] a_in_valid$014,
  input  wire [   0:0] a_in_valid$015,
  input  wire [   0:0] a_in_valid$016,
  input  wire [   0:0] a_in_valid$017,
  input  wire [   0:0] a_in_valid$018,
  input  wire [   0:0] a_in_valid$019,
  input  wire [   0:0] a_in_valid$001,
  input  wire [   0:0] a_in_valid$020,
  input  wire [   0:0] a_in_valid$021,
  input  wire [   0:0] a_in_valid$022,
  input  wire [   0:0] a_in_valid$023,
  input  wire [   0:0] a_in_valid$024,
  input  wire [   0:0] a_in_valid$025,
  input  wire [   0:0] a_in_valid$026,
  input  wire [   0:0] a_in_valid$027,
  input  wire [   0:0] a_in_valid$028,
  input  wire [   0:0] a_in_valid$029,
  input  wire [   0:0] a_in_valid$002,
  input  wire [   0:0] a_in_valid$030,
  input  wire [   0:0] a_in_valid$031,
  input  wire [   0:0] a_in_valid$032,
  input  wire [   0:0] a_in_valid$033,
  input  wire [   0:0] a_in_valid$034,
  input  wire [   0:0] a_in_valid$035,
  input  wire [   0:0] a_in_valid$036,
  input  wire [   0:0] a_in_valid$037,
  input  wire [   0:0] a_in_valid$038,
  input  wire [   0:0] a_in_valid$039,
  input  wire [   0:0] a_in_valid$003,
  input  wire [   0:0] a_in_valid$040,
  input  wire [   0:0] a_in_valid$041,
  input  wire [   0:0] a_in_valid$042,
  input  wire [   0:0] a_in_valid$043,
  input  wire [   0:0] a_in_valid$044,
  input  wire [   0:0] a_in_valid$045,
  input  wire [   0:0] a_in_valid$046,
  input  wire [   0:0] a_in_valid$047,
  input  wire [   0:0] a_in_valid$048,
  input  wire [   0:0] a_in_valid$049,
  input  wire [   0:0] a_in_valid$004,
  input  wire [   0:0] a_in_valid$050,
  input  wire [   0:0] a_in_valid$051,
  input  wire [   0:0] a_in_valid$052,
  input  wire [   0:0] a_in_valid$053,
  input  wire [   0:0] a_in_valid$054,
  input  wire [   0:0] a_in_valid$055,
  input  wire [   0:0] a_in_valid$056,
  input  wire [   0:0] a_in_valid$057,
  input  wire [   0:0] a_in_valid$058,
  input  wire [   0:0] a_in_valid$059,
  input  wire [   0:0] a_in_valid$005,
  input  wire [   0:0] a_in_valid$060,
  input  wire [   0:0] a_in_valid$061,
  input  wire [   0:0] a_in_valid$062,
  input  wire [   0:0] a_in_valid$063,
  input  wire [   0:0] a_in_valid$006,
  input  wire [   0:0] a_in_valid$007,
  input  wire [   0:0] a_in_valid$008,
  input  wire [   0:0] a_in_valid$009,
  output wire [   2:0] a_out$000,
  output wire [   2:0] a_out$001,
  output wire [   2:0] a_out$002,
  output wire [   2:0] a_out$003,
  output wire [   2:0] a_out$004,
  output wire [   2:0] a_out$005,
  output wire [   2:0] a_out$006,
  output wire [   2:0] a_out$007,
  output wire [   0:0] a_out_valid$000,
  output wire [   0:0] a_out_valid$001,
  output wire [   0:0] a_out_valid$002,
  output wire [   0:0] a_out_valid$003,
  output wire [   0:0] a_out_valid$004,
  output wire [   0:0] a_out_valid$005,
  output wire [   0:0] a_out_valid$006,
  output wire [   0:0] a_out_valid$007,
  output wire [  31:0] bank_req_msg$000,
  output wire [  31:0] bank_req_msg$001,
  output wire [  31:0] bank_req_msg$002,
  output wire [  31:0] bank_req_msg$003,
  output wire [  31:0] bank_req_msg$004,
  output wire [  31:0] bank_req_msg$005,
  output wire [  31:0] bank_req_msg$006,
  output wire [  31:0] bank_req_msg$007,
  input  wire [  63:0] bank_resp_msg$000,
  input  wire [  63:0] bank_resp_msg$001,
  input  wire [  63:0] bank_resp_msg$002,
  input  wire [  63:0] bank_resp_msg$003,
  input  wire [  63:0] bank_resp_msg$004,
  input  wire [  63:0] bank_resp_msg$005,
  input  wire [  63:0] bank_resp_msg$006,
  input  wire [  63:0] bank_resp_msg$007,
  input  wire [   0:0] clk,
  input  wire [   2:0] mi_select$000,
  input  wire [   2:0] mi_select$001,
  input  wire [   2:0] mi_select$002,
  input  wire [   2:0] mi_select$003,
  input  wire [   2:0] mi_select$004,
  input  wire [   2:0] mi_select$005,
  input  wire [   2:0] mi_select$006,
  input  wire [   2:0] mi_select$007,
  input  wire [   2:0] mo_select$000,
  input  wire [   2:0] mo_select$001,
  input  wire [   2:0] mo_select$002,
  input  wire [   2:0] mo_select$003,
  input  wire [   2:0] mo_select$004,
  input  wire [   2:0] mo_select$005,
  input  wire [   2:0] mo_select$006,
  input  wire [   2:0] mo_select$007,
  input  wire [   0:0] reset,
  input  wire [  31:0] xbar_req_msg$000,
  input  wire [  31:0] xbar_req_msg$001,
  input  wire [  31:0] xbar_req_msg$002,
  input  wire [  31:0] xbar_req_msg$003,
  input  wire [  31:0] xbar_req_msg$004,
  input  wire [  31:0] xbar_req_msg$005,
  input  wire [  31:0] xbar_req_msg$006,
  input  wire [  31:0] xbar_req_msg$007,
  output wire [  63:0] xbar_resp_msg$000,
  output wire [  63:0] xbar_resp_msg$001,
  output wire [  63:0] xbar_resp_msg$002,
  output wire [  63:0] xbar_resp_msg$003,
  output wire [  63:0] xbar_resp_msg$004,
  output wire [  63:0] xbar_resp_msg$005,
  output wire [  63:0] xbar_resp_msg$006,
  output wire [  63:0] xbar_resp_msg$007
);











  // mi$000 temporaries
  wire   [   0:0] mi$000$clk;
  wire   [   0:0] mi$000$reset;
  wire   [  31:0] mi$000$in_$000;
  wire   [  31:0] mi$000$in_$001;
  wire   [  31:0] mi$000$in_$002;
  wire   [  31:0] mi$000$in_$003;
  wire   [  31:0] mi$000$in_$004;
  wire   [  31:0] mi$000$in_$005;
  wire   [  31:0] mi$000$in_$006;
  wire   [  31:0] mi$000$in_$007;
  wire   [   2:0] mi$000$sel;
  wire   [  31:0] mi$000$out;

  Mux_0x4144ab3fc21c61c3 mi$000
  (
    .clk     ( mi$000$clk ),
    .reset   ( mi$000$reset ),
    .in_$000 ( mi$000$in_$000 ),
    .in_$001 ( mi$000$in_$001 ),
    .in_$002 ( mi$000$in_$002 ),
    .in_$003 ( mi$000$in_$003 ),
    .in_$004 ( mi$000$in_$004 ),
    .in_$005 ( mi$000$in_$005 ),
    .in_$006 ( mi$000$in_$006 ),
    .in_$007 ( mi$000$in_$007 ),
    .sel     ( mi$000$sel ),
    .out     ( mi$000$out )
  );

  // mi$001 temporaries
  wire   [   0:0] mi$001$clk;
  wire   [   0:0] mi$001$reset;
  wire   [  31:0] mi$001$in_$000;
  wire   [  31:0] mi$001$in_$001;
  wire   [  31:0] mi$001$in_$002;
  wire   [  31:0] mi$001$in_$003;
  wire   [  31:0] mi$001$in_$004;
  wire   [  31:0] mi$001$in_$005;
  wire   [  31:0] mi$001$in_$006;
  wire   [  31:0] mi$001$in_$007;
  wire   [   2:0] mi$001$sel;
  wire   [  31:0] mi$001$out;

  Mux_0x4144ab3fc21c61c3 mi$001
  (
    .clk     ( mi$001$clk ),
    .reset   ( mi$001$reset ),
    .in_$000 ( mi$001$in_$000 ),
    .in_$001 ( mi$001$in_$001 ),
    .in_$002 ( mi$001$in_$002 ),
    .in_$003 ( mi$001$in_$003 ),
    .in_$004 ( mi$001$in_$004 ),
    .in_$005 ( mi$001$in_$005 ),
    .in_$006 ( mi$001$in_$006 ),
    .in_$007 ( mi$001$in_$007 ),
    .sel     ( mi$001$sel ),
    .out     ( mi$001$out )
  );

  // mi$002 temporaries
  wire   [   0:0] mi$002$clk;
  wire   [   0:0] mi$002$reset;
  wire   [  31:0] mi$002$in_$000;
  wire   [  31:0] mi$002$in_$001;
  wire   [  31:0] mi$002$in_$002;
  wire   [  31:0] mi$002$in_$003;
  wire   [  31:0] mi$002$in_$004;
  wire   [  31:0] mi$002$in_$005;
  wire   [  31:0] mi$002$in_$006;
  wire   [  31:0] mi$002$in_$007;
  wire   [   2:0] mi$002$sel;
  wire   [  31:0] mi$002$out;

  Mux_0x4144ab3fc21c61c3 mi$002
  (
    .clk     ( mi$002$clk ),
    .reset   ( mi$002$reset ),
    .in_$000 ( mi$002$in_$000 ),
    .in_$001 ( mi$002$in_$001 ),
    .in_$002 ( mi$002$in_$002 ),
    .in_$003 ( mi$002$in_$003 ),
    .in_$004 ( mi$002$in_$004 ),
    .in_$005 ( mi$002$in_$005 ),
    .in_$006 ( mi$002$in_$006 ),
    .in_$007 ( mi$002$in_$007 ),
    .sel     ( mi$002$sel ),
    .out     ( mi$002$out )
  );

  // mi$003 temporaries
  wire   [   0:0] mi$003$clk;
  wire   [   0:0] mi$003$reset;
  wire   [  31:0] mi$003$in_$000;
  wire   [  31:0] mi$003$in_$001;
  wire   [  31:0] mi$003$in_$002;
  wire   [  31:0] mi$003$in_$003;
  wire   [  31:0] mi$003$in_$004;
  wire   [  31:0] mi$003$in_$005;
  wire   [  31:0] mi$003$in_$006;
  wire   [  31:0] mi$003$in_$007;
  wire   [   2:0] mi$003$sel;
  wire   [  31:0] mi$003$out;

  Mux_0x4144ab3fc21c61c3 mi$003
  (
    .clk     ( mi$003$clk ),
    .reset   ( mi$003$reset ),
    .in_$000 ( mi$003$in_$000 ),
    .in_$001 ( mi$003$in_$001 ),
    .in_$002 ( mi$003$in_$002 ),
    .in_$003 ( mi$003$in_$003 ),
    .in_$004 ( mi$003$in_$004 ),
    .in_$005 ( mi$003$in_$005 ),
    .in_$006 ( mi$003$in_$006 ),
    .in_$007 ( mi$003$in_$007 ),
    .sel     ( mi$003$sel ),
    .out     ( mi$003$out )
  );

  // mi$004 temporaries
  wire   [   0:0] mi$004$clk;
  wire   [   0:0] mi$004$reset;
  wire   [  31:0] mi$004$in_$000;
  wire   [  31:0] mi$004$in_$001;
  wire   [  31:0] mi$004$in_$002;
  wire   [  31:0] mi$004$in_$003;
  wire   [  31:0] mi$004$in_$004;
  wire   [  31:0] mi$004$in_$005;
  wire   [  31:0] mi$004$in_$006;
  wire   [  31:0] mi$004$in_$007;
  wire   [   2:0] mi$004$sel;
  wire   [  31:0] mi$004$out;

  Mux_0x4144ab3fc21c61c3 mi$004
  (
    .clk     ( mi$004$clk ),
    .reset   ( mi$004$reset ),
    .in_$000 ( mi$004$in_$000 ),
    .in_$001 ( mi$004$in_$001 ),
    .in_$002 ( mi$004$in_$002 ),
    .in_$003 ( mi$004$in_$003 ),
    .in_$004 ( mi$004$in_$004 ),
    .in_$005 ( mi$004$in_$005 ),
    .in_$006 ( mi$004$in_$006 ),
    .in_$007 ( mi$004$in_$007 ),
    .sel     ( mi$004$sel ),
    .out     ( mi$004$out )
  );

  // mi$005 temporaries
  wire   [   0:0] mi$005$clk;
  wire   [   0:0] mi$005$reset;
  wire   [  31:0] mi$005$in_$000;
  wire   [  31:0] mi$005$in_$001;
  wire   [  31:0] mi$005$in_$002;
  wire   [  31:0] mi$005$in_$003;
  wire   [  31:0] mi$005$in_$004;
  wire   [  31:0] mi$005$in_$005;
  wire   [  31:0] mi$005$in_$006;
  wire   [  31:0] mi$005$in_$007;
  wire   [   2:0] mi$005$sel;
  wire   [  31:0] mi$005$out;

  Mux_0x4144ab3fc21c61c3 mi$005
  (
    .clk     ( mi$005$clk ),
    .reset   ( mi$005$reset ),
    .in_$000 ( mi$005$in_$000 ),
    .in_$001 ( mi$005$in_$001 ),
    .in_$002 ( mi$005$in_$002 ),
    .in_$003 ( mi$005$in_$003 ),
    .in_$004 ( mi$005$in_$004 ),
    .in_$005 ( mi$005$in_$005 ),
    .in_$006 ( mi$005$in_$006 ),
    .in_$007 ( mi$005$in_$007 ),
    .sel     ( mi$005$sel ),
    .out     ( mi$005$out )
  );

  // mi$006 temporaries
  wire   [   0:0] mi$006$clk;
  wire   [   0:0] mi$006$reset;
  wire   [  31:0] mi$006$in_$000;
  wire   [  31:0] mi$006$in_$001;
  wire   [  31:0] mi$006$in_$002;
  wire   [  31:0] mi$006$in_$003;
  wire   [  31:0] mi$006$in_$004;
  wire   [  31:0] mi$006$in_$005;
  wire   [  31:0] mi$006$in_$006;
  wire   [  31:0] mi$006$in_$007;
  wire   [   2:0] mi$006$sel;
  wire   [  31:0] mi$006$out;

  Mux_0x4144ab3fc21c61c3 mi$006
  (
    .clk     ( mi$006$clk ),
    .reset   ( mi$006$reset ),
    .in_$000 ( mi$006$in_$000 ),
    .in_$001 ( mi$006$in_$001 ),
    .in_$002 ( mi$006$in_$002 ),
    .in_$003 ( mi$006$in_$003 ),
    .in_$004 ( mi$006$in_$004 ),
    .in_$005 ( mi$006$in_$005 ),
    .in_$006 ( mi$006$in_$006 ),
    .in_$007 ( mi$006$in_$007 ),
    .sel     ( mi$006$sel ),
    .out     ( mi$006$out )
  );

  // mi$007 temporaries
  wire   [   0:0] mi$007$clk;
  wire   [   0:0] mi$007$reset;
  wire   [  31:0] mi$007$in_$000;
  wire   [  31:0] mi$007$in_$001;
  wire   [  31:0] mi$007$in_$002;
  wire   [  31:0] mi$007$in_$003;
  wire   [  31:0] mi$007$in_$004;
  wire   [  31:0] mi$007$in_$005;
  wire   [  31:0] mi$007$in_$006;
  wire   [  31:0] mi$007$in_$007;
  wire   [   2:0] mi$007$sel;
  wire   [  31:0] mi$007$out;

  Mux_0x4144ab3fc21c61c3 mi$007
  (
    .clk     ( mi$007$clk ),
    .reset   ( mi$007$reset ),
    .in_$000 ( mi$007$in_$000 ),
    .in_$001 ( mi$007$in_$001 ),
    .in_$002 ( mi$007$in_$002 ),
    .in_$003 ( mi$007$in_$003 ),
    .in_$004 ( mi$007$in_$004 ),
    .in_$005 ( mi$007$in_$005 ),
    .in_$006 ( mi$007$in_$006 ),
    .in_$007 ( mi$007$in_$007 ),
    .sel     ( mi$007$sel ),
    .out     ( mi$007$out )
  );

  // mo$000 temporaries
  wire   [   0:0] mo$000$clk;
  wire   [   0:0] mo$000$reset;
  wire   [  63:0] mo$000$in_$000;
  wire   [  63:0] mo$000$in_$001;
  wire   [  63:0] mo$000$in_$002;
  wire   [  63:0] mo$000$in_$003;
  wire   [  63:0] mo$000$in_$004;
  wire   [  63:0] mo$000$in_$005;
  wire   [  63:0] mo$000$in_$006;
  wire   [  63:0] mo$000$in_$007;
  wire   [   2:0] mo$000$sel;
  wire   [  63:0] mo$000$out;

  Mux_0x79e0711b59853f2c mo$000
  (
    .clk     ( mo$000$clk ),
    .reset   ( mo$000$reset ),
    .in_$000 ( mo$000$in_$000 ),
    .in_$001 ( mo$000$in_$001 ),
    .in_$002 ( mo$000$in_$002 ),
    .in_$003 ( mo$000$in_$003 ),
    .in_$004 ( mo$000$in_$004 ),
    .in_$005 ( mo$000$in_$005 ),
    .in_$006 ( mo$000$in_$006 ),
    .in_$007 ( mo$000$in_$007 ),
    .sel     ( mo$000$sel ),
    .out     ( mo$000$out )
  );

  // mo$001 temporaries
  wire   [   0:0] mo$001$clk;
  wire   [   0:0] mo$001$reset;
  wire   [  63:0] mo$001$in_$000;
  wire   [  63:0] mo$001$in_$001;
  wire   [  63:0] mo$001$in_$002;
  wire   [  63:0] mo$001$in_$003;
  wire   [  63:0] mo$001$in_$004;
  wire   [  63:0] mo$001$in_$005;
  wire   [  63:0] mo$001$in_$006;
  wire   [  63:0] mo$001$in_$007;
  wire   [   2:0] mo$001$sel;
  wire   [  63:0] mo$001$out;

  Mux_0x79e0711b59853f2c mo$001
  (
    .clk     ( mo$001$clk ),
    .reset   ( mo$001$reset ),
    .in_$000 ( mo$001$in_$000 ),
    .in_$001 ( mo$001$in_$001 ),
    .in_$002 ( mo$001$in_$002 ),
    .in_$003 ( mo$001$in_$003 ),
    .in_$004 ( mo$001$in_$004 ),
    .in_$005 ( mo$001$in_$005 ),
    .in_$006 ( mo$001$in_$006 ),
    .in_$007 ( mo$001$in_$007 ),
    .sel     ( mo$001$sel ),
    .out     ( mo$001$out )
  );

  // mo$002 temporaries
  wire   [   0:0] mo$002$clk;
  wire   [   0:0] mo$002$reset;
  wire   [  63:0] mo$002$in_$000;
  wire   [  63:0] mo$002$in_$001;
  wire   [  63:0] mo$002$in_$002;
  wire   [  63:0] mo$002$in_$003;
  wire   [  63:0] mo$002$in_$004;
  wire   [  63:0] mo$002$in_$005;
  wire   [  63:0] mo$002$in_$006;
  wire   [  63:0] mo$002$in_$007;
  wire   [   2:0] mo$002$sel;
  wire   [  63:0] mo$002$out;

  Mux_0x79e0711b59853f2c mo$002
  (
    .clk     ( mo$002$clk ),
    .reset   ( mo$002$reset ),
    .in_$000 ( mo$002$in_$000 ),
    .in_$001 ( mo$002$in_$001 ),
    .in_$002 ( mo$002$in_$002 ),
    .in_$003 ( mo$002$in_$003 ),
    .in_$004 ( mo$002$in_$004 ),
    .in_$005 ( mo$002$in_$005 ),
    .in_$006 ( mo$002$in_$006 ),
    .in_$007 ( mo$002$in_$007 ),
    .sel     ( mo$002$sel ),
    .out     ( mo$002$out )
  );

  // mo$003 temporaries
  wire   [   0:0] mo$003$clk;
  wire   [   0:0] mo$003$reset;
  wire   [  63:0] mo$003$in_$000;
  wire   [  63:0] mo$003$in_$001;
  wire   [  63:0] mo$003$in_$002;
  wire   [  63:0] mo$003$in_$003;
  wire   [  63:0] mo$003$in_$004;
  wire   [  63:0] mo$003$in_$005;
  wire   [  63:0] mo$003$in_$006;
  wire   [  63:0] mo$003$in_$007;
  wire   [   2:0] mo$003$sel;
  wire   [  63:0] mo$003$out;

  Mux_0x79e0711b59853f2c mo$003
  (
    .clk     ( mo$003$clk ),
    .reset   ( mo$003$reset ),
    .in_$000 ( mo$003$in_$000 ),
    .in_$001 ( mo$003$in_$001 ),
    .in_$002 ( mo$003$in_$002 ),
    .in_$003 ( mo$003$in_$003 ),
    .in_$004 ( mo$003$in_$004 ),
    .in_$005 ( mo$003$in_$005 ),
    .in_$006 ( mo$003$in_$006 ),
    .in_$007 ( mo$003$in_$007 ),
    .sel     ( mo$003$sel ),
    .out     ( mo$003$out )
  );

  // mo$004 temporaries
  wire   [   0:0] mo$004$clk;
  wire   [   0:0] mo$004$reset;
  wire   [  63:0] mo$004$in_$000;
  wire   [  63:0] mo$004$in_$001;
  wire   [  63:0] mo$004$in_$002;
  wire   [  63:0] mo$004$in_$003;
  wire   [  63:0] mo$004$in_$004;
  wire   [  63:0] mo$004$in_$005;
  wire   [  63:0] mo$004$in_$006;
  wire   [  63:0] mo$004$in_$007;
  wire   [   2:0] mo$004$sel;
  wire   [  63:0] mo$004$out;

  Mux_0x79e0711b59853f2c mo$004
  (
    .clk     ( mo$004$clk ),
    .reset   ( mo$004$reset ),
    .in_$000 ( mo$004$in_$000 ),
    .in_$001 ( mo$004$in_$001 ),
    .in_$002 ( mo$004$in_$002 ),
    .in_$003 ( mo$004$in_$003 ),
    .in_$004 ( mo$004$in_$004 ),
    .in_$005 ( mo$004$in_$005 ),
    .in_$006 ( mo$004$in_$006 ),
    .in_$007 ( mo$004$in_$007 ),
    .sel     ( mo$004$sel ),
    .out     ( mo$004$out )
  );

  // mo$005 temporaries
  wire   [   0:0] mo$005$clk;
  wire   [   0:0] mo$005$reset;
  wire   [  63:0] mo$005$in_$000;
  wire   [  63:0] mo$005$in_$001;
  wire   [  63:0] mo$005$in_$002;
  wire   [  63:0] mo$005$in_$003;
  wire   [  63:0] mo$005$in_$004;
  wire   [  63:0] mo$005$in_$005;
  wire   [  63:0] mo$005$in_$006;
  wire   [  63:0] mo$005$in_$007;
  wire   [   2:0] mo$005$sel;
  wire   [  63:0] mo$005$out;

  Mux_0x79e0711b59853f2c mo$005
  (
    .clk     ( mo$005$clk ),
    .reset   ( mo$005$reset ),
    .in_$000 ( mo$005$in_$000 ),
    .in_$001 ( mo$005$in_$001 ),
    .in_$002 ( mo$005$in_$002 ),
    .in_$003 ( mo$005$in_$003 ),
    .in_$004 ( mo$005$in_$004 ),
    .in_$005 ( mo$005$in_$005 ),
    .in_$006 ( mo$005$in_$006 ),
    .in_$007 ( mo$005$in_$007 ),
    .sel     ( mo$005$sel ),
    .out     ( mo$005$out )
  );

  // mo$006 temporaries
  wire   [   0:0] mo$006$clk;
  wire   [   0:0] mo$006$reset;
  wire   [  63:0] mo$006$in_$000;
  wire   [  63:0] mo$006$in_$001;
  wire   [  63:0] mo$006$in_$002;
  wire   [  63:0] mo$006$in_$003;
  wire   [  63:0] mo$006$in_$004;
  wire   [  63:0] mo$006$in_$005;
  wire   [  63:0] mo$006$in_$006;
  wire   [  63:0] mo$006$in_$007;
  wire   [   2:0] mo$006$sel;
  wire   [  63:0] mo$006$out;

  Mux_0x79e0711b59853f2c mo$006
  (
    .clk     ( mo$006$clk ),
    .reset   ( mo$006$reset ),
    .in_$000 ( mo$006$in_$000 ),
    .in_$001 ( mo$006$in_$001 ),
    .in_$002 ( mo$006$in_$002 ),
    .in_$003 ( mo$006$in_$003 ),
    .in_$004 ( mo$006$in_$004 ),
    .in_$005 ( mo$006$in_$005 ),
    .in_$006 ( mo$006$in_$006 ),
    .in_$007 ( mo$006$in_$007 ),
    .sel     ( mo$006$sel ),
    .out     ( mo$006$out )
  );

  // mo$007 temporaries
  wire   [   0:0] mo$007$clk;
  wire   [   0:0] mo$007$reset;
  wire   [  63:0] mo$007$in_$000;
  wire   [  63:0] mo$007$in_$001;
  wire   [  63:0] mo$007$in_$002;
  wire   [  63:0] mo$007$in_$003;
  wire   [  63:0] mo$007$in_$004;
  wire   [  63:0] mo$007$in_$005;
  wire   [  63:0] mo$007$in_$006;
  wire   [  63:0] mo$007$in_$007;
  wire   [   2:0] mo$007$sel;
  wire   [  63:0] mo$007$out;

  Mux_0x79e0711b59853f2c mo$007
  (
    .clk     ( mo$007$clk ),
    .reset   ( mo$007$reset ),
    .in_$000 ( mo$007$in_$000 ),
    .in_$001 ( mo$007$in_$001 ),
    .in_$002 ( mo$007$in_$002 ),
    .in_$003 ( mo$007$in_$003 ),
    .in_$004 ( mo$007$in_$004 ),
    .in_$005 ( mo$007$in_$005 ),
    .in_$006 ( mo$007$in_$006 ),
    .in_$007 ( mo$007$in_$007 ),
    .sel     ( mo$007$sel ),
    .out     ( mo$007$out )
  );

  // a$000 temporaries
  wire   [   0:0] a$000$clk;
  wire   [   0:0] a$000$reset;
  wire   [   0:0] a$000$req_in_valid$000;
  wire   [   0:0] a$000$req_in_valid$001;
  wire   [   0:0] a$000$req_in_valid$002;
  wire   [   0:0] a$000$req_in_valid$003;
  wire   [   0:0] a$000$req_in_valid$004;
  wire   [   0:0] a$000$req_in_valid$005;
  wire   [   0:0] a$000$req_in_valid$006;
  wire   [   0:0] a$000$req_in_valid$007;
  wire   [   2:0] a$000$req_in$000;
  wire   [   2:0] a$000$req_in$001;
  wire   [   2:0] a$000$req_in$002;
  wire   [   2:0] a$000$req_in$003;
  wire   [   2:0] a$000$req_in$004;
  wire   [   2:0] a$000$req_in$005;
  wire   [   2:0] a$000$req_in$006;
  wire   [   2:0] a$000$req_in$007;
  wire   [   2:0] a$000$req_out;
  wire   [   0:0] a$000$req_out_valid;

  Arbiter_0x6aac8c331cd27f88 a$000
  (
    .clk              ( a$000$clk ),
    .reset            ( a$000$reset ),
    .req_in_valid$000 ( a$000$req_in_valid$000 ),
    .req_in_valid$001 ( a$000$req_in_valid$001 ),
    .req_in_valid$002 ( a$000$req_in_valid$002 ),
    .req_in_valid$003 ( a$000$req_in_valid$003 ),
    .req_in_valid$004 ( a$000$req_in_valid$004 ),
    .req_in_valid$005 ( a$000$req_in_valid$005 ),
    .req_in_valid$006 ( a$000$req_in_valid$006 ),
    .req_in_valid$007 ( a$000$req_in_valid$007 ),
    .req_in$000       ( a$000$req_in$000 ),
    .req_in$001       ( a$000$req_in$001 ),
    .req_in$002       ( a$000$req_in$002 ),
    .req_in$003       ( a$000$req_in$003 ),
    .req_in$004       ( a$000$req_in$004 ),
    .req_in$005       ( a$000$req_in$005 ),
    .req_in$006       ( a$000$req_in$006 ),
    .req_in$007       ( a$000$req_in$007 ),
    .req_out          ( a$000$req_out ),
    .req_out_valid    ( a$000$req_out_valid )
  );

  // a$001 temporaries
  wire   [   0:0] a$001$clk;
  wire   [   0:0] a$001$reset;
  wire   [   0:0] a$001$req_in_valid$000;
  wire   [   0:0] a$001$req_in_valid$001;
  wire   [   0:0] a$001$req_in_valid$002;
  wire   [   0:0] a$001$req_in_valid$003;
  wire   [   0:0] a$001$req_in_valid$004;
  wire   [   0:0] a$001$req_in_valid$005;
  wire   [   0:0] a$001$req_in_valid$006;
  wire   [   0:0] a$001$req_in_valid$007;
  wire   [   2:0] a$001$req_in$000;
  wire   [   2:0] a$001$req_in$001;
  wire   [   2:0] a$001$req_in$002;
  wire   [   2:0] a$001$req_in$003;
  wire   [   2:0] a$001$req_in$004;
  wire   [   2:0] a$001$req_in$005;
  wire   [   2:0] a$001$req_in$006;
  wire   [   2:0] a$001$req_in$007;
  wire   [   2:0] a$001$req_out;
  wire   [   0:0] a$001$req_out_valid;

  Arbiter_0x2f427617181d43ab a$001
  (
    .clk              ( a$001$clk ),
    .reset            ( a$001$reset ),
    .req_in_valid$000 ( a$001$req_in_valid$000 ),
    .req_in_valid$001 ( a$001$req_in_valid$001 ),
    .req_in_valid$002 ( a$001$req_in_valid$002 ),
    .req_in_valid$003 ( a$001$req_in_valid$003 ),
    .req_in_valid$004 ( a$001$req_in_valid$004 ),
    .req_in_valid$005 ( a$001$req_in_valid$005 ),
    .req_in_valid$006 ( a$001$req_in_valid$006 ),
    .req_in_valid$007 ( a$001$req_in_valid$007 ),
    .req_in$000       ( a$001$req_in$000 ),
    .req_in$001       ( a$001$req_in$001 ),
    .req_in$002       ( a$001$req_in$002 ),
    .req_in$003       ( a$001$req_in$003 ),
    .req_in$004       ( a$001$req_in$004 ),
    .req_in$005       ( a$001$req_in$005 ),
    .req_in$006       ( a$001$req_in$006 ),
    .req_in$007       ( a$001$req_in$007 ),
    .req_out          ( a$001$req_out ),
    .req_out_valid    ( a$001$req_out_valid )
  );

  // a$002 temporaries
  wire   [   0:0] a$002$clk;
  wire   [   0:0] a$002$reset;
  wire   [   0:0] a$002$req_in_valid$000;
  wire   [   0:0] a$002$req_in_valid$001;
  wire   [   0:0] a$002$req_in_valid$002;
  wire   [   0:0] a$002$req_in_valid$003;
  wire   [   0:0] a$002$req_in_valid$004;
  wire   [   0:0] a$002$req_in_valid$005;
  wire   [   0:0] a$002$req_in_valid$006;
  wire   [   0:0] a$002$req_in_valid$007;
  wire   [   2:0] a$002$req_in$000;
  wire   [   2:0] a$002$req_in$001;
  wire   [   2:0] a$002$req_in$002;
  wire   [   2:0] a$002$req_in$003;
  wire   [   2:0] a$002$req_in$004;
  wire   [   2:0] a$002$req_in$005;
  wire   [   2:0] a$002$req_in$006;
  wire   [   2:0] a$002$req_in$007;
  wire   [   2:0] a$002$req_out;
  wire   [   0:0] a$002$req_out_valid;

  Arbiter_0x64c7f27e24a9d892 a$002
  (
    .clk              ( a$002$clk ),
    .reset            ( a$002$reset ),
    .req_in_valid$000 ( a$002$req_in_valid$000 ),
    .req_in_valid$001 ( a$002$req_in_valid$001 ),
    .req_in_valid$002 ( a$002$req_in_valid$002 ),
    .req_in_valid$003 ( a$002$req_in_valid$003 ),
    .req_in_valid$004 ( a$002$req_in_valid$004 ),
    .req_in_valid$005 ( a$002$req_in_valid$005 ),
    .req_in_valid$006 ( a$002$req_in_valid$006 ),
    .req_in_valid$007 ( a$002$req_in_valid$007 ),
    .req_in$000       ( a$002$req_in$000 ),
    .req_in$001       ( a$002$req_in$001 ),
    .req_in$002       ( a$002$req_in$002 ),
    .req_in$003       ( a$002$req_in$003 ),
    .req_in$004       ( a$002$req_in$004 ),
    .req_in$005       ( a$002$req_in$005 ),
    .req_in$006       ( a$002$req_in$006 ),
    .req_in$007       ( a$002$req_in$007 ),
    .req_out          ( a$002$req_out ),
    .req_out_valid    ( a$002$req_out_valid )
  );

  // a$003 temporaries
  wire   [   0:0] a$003$clk;
  wire   [   0:0] a$003$reset;
  wire   [   0:0] a$003$req_in_valid$000;
  wire   [   0:0] a$003$req_in_valid$001;
  wire   [   0:0] a$003$req_in_valid$002;
  wire   [   0:0] a$003$req_in_valid$003;
  wire   [   0:0] a$003$req_in_valid$004;
  wire   [   0:0] a$003$req_in_valid$005;
  wire   [   0:0] a$003$req_in_valid$006;
  wire   [   0:0] a$003$req_in_valid$007;
  wire   [   2:0] a$003$req_in$000;
  wire   [   2:0] a$003$req_in$001;
  wire   [   2:0] a$003$req_in$002;
  wire   [   2:0] a$003$req_in$003;
  wire   [   2:0] a$003$req_in$004;
  wire   [   2:0] a$003$req_in$005;
  wire   [   2:0] a$003$req_in$006;
  wire   [   2:0] a$003$req_in$007;
  wire   [   2:0] a$003$req_out;
  wire   [   0:0] a$003$req_out_valid;

  Arbiter_0x28aadcb983b846cd a$003
  (
    .clk              ( a$003$clk ),
    .reset            ( a$003$reset ),
    .req_in_valid$000 ( a$003$req_in_valid$000 ),
    .req_in_valid$001 ( a$003$req_in_valid$001 ),
    .req_in_valid$002 ( a$003$req_in_valid$002 ),
    .req_in_valid$003 ( a$003$req_in_valid$003 ),
    .req_in_valid$004 ( a$003$req_in_valid$004 ),
    .req_in_valid$005 ( a$003$req_in_valid$005 ),
    .req_in_valid$006 ( a$003$req_in_valid$006 ),
    .req_in_valid$007 ( a$003$req_in_valid$007 ),
    .req_in$000       ( a$003$req_in$000 ),
    .req_in$001       ( a$003$req_in$001 ),
    .req_in$002       ( a$003$req_in$002 ),
    .req_in$003       ( a$003$req_in$003 ),
    .req_in$004       ( a$003$req_in$004 ),
    .req_in$005       ( a$003$req_in$005 ),
    .req_in$006       ( a$003$req_in$006 ),
    .req_in$007       ( a$003$req_in$007 ),
    .req_out          ( a$003$req_out ),
    .req_out_valid    ( a$003$req_out_valid )
  );

  // a$004 temporaries
  wire   [   0:0] a$004$clk;
  wire   [   0:0] a$004$reset;
  wire   [   0:0] a$004$req_in_valid$000;
  wire   [   0:0] a$004$req_in_valid$001;
  wire   [   0:0] a$004$req_in_valid$002;
  wire   [   0:0] a$004$req_in_valid$003;
  wire   [   0:0] a$004$req_in_valid$004;
  wire   [   0:0] a$004$req_in_valid$005;
  wire   [   0:0] a$004$req_in_valid$006;
  wire   [   0:0] a$004$req_in_valid$007;
  wire   [   2:0] a$004$req_in$000;
  wire   [   2:0] a$004$req_in$001;
  wire   [   2:0] a$004$req_in$002;
  wire   [   2:0] a$004$req_in$003;
  wire   [   2:0] a$004$req_in$004;
  wire   [   2:0] a$004$req_in$005;
  wire   [   2:0] a$004$req_in$006;
  wire   [   2:0] a$004$req_in$007;
  wire   [   2:0] a$004$req_out;
  wire   [   0:0] a$004$req_out_valid;

  Arbiter_0x33f9fff57c7dbfdc a$004
  (
    .clk              ( a$004$clk ),
    .reset            ( a$004$reset ),
    .req_in_valid$000 ( a$004$req_in_valid$000 ),
    .req_in_valid$001 ( a$004$req_in_valid$001 ),
    .req_in_valid$002 ( a$004$req_in_valid$002 ),
    .req_in_valid$003 ( a$004$req_in_valid$003 ),
    .req_in_valid$004 ( a$004$req_in_valid$004 ),
    .req_in_valid$005 ( a$004$req_in_valid$005 ),
    .req_in_valid$006 ( a$004$req_in_valid$006 ),
    .req_in_valid$007 ( a$004$req_in_valid$007 ),
    .req_in$000       ( a$004$req_in$000 ),
    .req_in$001       ( a$004$req_in$001 ),
    .req_in$002       ( a$004$req_in$002 ),
    .req_in$003       ( a$004$req_in$003 ),
    .req_in$004       ( a$004$req_in$004 ),
    .req_in$005       ( a$004$req_in$005 ),
    .req_in$006       ( a$004$req_in$006 ),
    .req_in$007       ( a$004$req_in$007 ),
    .req_out          ( a$004$req_out ),
    .req_out_valid    ( a$004$req_out_valid )
  );

  // a$005 temporaries
  wire   [   0:0] a$005$clk;
  wire   [   0:0] a$005$reset;
  wire   [   0:0] a$005$req_in_valid$000;
  wire   [   0:0] a$005$req_in_valid$001;
  wire   [   0:0] a$005$req_in_valid$002;
  wire   [   0:0] a$005$req_in_valid$003;
  wire   [   0:0] a$005$req_in_valid$004;
  wire   [   0:0] a$005$req_in_valid$005;
  wire   [   0:0] a$005$req_in_valid$006;
  wire   [   0:0] a$005$req_in_valid$007;
  wire   [   2:0] a$005$req_in$000;
  wire   [   2:0] a$005$req_in$001;
  wire   [   2:0] a$005$req_in$002;
  wire   [   2:0] a$005$req_in$003;
  wire   [   2:0] a$005$req_in$004;
  wire   [   2:0] a$005$req_in$005;
  wire   [   2:0] a$005$req_in$006;
  wire   [   2:0] a$005$req_in$007;
  wire   [   2:0] a$005$req_out;
  wire   [   0:0] a$005$req_out_valid;

  Arbiter_0x6625ee609cb1d021 a$005
  (
    .clk              ( a$005$clk ),
    .reset            ( a$005$reset ),
    .req_in_valid$000 ( a$005$req_in_valid$000 ),
    .req_in_valid$001 ( a$005$req_in_valid$001 ),
    .req_in_valid$002 ( a$005$req_in_valid$002 ),
    .req_in_valid$003 ( a$005$req_in_valid$003 ),
    .req_in_valid$004 ( a$005$req_in_valid$004 ),
    .req_in_valid$005 ( a$005$req_in_valid$005 ),
    .req_in_valid$006 ( a$005$req_in_valid$006 ),
    .req_in_valid$007 ( a$005$req_in_valid$007 ),
    .req_in$000       ( a$005$req_in$000 ),
    .req_in$001       ( a$005$req_in$001 ),
    .req_in$002       ( a$005$req_in$002 ),
    .req_in$003       ( a$005$req_in$003 ),
    .req_in$004       ( a$005$req_in$004 ),
    .req_in$005       ( a$005$req_in$005 ),
    .req_in$006       ( a$005$req_in$006 ),
    .req_in$007       ( a$005$req_in$007 ),
    .req_out          ( a$005$req_out ),
    .req_out_valid    ( a$005$req_out_valid )
  );

  // a$006 temporaries
  wire   [   0:0] a$006$clk;
  wire   [   0:0] a$006$reset;
  wire   [   0:0] a$006$req_in_valid$000;
  wire   [   0:0] a$006$req_in_valid$001;
  wire   [   0:0] a$006$req_in_valid$002;
  wire   [   0:0] a$006$req_in_valid$003;
  wire   [   0:0] a$006$req_in_valid$004;
  wire   [   0:0] a$006$req_in_valid$005;
  wire   [   0:0] a$006$req_in_valid$006;
  wire   [   0:0] a$006$req_in_valid$007;
  wire   [   2:0] a$006$req_in$000;
  wire   [   2:0] a$006$req_in$001;
  wire   [   2:0] a$006$req_in$002;
  wire   [   2:0] a$006$req_in$003;
  wire   [   2:0] a$006$req_in$004;
  wire   [   2:0] a$006$req_in$005;
  wire   [   2:0] a$006$req_in$006;
  wire   [   2:0] a$006$req_in$007;
  wire   [   2:0] a$006$req_out;
  wire   [   0:0] a$006$req_out_valid;

  Arbiter_0x383ccc355c6165a a$006
  (
    .clk              ( a$006$clk ),
    .reset            ( a$006$reset ),
    .req_in_valid$000 ( a$006$req_in_valid$000 ),
    .req_in_valid$001 ( a$006$req_in_valid$001 ),
    .req_in_valid$002 ( a$006$req_in_valid$002 ),
    .req_in_valid$003 ( a$006$req_in_valid$003 ),
    .req_in_valid$004 ( a$006$req_in_valid$004 ),
    .req_in_valid$005 ( a$006$req_in_valid$005 ),
    .req_in_valid$006 ( a$006$req_in_valid$006 ),
    .req_in_valid$007 ( a$006$req_in_valid$007 ),
    .req_in$000       ( a$006$req_in$000 ),
    .req_in$001       ( a$006$req_in$001 ),
    .req_in$002       ( a$006$req_in$002 ),
    .req_in$003       ( a$006$req_in$003 ),
    .req_in$004       ( a$006$req_in$004 ),
    .req_in$005       ( a$006$req_in$005 ),
    .req_in$006       ( a$006$req_in$006 ),
    .req_in$007       ( a$006$req_in$007 ),
    .req_out          ( a$006$req_out ),
    .req_out_valid    ( a$006$req_out_valid )
  );

  // a$007 temporaries
  wire   [   0:0] a$007$clk;
  wire   [   0:0] a$007$reset;
  wire   [   0:0] a$007$req_in_valid$000;
  wire   [   0:0] a$007$req_in_valid$001;
  wire   [   0:0] a$007$req_in_valid$002;
  wire   [   0:0] a$007$req_in_valid$003;
  wire   [   0:0] a$007$req_in_valid$004;
  wire   [   0:0] a$007$req_in_valid$005;
  wire   [   0:0] a$007$req_in_valid$006;
  wire   [   0:0] a$007$req_in_valid$007;
  wire   [   2:0] a$007$req_in$000;
  wire   [   2:0] a$007$req_in$001;
  wire   [   2:0] a$007$req_in$002;
  wire   [   2:0] a$007$req_in$003;
  wire   [   2:0] a$007$req_in$004;
  wire   [   2:0] a$007$req_in$005;
  wire   [   2:0] a$007$req_in$006;
  wire   [   2:0] a$007$req_in$007;
  wire   [   2:0] a$007$req_out;
  wire   [   0:0] a$007$req_out_valid;

  Arbiter_0x4361cb136b2cd341 a$007
  (
    .clk              ( a$007$clk ),
    .reset            ( a$007$reset ),
    .req_in_valid$000 ( a$007$req_in_valid$000 ),
    .req_in_valid$001 ( a$007$req_in_valid$001 ),
    .req_in_valid$002 ( a$007$req_in_valid$002 ),
    .req_in_valid$003 ( a$007$req_in_valid$003 ),
    .req_in_valid$004 ( a$007$req_in_valid$004 ),
    .req_in_valid$005 ( a$007$req_in_valid$005 ),
    .req_in_valid$006 ( a$007$req_in_valid$006 ),
    .req_in_valid$007 ( a$007$req_in_valid$007 ),
    .req_in$000       ( a$007$req_in$000 ),
    .req_in$001       ( a$007$req_in$001 ),
    .req_in$002       ( a$007$req_in$002 ),
    .req_in$003       ( a$007$req_in$003 ),
    .req_in$004       ( a$007$req_in$004 ),
    .req_in$005       ( a$007$req_in$005 ),
    .req_in$006       ( a$007$req_in$006 ),
    .req_in$007       ( a$007$req_in$007 ),
    .req_out          ( a$007$req_out ),
    .req_out_valid    ( a$007$req_out_valid )
  );

  // signal connections
  assign a$000$clk              = clk;
  assign a$000$req_in$000       = xbar_req_msg$000[2:0];
  assign a$000$req_in$001       = xbar_req_msg$001[2:0];
  assign a$000$req_in$002       = xbar_req_msg$002[2:0];
  assign a$000$req_in$003       = xbar_req_msg$003[2:0];
  assign a$000$req_in$004       = xbar_req_msg$004[2:0];
  assign a$000$req_in$005       = xbar_req_msg$005[2:0];
  assign a$000$req_in$006       = xbar_req_msg$006[2:0];
  assign a$000$req_in$007       = xbar_req_msg$007[2:0];
  assign a$000$req_in_valid$000 = a_in_valid$000;
  assign a$000$req_in_valid$001 = a_in_valid$001;
  assign a$000$req_in_valid$002 = a_in_valid$002;
  assign a$000$req_in_valid$003 = a_in_valid$003;
  assign a$000$req_in_valid$004 = a_in_valid$004;
  assign a$000$req_in_valid$005 = a_in_valid$005;
  assign a$000$req_in_valid$006 = a_in_valid$006;
  assign a$000$req_in_valid$007 = a_in_valid$007;
  assign a$000$reset            = reset;
  assign a$001$clk              = clk;
  assign a$001$req_in$000       = xbar_req_msg$000[2:0];
  assign a$001$req_in$001       = xbar_req_msg$001[2:0];
  assign a$001$req_in$002       = xbar_req_msg$002[2:0];
  assign a$001$req_in$003       = xbar_req_msg$003[2:0];
  assign a$001$req_in$004       = xbar_req_msg$004[2:0];
  assign a$001$req_in$005       = xbar_req_msg$005[2:0];
  assign a$001$req_in$006       = xbar_req_msg$006[2:0];
  assign a$001$req_in$007       = xbar_req_msg$007[2:0];
  assign a$001$req_in_valid$000 = a_in_valid$008;
  assign a$001$req_in_valid$001 = a_in_valid$009;
  assign a$001$req_in_valid$002 = a_in_valid$010;
  assign a$001$req_in_valid$003 = a_in_valid$011;
  assign a$001$req_in_valid$004 = a_in_valid$012;
  assign a$001$req_in_valid$005 = a_in_valid$013;
  assign a$001$req_in_valid$006 = a_in_valid$014;
  assign a$001$req_in_valid$007 = a_in_valid$015;
  assign a$001$reset            = reset;
  assign a$002$clk              = clk;
  assign a$002$req_in$000       = xbar_req_msg$000[2:0];
  assign a$002$req_in$001       = xbar_req_msg$001[2:0];
  assign a$002$req_in$002       = xbar_req_msg$002[2:0];
  assign a$002$req_in$003       = xbar_req_msg$003[2:0];
  assign a$002$req_in$004       = xbar_req_msg$004[2:0];
  assign a$002$req_in$005       = xbar_req_msg$005[2:0];
  assign a$002$req_in$006       = xbar_req_msg$006[2:0];
  assign a$002$req_in$007       = xbar_req_msg$007[2:0];
  assign a$002$req_in_valid$000 = a_in_valid$016;
  assign a$002$req_in_valid$001 = a_in_valid$017;
  assign a$002$req_in_valid$002 = a_in_valid$018;
  assign a$002$req_in_valid$003 = a_in_valid$019;
  assign a$002$req_in_valid$004 = a_in_valid$020;
  assign a$002$req_in_valid$005 = a_in_valid$021;
  assign a$002$req_in_valid$006 = a_in_valid$022;
  assign a$002$req_in_valid$007 = a_in_valid$023;
  assign a$002$reset            = reset;
  assign a$003$clk              = clk;
  assign a$003$req_in$000       = xbar_req_msg$000[2:0];
  assign a$003$req_in$001       = xbar_req_msg$001[2:0];
  assign a$003$req_in$002       = xbar_req_msg$002[2:0];
  assign a$003$req_in$003       = xbar_req_msg$003[2:0];
  assign a$003$req_in$004       = xbar_req_msg$004[2:0];
  assign a$003$req_in$005       = xbar_req_msg$005[2:0];
  assign a$003$req_in$006       = xbar_req_msg$006[2:0];
  assign a$003$req_in$007       = xbar_req_msg$007[2:0];
  assign a$003$req_in_valid$000 = a_in_valid$024;
  assign a$003$req_in_valid$001 = a_in_valid$025;
  assign a$003$req_in_valid$002 = a_in_valid$026;
  assign a$003$req_in_valid$003 = a_in_valid$027;
  assign a$003$req_in_valid$004 = a_in_valid$028;
  assign a$003$req_in_valid$005 = a_in_valid$029;
  assign a$003$req_in_valid$006 = a_in_valid$030;
  assign a$003$req_in_valid$007 = a_in_valid$031;
  assign a$003$reset            = reset;
  assign a$004$clk              = clk;
  assign a$004$req_in$000       = xbar_req_msg$000[2:0];
  assign a$004$req_in$001       = xbar_req_msg$001[2:0];
  assign a$004$req_in$002       = xbar_req_msg$002[2:0];
  assign a$004$req_in$003       = xbar_req_msg$003[2:0];
  assign a$004$req_in$004       = xbar_req_msg$004[2:0];
  assign a$004$req_in$005       = xbar_req_msg$005[2:0];
  assign a$004$req_in$006       = xbar_req_msg$006[2:0];
  assign a$004$req_in$007       = xbar_req_msg$007[2:0];
  assign a$004$req_in_valid$000 = a_in_valid$032;
  assign a$004$req_in_valid$001 = a_in_valid$033;
  assign a$004$req_in_valid$002 = a_in_valid$034;
  assign a$004$req_in_valid$003 = a_in_valid$035;
  assign a$004$req_in_valid$004 = a_in_valid$036;
  assign a$004$req_in_valid$005 = a_in_valid$037;
  assign a$004$req_in_valid$006 = a_in_valid$038;
  assign a$004$req_in_valid$007 = a_in_valid$039;
  assign a$004$reset            = reset;
  assign a$005$clk              = clk;
  assign a$005$req_in$000       = xbar_req_msg$000[2:0];
  assign a$005$req_in$001       = xbar_req_msg$001[2:0];
  assign a$005$req_in$002       = xbar_req_msg$002[2:0];
  assign a$005$req_in$003       = xbar_req_msg$003[2:0];
  assign a$005$req_in$004       = xbar_req_msg$004[2:0];
  assign a$005$req_in$005       = xbar_req_msg$005[2:0];
  assign a$005$req_in$006       = xbar_req_msg$006[2:0];
  assign a$005$req_in$007       = xbar_req_msg$007[2:0];
  assign a$005$req_in_valid$000 = a_in_valid$040;
  assign a$005$req_in_valid$001 = a_in_valid$041;
  assign a$005$req_in_valid$002 = a_in_valid$042;
  assign a$005$req_in_valid$003 = a_in_valid$043;
  assign a$005$req_in_valid$004 = a_in_valid$044;
  assign a$005$req_in_valid$005 = a_in_valid$045;
  assign a$005$req_in_valid$006 = a_in_valid$046;
  assign a$005$req_in_valid$007 = a_in_valid$047;
  assign a$005$reset            = reset;
  assign a$006$clk              = clk;
  assign a$006$req_in$000       = xbar_req_msg$000[2:0];
  assign a$006$req_in$001       = xbar_req_msg$001[2:0];
  assign a$006$req_in$002       = xbar_req_msg$002[2:0];
  assign a$006$req_in$003       = xbar_req_msg$003[2:0];
  assign a$006$req_in$004       = xbar_req_msg$004[2:0];
  assign a$006$req_in$005       = xbar_req_msg$005[2:0];
  assign a$006$req_in$006       = xbar_req_msg$006[2:0];
  assign a$006$req_in$007       = xbar_req_msg$007[2:0];
  assign a$006$req_in_valid$000 = a_in_valid$048;
  assign a$006$req_in_valid$001 = a_in_valid$049;
  assign a$006$req_in_valid$002 = a_in_valid$050;
  assign a$006$req_in_valid$003 = a_in_valid$051;
  assign a$006$req_in_valid$004 = a_in_valid$052;
  assign a$006$req_in_valid$005 = a_in_valid$053;
  assign a$006$req_in_valid$006 = a_in_valid$054;
  assign a$006$req_in_valid$007 = a_in_valid$055;
  assign a$006$reset            = reset;
  assign a$007$clk              = clk;
  assign a$007$req_in$000       = xbar_req_msg$000[2:0];
  assign a$007$req_in$001       = xbar_req_msg$001[2:0];
  assign a$007$req_in$002       = xbar_req_msg$002[2:0];
  assign a$007$req_in$003       = xbar_req_msg$003[2:0];
  assign a$007$req_in$004       = xbar_req_msg$004[2:0];
  assign a$007$req_in$005       = xbar_req_msg$005[2:0];
  assign a$007$req_in$006       = xbar_req_msg$006[2:0];
  assign a$007$req_in$007       = xbar_req_msg$007[2:0];
  assign a$007$req_in_valid$000 = a_in_valid$056;
  assign a$007$req_in_valid$001 = a_in_valid$057;
  assign a$007$req_in_valid$002 = a_in_valid$058;
  assign a$007$req_in_valid$003 = a_in_valid$059;
  assign a$007$req_in_valid$004 = a_in_valid$060;
  assign a$007$req_in_valid$005 = a_in_valid$061;
  assign a$007$req_in_valid$006 = a_in_valid$062;
  assign a$007$req_in_valid$007 = a_in_valid$063;
  assign a$007$reset            = reset;
  assign a_out$000              = a$000$req_out;
  assign a_out$001              = a$001$req_out;
  assign a_out$002              = a$002$req_out;
  assign a_out$003              = a$003$req_out;
  assign a_out$004              = a$004$req_out;
  assign a_out$005              = a$005$req_out;
  assign a_out$006              = a$006$req_out;
  assign a_out$007              = a$007$req_out;
  assign a_out_valid$000        = a$000$req_out_valid;
  assign a_out_valid$001        = a$001$req_out_valid;
  assign a_out_valid$002        = a$002$req_out_valid;
  assign a_out_valid$003        = a$003$req_out_valid;
  assign a_out_valid$004        = a$004$req_out_valid;
  assign a_out_valid$005        = a$005$req_out_valid;
  assign a_out_valid$006        = a$006$req_out_valid;
  assign a_out_valid$007        = a$007$req_out_valid;
  assign bank_req_msg$000       = mi$000$out;
  assign bank_req_msg$001       = mi$001$out;
  assign bank_req_msg$002       = mi$002$out;
  assign bank_req_msg$003       = mi$003$out;
  assign bank_req_msg$004       = mi$004$out;
  assign bank_req_msg$005       = mi$005$out;
  assign bank_req_msg$006       = mi$006$out;
  assign bank_req_msg$007       = mi$007$out;
  assign mi$000$clk             = clk;
  assign mi$000$in_$000         = xbar_req_msg$000;
  assign mi$000$in_$001         = xbar_req_msg$001;
  assign mi$000$in_$002         = xbar_req_msg$002;
  assign mi$000$in_$003         = xbar_req_msg$003;
  assign mi$000$in_$004         = xbar_req_msg$004;
  assign mi$000$in_$005         = xbar_req_msg$005;
  assign mi$000$in_$006         = xbar_req_msg$006;
  assign mi$000$in_$007         = xbar_req_msg$007;
  assign mi$000$reset           = reset;
  assign mi$000$sel             = mi_select$000;
  assign mi$001$clk             = clk;
  assign mi$001$in_$000         = xbar_req_msg$000;
  assign mi$001$in_$001         = xbar_req_msg$001;
  assign mi$001$in_$002         = xbar_req_msg$002;
  assign mi$001$in_$003         = xbar_req_msg$003;
  assign mi$001$in_$004         = xbar_req_msg$004;
  assign mi$001$in_$005         = xbar_req_msg$005;
  assign mi$001$in_$006         = xbar_req_msg$006;
  assign mi$001$in_$007         = xbar_req_msg$007;
  assign mi$001$reset           = reset;
  assign mi$001$sel             = mi_select$001;
  assign mi$002$clk             = clk;
  assign mi$002$in_$000         = xbar_req_msg$000;
  assign mi$002$in_$001         = xbar_req_msg$001;
  assign mi$002$in_$002         = xbar_req_msg$002;
  assign mi$002$in_$003         = xbar_req_msg$003;
  assign mi$002$in_$004         = xbar_req_msg$004;
  assign mi$002$in_$005         = xbar_req_msg$005;
  assign mi$002$in_$006         = xbar_req_msg$006;
  assign mi$002$in_$007         = xbar_req_msg$007;
  assign mi$002$reset           = reset;
  assign mi$002$sel             = mi_select$002;
  assign mi$003$clk             = clk;
  assign mi$003$in_$000         = xbar_req_msg$000;
  assign mi$003$in_$001         = xbar_req_msg$001;
  assign mi$003$in_$002         = xbar_req_msg$002;
  assign mi$003$in_$003         = xbar_req_msg$003;
  assign mi$003$in_$004         = xbar_req_msg$004;
  assign mi$003$in_$005         = xbar_req_msg$005;
  assign mi$003$in_$006         = xbar_req_msg$006;
  assign mi$003$in_$007         = xbar_req_msg$007;
  assign mi$003$reset           = reset;
  assign mi$003$sel             = mi_select$003;
  assign mi$004$clk             = clk;
  assign mi$004$in_$000         = xbar_req_msg$000;
  assign mi$004$in_$001         = xbar_req_msg$001;
  assign mi$004$in_$002         = xbar_req_msg$002;
  assign mi$004$in_$003         = xbar_req_msg$003;
  assign mi$004$in_$004         = xbar_req_msg$004;
  assign mi$004$in_$005         = xbar_req_msg$005;
  assign mi$004$in_$006         = xbar_req_msg$006;
  assign mi$004$in_$007         = xbar_req_msg$007;
  assign mi$004$reset           = reset;
  assign mi$004$sel             = mi_select$004;
  assign mi$005$clk             = clk;
  assign mi$005$in_$000         = xbar_req_msg$000;
  assign mi$005$in_$001         = xbar_req_msg$001;
  assign mi$005$in_$002         = xbar_req_msg$002;
  assign mi$005$in_$003         = xbar_req_msg$003;
  assign mi$005$in_$004         = xbar_req_msg$004;
  assign mi$005$in_$005         = xbar_req_msg$005;
  assign mi$005$in_$006         = xbar_req_msg$006;
  assign mi$005$in_$007         = xbar_req_msg$007;
  assign mi$005$reset           = reset;
  assign mi$005$sel             = mi_select$005;
  assign mi$006$clk             = clk;
  assign mi$006$in_$000         = xbar_req_msg$000;
  assign mi$006$in_$001         = xbar_req_msg$001;
  assign mi$006$in_$002         = xbar_req_msg$002;
  assign mi$006$in_$003         = xbar_req_msg$003;
  assign mi$006$in_$004         = xbar_req_msg$004;
  assign mi$006$in_$005         = xbar_req_msg$005;
  assign mi$006$in_$006         = xbar_req_msg$006;
  assign mi$006$in_$007         = xbar_req_msg$007;
  assign mi$006$reset           = reset;
  assign mi$006$sel             = mi_select$006;
  assign mi$007$clk             = clk;
  assign mi$007$in_$000         = xbar_req_msg$000;
  assign mi$007$in_$001         = xbar_req_msg$001;
  assign mi$007$in_$002         = xbar_req_msg$002;
  assign mi$007$in_$003         = xbar_req_msg$003;
  assign mi$007$in_$004         = xbar_req_msg$004;
  assign mi$007$in_$005         = xbar_req_msg$005;
  assign mi$007$in_$006         = xbar_req_msg$006;
  assign mi$007$in_$007         = xbar_req_msg$007;
  assign mi$007$reset           = reset;
  assign mi$007$sel             = mi_select$007;
  assign mo$000$clk             = clk;
  assign mo$000$in_$000         = bank_resp_msg$000;
  assign mo$000$in_$001         = bank_resp_msg$001;
  assign mo$000$in_$002         = bank_resp_msg$002;
  assign mo$000$in_$003         = bank_resp_msg$003;
  assign mo$000$in_$004         = bank_resp_msg$004;
  assign mo$000$in_$005         = bank_resp_msg$005;
  assign mo$000$in_$006         = bank_resp_msg$006;
  assign mo$000$in_$007         = bank_resp_msg$007;
  assign mo$000$reset           = reset;
  assign mo$000$sel             = mo_select$000;
  assign mo$001$clk             = clk;
  assign mo$001$in_$000         = bank_resp_msg$000;
  assign mo$001$in_$001         = bank_resp_msg$001;
  assign mo$001$in_$002         = bank_resp_msg$002;
  assign mo$001$in_$003         = bank_resp_msg$003;
  assign mo$001$in_$004         = bank_resp_msg$004;
  assign mo$001$in_$005         = bank_resp_msg$005;
  assign mo$001$in_$006         = bank_resp_msg$006;
  assign mo$001$in_$007         = bank_resp_msg$007;
  assign mo$001$reset           = reset;
  assign mo$001$sel             = mo_select$001;
  assign mo$002$clk             = clk;
  assign mo$002$in_$000         = bank_resp_msg$000;
  assign mo$002$in_$001         = bank_resp_msg$001;
  assign mo$002$in_$002         = bank_resp_msg$002;
  assign mo$002$in_$003         = bank_resp_msg$003;
  assign mo$002$in_$004         = bank_resp_msg$004;
  assign mo$002$in_$005         = bank_resp_msg$005;
  assign mo$002$in_$006         = bank_resp_msg$006;
  assign mo$002$in_$007         = bank_resp_msg$007;
  assign mo$002$reset           = reset;
  assign mo$002$sel             = mo_select$002;
  assign mo$003$clk             = clk;
  assign mo$003$in_$000         = bank_resp_msg$000;
  assign mo$003$in_$001         = bank_resp_msg$001;
  assign mo$003$in_$002         = bank_resp_msg$002;
  assign mo$003$in_$003         = bank_resp_msg$003;
  assign mo$003$in_$004         = bank_resp_msg$004;
  assign mo$003$in_$005         = bank_resp_msg$005;
  assign mo$003$in_$006         = bank_resp_msg$006;
  assign mo$003$in_$007         = bank_resp_msg$007;
  assign mo$003$reset           = reset;
  assign mo$003$sel             = mo_select$003;
  assign mo$004$clk             = clk;
  assign mo$004$in_$000         = bank_resp_msg$000;
  assign mo$004$in_$001         = bank_resp_msg$001;
  assign mo$004$in_$002         = bank_resp_msg$002;
  assign mo$004$in_$003         = bank_resp_msg$003;
  assign mo$004$in_$004         = bank_resp_msg$004;
  assign mo$004$in_$005         = bank_resp_msg$005;
  assign mo$004$in_$006         = bank_resp_msg$006;
  assign mo$004$in_$007         = bank_resp_msg$007;
  assign mo$004$reset           = reset;
  assign mo$004$sel             = mo_select$004;
  assign mo$005$clk             = clk;
  assign mo$005$in_$000         = bank_resp_msg$000;
  assign mo$005$in_$001         = bank_resp_msg$001;
  assign mo$005$in_$002         = bank_resp_msg$002;
  assign mo$005$in_$003         = bank_resp_msg$003;
  assign mo$005$in_$004         = bank_resp_msg$004;
  assign mo$005$in_$005         = bank_resp_msg$005;
  assign mo$005$in_$006         = bank_resp_msg$006;
  assign mo$005$in_$007         = bank_resp_msg$007;
  assign mo$005$reset           = reset;
  assign mo$005$sel             = mo_select$005;
  assign mo$006$clk             = clk;
  assign mo$006$in_$000         = bank_resp_msg$000;
  assign mo$006$in_$001         = bank_resp_msg$001;
  assign mo$006$in_$002         = bank_resp_msg$002;
  assign mo$006$in_$003         = bank_resp_msg$003;
  assign mo$006$in_$004         = bank_resp_msg$004;
  assign mo$006$in_$005         = bank_resp_msg$005;
  assign mo$006$in_$006         = bank_resp_msg$006;
  assign mo$006$in_$007         = bank_resp_msg$007;
  assign mo$006$reset           = reset;
  assign mo$006$sel             = mo_select$006;
  assign mo$007$clk             = clk;
  assign mo$007$in_$000         = bank_resp_msg$000;
  assign mo$007$in_$001         = bank_resp_msg$001;
  assign mo$007$in_$002         = bank_resp_msg$002;
  assign mo$007$in_$003         = bank_resp_msg$003;
  assign mo$007$in_$004         = bank_resp_msg$004;
  assign mo$007$in_$005         = bank_resp_msg$005;
  assign mo$007$in_$006         = bank_resp_msg$006;
  assign mo$007$in_$007         = bank_resp_msg$007;
  assign mo$007$reset           = reset;
  assign mo$007$sel             = mo_select$007;


  assign xbar_resp_msg$000      = mo$000$out;
  assign xbar_resp_msg$001      = mo$001$out;
  assign xbar_resp_msg$002      = mo$002$out;
  assign xbar_resp_msg$003      = mo$003$out;
  assign xbar_resp_msg$004      = mo$004$out;
  assign xbar_resp_msg$005      = mo$005$out;
  assign xbar_resp_msg$006      = mo$006$out;
  assign xbar_resp_msg$007      = mo$007$out;



endmodule // Datapath_0x17612b122a0ef6cb
`default_nettype wire

//-----------------------------------------------------------------------------
// Mux_0x4144ab3fc21c61c3
//-----------------------------------------------------------------------------
// PyMTL: dump_vcd = False
// PyMTL: pclib.rtl.Mux {"dtype": 32, "nports": 8}
// PyMTL: verilator_xinit = zeros
`default_nettype none
module Mux_0x4144ab3fc21c61c3
(
  input  wire [   0:0] clk,
  input  wire [  31:0] in_$000,
  input  wire [  31:0] in_$001,
  input  wire [  31:0] in_$002,
  input  wire [  31:0] in_$003,
  input  wire [  31:0] in_$004,
  input  wire [  31:0] in_$005,
  input  wire [  31:0] in_$006,
  input  wire [  31:0] in_$007,
  output reg  [  31:0] out,
  input  wire [   0:0] reset,
  input  wire [   2:0] sel
);

  // localparam declarations
  localparam nports = 8;


  // array declarations
  wire   [  31:0] in_[0:7];
  assign in_[  0] = in_$000;
  assign in_[  1] = in_$001;
  assign in_[  2] = in_$002;
  assign in_[  3] = in_$003;
  assign in_[  4] = in_$004;
  assign in_[  5] = in_$005;
  assign in_[  6] = in_$006;
  assign in_[  7] = in_$007;

  // PYMTL SOURCE:
  //
  // @s.combinational
  // def comb_logic():
  //       assert s.sel < nports
  //       s.out.v = s.in_[ s.sel ]

  // logic for comb_logic()
  always @ (*) begin
    out = in_[sel];
  end


endmodule // Mux_0x4144ab3fc21c61c3
`default_nettype wire

//-----------------------------------------------------------------------------
// Mux_0x79e0711b59853f2c
//-----------------------------------------------------------------------------
// PyMTL: dump_vcd = False
// PyMTL: pclib.rtl.Mux {"dtype": 64, "nports": 8}
// PyMTL: verilator_xinit = zeros
`default_nettype none
module Mux_0x79e0711b59853f2c
(
  input  wire [   0:0] clk,
  input  wire [  63:0] in_$000,
  input  wire [  63:0] in_$001,
  input  wire [  63:0] in_$002,
  input  wire [  63:0] in_$003,
  input  wire [  63:0] in_$004,
  input  wire [  63:0] in_$005,
  input  wire [  63:0] in_$006,
  input  wire [  63:0] in_$007,
  output reg  [  63:0] out,
  input  wire [   0:0] reset,
  input  wire [   2:0] sel
);

  // localparam declarations
  localparam nports = 8;


  // array declarations
  wire   [  63:0] in_[0:7];
  assign in_[  0] = in_$000;
  assign in_[  1] = in_$001;
  assign in_[  2] = in_$002;
  assign in_[  3] = in_$003;
  assign in_[  4] = in_$004;
  assign in_[  5] = in_$005;
  assign in_[  6] = in_$006;
  assign in_[  7] = in_$007;

  // PYMTL SOURCE:
  //
  // @s.combinational
  // def comb_logic():
  //       assert s.sel < nports
  //       s.out.v = s.in_[ s.sel ]

  // logic for comb_logic()
  always @ (*) begin
    out = in_[sel];
  end


endmodule // Mux_0x79e0711b59853f2c
`default_nettype wire

//-----------------------------------------------------------------------------
// Arbiter_0x6aac8c331cd27f88
//-----------------------------------------------------------------------------
// PyMTL: dump_vcd = False
// PyMTL: xbar.Arbiter {"id": 0, "nports": 8}
// PyMTL: verilator_xinit = zeros
`default_nettype none
module Arbiter_0x6aac8c331cd27f88
(
  input  wire [   0:0] clk,
  input  wire [   2:0] req_in$000,
  input  wire [   2:0] req_in$001,
  input  wire [   2:0] req_in$002,
  input  wire [   2:0] req_in$003,
  input  wire [   2:0] req_in$004,
  input  wire [   2:0] req_in$005,
  input  wire [   2:0] req_in$006,
  input  wire [   2:0] req_in$007,
  input  wire [   0:0] req_in_valid$000,
  input  wire [   0:0] req_in_valid$001,
  input  wire [   0:0] req_in_valid$002,
  input  wire [   0:0] req_in_valid$003,
  input  wire [   0:0] req_in_valid$004,
  input  wire [   0:0] req_in_valid$005,
  input  wire [   0:0] req_in_valid$006,
  input  wire [   0:0] req_in_valid$007,
  output reg  [   2:0] req_out,
  output reg  [   0:0] req_out_valid,
  input  wire [   0:0] reset
);

  // register declarations
  reg    [   7:0] req_out_valid_tmp;

  // localparam declarations
  localparam id = 0;
  localparam nports = 8;

  // loop variable declarations
  integer i;


  // array declarations
  wire   [   2:0] req_in[0:7];
  assign req_in[  0] = req_in$000;
  assign req_in[  1] = req_in$001;
  assign req_in[  2] = req_in$002;
  assign req_in[  3] = req_in$003;
  assign req_in[  4] = req_in$004;
  assign req_in[  5] = req_in$005;
  assign req_in[  6] = req_in$006;
  assign req_in[  7] = req_in$007;
  wire   [   0:0] req_in_valid[0:7];
  assign req_in_valid[  0] = req_in_valid$000;
  assign req_in_valid[  1] = req_in_valid$001;
  assign req_in_valid[  2] = req_in_valid$002;
  assign req_in_valid[  3] = req_in_valid$003;
  assign req_in_valid[  4] = req_in_valid$004;
  assign req_in_valid[  5] = req_in_valid$005;
  assign req_in_valid[  6] = req_in_valid$006;
  assign req_in_valid[  7] = req_in_valid$007;

  // PYMTL SOURCE:
  //
  // @s.combinational
  // def arbiter_logic():
  //       s.req_out.value = 0
  //       s.req_out_valid_tmp.value = 0
  //       
  //       for i in range(nports):
  //         if s.req_in[i] == id and s.req_in_valid[i] == 1: 
  //           s.req_out.value = i
  //           s.req_out_valid_tmp[i].value = 1 
  //       
  //       s.req_out_valid.value = reduce_or(s.req_out_valid_tmp) 

  // logic for arbiter_logic()
  always @ (*) begin
    req_out = 0;
    req_out_valid_tmp = 0;
    for (i=0; i < nports; i=i+1)
    begin
      if (((req_in[i] == id)&&(req_in_valid[i] == 1))) begin
        req_out = i;
        req_out_valid_tmp[i] = 1;
      end
      else begin
      end
    end
    req_out_valid = (|req_out_valid_tmp);
  end


endmodule // Arbiter_0x6aac8c331cd27f88
`default_nettype wire

//-----------------------------------------------------------------------------
// Arbiter_0x2f427617181d43ab
//-----------------------------------------------------------------------------
// PyMTL: dump_vcd = False
// PyMTL: xbar.Arbiter {"id": 1, "nports": 8}
// PyMTL: verilator_xinit = zeros
`default_nettype none
module Arbiter_0x2f427617181d43ab
(
  input  wire [   0:0] clk,
  input  wire [   2:0] req_in$000,
  input  wire [   2:0] req_in$001,
  input  wire [   2:0] req_in$002,
  input  wire [   2:0] req_in$003,
  input  wire [   2:0] req_in$004,
  input  wire [   2:0] req_in$005,
  input  wire [   2:0] req_in$006,
  input  wire [   2:0] req_in$007,
  input  wire [   0:0] req_in_valid$000,
  input  wire [   0:0] req_in_valid$001,
  input  wire [   0:0] req_in_valid$002,
  input  wire [   0:0] req_in_valid$003,
  input  wire [   0:0] req_in_valid$004,
  input  wire [   0:0] req_in_valid$005,
  input  wire [   0:0] req_in_valid$006,
  input  wire [   0:0] req_in_valid$007,
  output reg  [   2:0] req_out,
  output reg  [   0:0] req_out_valid,
  input  wire [   0:0] reset
);

  // register declarations
  reg    [   7:0] req_out_valid_tmp;

  // localparam declarations
  localparam id = 1;
  localparam nports = 8;

  // loop variable declarations
  integer i;


  // array declarations
  wire   [   2:0] req_in[0:7];
  assign req_in[  0] = req_in$000;
  assign req_in[  1] = req_in$001;
  assign req_in[  2] = req_in$002;
  assign req_in[  3] = req_in$003;
  assign req_in[  4] = req_in$004;
  assign req_in[  5] = req_in$005;
  assign req_in[  6] = req_in$006;
  assign req_in[  7] = req_in$007;
  wire   [   0:0] req_in_valid[0:7];
  assign req_in_valid[  0] = req_in_valid$000;
  assign req_in_valid[  1] = req_in_valid$001;
  assign req_in_valid[  2] = req_in_valid$002;
  assign req_in_valid[  3] = req_in_valid$003;
  assign req_in_valid[  4] = req_in_valid$004;
  assign req_in_valid[  5] = req_in_valid$005;
  assign req_in_valid[  6] = req_in_valid$006;
  assign req_in_valid[  7] = req_in_valid$007;

  // PYMTL SOURCE:
  //
  // @s.combinational
  // def arbiter_logic():
  //       s.req_out.value = 0
  //       s.req_out_valid_tmp.value = 0
  //       
  //       for i in range(nports):
  //         if s.req_in[i] == id and s.req_in_valid[i] == 1: 
  //           s.req_out.value = i
  //           s.req_out_valid_tmp[i].value = 1 
  //       
  //       s.req_out_valid.value = reduce_or(s.req_out_valid_tmp) 

  // logic for arbiter_logic()
  always @ (*) begin
    req_out = 0;
    req_out_valid_tmp = 0;
    for (i=0; i < nports; i=i+1)
    begin
      if (((req_in[i] == id)&&(req_in_valid[i] == 1))) begin
        req_out = i;
        req_out_valid_tmp[i] = 1;
      end
      else begin
      end
    end
    req_out_valid = (|req_out_valid_tmp);
  end


endmodule // Arbiter_0x2f427617181d43ab
`default_nettype wire

//-----------------------------------------------------------------------------
// Arbiter_0x64c7f27e24a9d892
//-----------------------------------------------------------------------------
// PyMTL: dump_vcd = False
// PyMTL: xbar.Arbiter {"id": 2, "nports": 8}
// PyMTL: verilator_xinit = zeros
`default_nettype none
module Arbiter_0x64c7f27e24a9d892
(
  input  wire [   0:0] clk,
  input  wire [   2:0] req_in$000,
  input  wire [   2:0] req_in$001,
  input  wire [   2:0] req_in$002,
  input  wire [   2:0] req_in$003,
  input  wire [   2:0] req_in$004,
  input  wire [   2:0] req_in$005,
  input  wire [   2:0] req_in$006,
  input  wire [   2:0] req_in$007,
  input  wire [   0:0] req_in_valid$000,
  input  wire [   0:0] req_in_valid$001,
  input  wire [   0:0] req_in_valid$002,
  input  wire [   0:0] req_in_valid$003,
  input  wire [   0:0] req_in_valid$004,
  input  wire [   0:0] req_in_valid$005,
  input  wire [   0:0] req_in_valid$006,
  input  wire [   0:0] req_in_valid$007,
  output reg  [   2:0] req_out,
  output reg  [   0:0] req_out_valid,
  input  wire [   0:0] reset
);

  // register declarations
  reg    [   7:0] req_out_valid_tmp;

  // localparam declarations
  localparam id = 2;
  localparam nports = 8;

  // loop variable declarations
  integer i;


  // array declarations
  wire   [   2:0] req_in[0:7];
  assign req_in[  0] = req_in$000;
  assign req_in[  1] = req_in$001;
  assign req_in[  2] = req_in$002;
  assign req_in[  3] = req_in$003;
  assign req_in[  4] = req_in$004;
  assign req_in[  5] = req_in$005;
  assign req_in[  6] = req_in$006;
  assign req_in[  7] = req_in$007;
  wire   [   0:0] req_in_valid[0:7];
  assign req_in_valid[  0] = req_in_valid$000;
  assign req_in_valid[  1] = req_in_valid$001;
  assign req_in_valid[  2] = req_in_valid$002;
  assign req_in_valid[  3] = req_in_valid$003;
  assign req_in_valid[  4] = req_in_valid$004;
  assign req_in_valid[  5] = req_in_valid$005;
  assign req_in_valid[  6] = req_in_valid$006;
  assign req_in_valid[  7] = req_in_valid$007;

  // PYMTL SOURCE:
  //
  // @s.combinational
  // def arbiter_logic():
  //       s.req_out.value = 0
  //       s.req_out_valid_tmp.value = 0
  //       
  //       for i in range(nports):
  //         if s.req_in[i] == id and s.req_in_valid[i] == 1: 
  //           s.req_out.value = i
  //           s.req_out_valid_tmp[i].value = 1 
  //       
  //       s.req_out_valid.value = reduce_or(s.req_out_valid_tmp) 

  // logic for arbiter_logic()
  always @ (*) begin
    req_out = 0;
    req_out_valid_tmp = 0;
    for (i=0; i < nports; i=i+1)
    begin
      if (((req_in[i] == id)&&(req_in_valid[i] == 1))) begin
        req_out = i;
        req_out_valid_tmp[i] = 1;
      end
      else begin
      end
    end
    req_out_valid = (|req_out_valid_tmp);
  end


endmodule // Arbiter_0x64c7f27e24a9d892
`default_nettype wire

//-----------------------------------------------------------------------------
// Arbiter_0x28aadcb983b846cd
//-----------------------------------------------------------------------------
// PyMTL: dump_vcd = False
// PyMTL: xbar.Arbiter {"id": 3, "nports": 8}
// PyMTL: verilator_xinit = zeros
`default_nettype none
module Arbiter_0x28aadcb983b846cd
(
  input  wire [   0:0] clk,
  input  wire [   2:0] req_in$000,
  input  wire [   2:0] req_in$001,
  input  wire [   2:0] req_in$002,
  input  wire [   2:0] req_in$003,
  input  wire [   2:0] req_in$004,
  input  wire [   2:0] req_in$005,
  input  wire [   2:0] req_in$006,
  input  wire [   2:0] req_in$007,
  input  wire [   0:0] req_in_valid$000,
  input  wire [   0:0] req_in_valid$001,
  input  wire [   0:0] req_in_valid$002,
  input  wire [   0:0] req_in_valid$003,
  input  wire [   0:0] req_in_valid$004,
  input  wire [   0:0] req_in_valid$005,
  input  wire [   0:0] req_in_valid$006,
  input  wire [   0:0] req_in_valid$007,
  output reg  [   2:0] req_out,
  output reg  [   0:0] req_out_valid,
  input  wire [   0:0] reset
);

  // register declarations
  reg    [   7:0] req_out_valid_tmp;

  // localparam declarations
  localparam id = 3;
  localparam nports = 8;

  // loop variable declarations
  integer i;


  // array declarations
  wire   [   2:0] req_in[0:7];
  assign req_in[  0] = req_in$000;
  assign req_in[  1] = req_in$001;
  assign req_in[  2] = req_in$002;
  assign req_in[  3] = req_in$003;
  assign req_in[  4] = req_in$004;
  assign req_in[  5] = req_in$005;
  assign req_in[  6] = req_in$006;
  assign req_in[  7] = req_in$007;
  wire   [   0:0] req_in_valid[0:7];
  assign req_in_valid[  0] = req_in_valid$000;
  assign req_in_valid[  1] = req_in_valid$001;
  assign req_in_valid[  2] = req_in_valid$002;
  assign req_in_valid[  3] = req_in_valid$003;
  assign req_in_valid[  4] = req_in_valid$004;
  assign req_in_valid[  5] = req_in_valid$005;
  assign req_in_valid[  6] = req_in_valid$006;
  assign req_in_valid[  7] = req_in_valid$007;

  // PYMTL SOURCE:
  //
  // @s.combinational
  // def arbiter_logic():
  //       s.req_out.value = 0
  //       s.req_out_valid_tmp.value = 0
  //       
  //       for i in range(nports):
  //         if s.req_in[i] == id and s.req_in_valid[i] == 1: 
  //           s.req_out.value = i
  //           s.req_out_valid_tmp[i].value = 1 
  //       
  //       s.req_out_valid.value = reduce_or(s.req_out_valid_tmp) 

  // logic for arbiter_logic()
  always @ (*) begin
    req_out = 0;
    req_out_valid_tmp = 0;
    for (i=0; i < nports; i=i+1)
    begin
      if (((req_in[i] == id)&&(req_in_valid[i] == 1))) begin
        req_out = i;
        req_out_valid_tmp[i] = 1;
      end
      else begin
      end
    end
    req_out_valid = (|req_out_valid_tmp);
  end


endmodule // Arbiter_0x28aadcb983b846cd
`default_nettype wire

//-----------------------------------------------------------------------------
// Arbiter_0x33f9fff57c7dbfdc
//-----------------------------------------------------------------------------
// PyMTL: dump_vcd = False
// PyMTL: xbar.Arbiter {"id": 4, "nports": 8}
// PyMTL: verilator_xinit = zeros
`default_nettype none
module Arbiter_0x33f9fff57c7dbfdc
(
  input  wire [   0:0] clk,
  input  wire [   2:0] req_in$000,
  input  wire [   2:0] req_in$001,
  input  wire [   2:0] req_in$002,
  input  wire [   2:0] req_in$003,
  input  wire [   2:0] req_in$004,
  input  wire [   2:0] req_in$005,
  input  wire [   2:0] req_in$006,
  input  wire [   2:0] req_in$007,
  input  wire [   0:0] req_in_valid$000,
  input  wire [   0:0] req_in_valid$001,
  input  wire [   0:0] req_in_valid$002,
  input  wire [   0:0] req_in_valid$003,
  input  wire [   0:0] req_in_valid$004,
  input  wire [   0:0] req_in_valid$005,
  input  wire [   0:0] req_in_valid$006,
  input  wire [   0:0] req_in_valid$007,
  output reg  [   2:0] req_out,
  output reg  [   0:0] req_out_valid,
  input  wire [   0:0] reset
);

  // register declarations
  reg    [   7:0] req_out_valid_tmp;

  // localparam declarations
  localparam id = 4;
  localparam nports = 8;

  // loop variable declarations
  integer i;


  // array declarations
  wire   [   2:0] req_in[0:7];
  assign req_in[  0] = req_in$000;
  assign req_in[  1] = req_in$001;
  assign req_in[  2] = req_in$002;
  assign req_in[  3] = req_in$003;
  assign req_in[  4] = req_in$004;
  assign req_in[  5] = req_in$005;
  assign req_in[  6] = req_in$006;
  assign req_in[  7] = req_in$007;
  wire   [   0:0] req_in_valid[0:7];
  assign req_in_valid[  0] = req_in_valid$000;
  assign req_in_valid[  1] = req_in_valid$001;
  assign req_in_valid[  2] = req_in_valid$002;
  assign req_in_valid[  3] = req_in_valid$003;
  assign req_in_valid[  4] = req_in_valid$004;
  assign req_in_valid[  5] = req_in_valid$005;
  assign req_in_valid[  6] = req_in_valid$006;
  assign req_in_valid[  7] = req_in_valid$007;

  // PYMTL SOURCE:
  //
  // @s.combinational
  // def arbiter_logic():
  //       s.req_out.value = 0
  //       s.req_out_valid_tmp.value = 0
  //       
  //       for i in range(nports):
  //         if s.req_in[i] == id and s.req_in_valid[i] == 1: 
  //           s.req_out.value = i
  //           s.req_out_valid_tmp[i].value = 1 
  //       
  //       s.req_out_valid.value = reduce_or(s.req_out_valid_tmp) 

  // logic for arbiter_logic()
  always @ (*) begin
    req_out = 0;
    req_out_valid_tmp = 0;
    for (i=0; i < nports; i=i+1)
    begin
      if (((req_in[i] == id)&&(req_in_valid[i] == 1))) begin
        req_out = i;
        req_out_valid_tmp[i] = 1;
      end
      else begin
      end
    end
    req_out_valid = (|req_out_valid_tmp);
  end


endmodule // Arbiter_0x33f9fff57c7dbfdc
`default_nettype wire

//-----------------------------------------------------------------------------
// Arbiter_0x6625ee609cb1d021
//-----------------------------------------------------------------------------
// PyMTL: dump_vcd = False
// PyMTL: xbar.Arbiter {"id": 5, "nports": 8}
// PyMTL: verilator_xinit = zeros
`default_nettype none
module Arbiter_0x6625ee609cb1d021
(
  input  wire [   0:0] clk,
  input  wire [   2:0] req_in$000,
  input  wire [   2:0] req_in$001,
  input  wire [   2:0] req_in$002,
  input  wire [   2:0] req_in$003,
  input  wire [   2:0] req_in$004,
  input  wire [   2:0] req_in$005,
  input  wire [   2:0] req_in$006,
  input  wire [   2:0] req_in$007,
  input  wire [   0:0] req_in_valid$000,
  input  wire [   0:0] req_in_valid$001,
  input  wire [   0:0] req_in_valid$002,
  input  wire [   0:0] req_in_valid$003,
  input  wire [   0:0] req_in_valid$004,
  input  wire [   0:0] req_in_valid$005,
  input  wire [   0:0] req_in_valid$006,
  input  wire [   0:0] req_in_valid$007,
  output reg  [   2:0] req_out,
  output reg  [   0:0] req_out_valid,
  input  wire [   0:0] reset
);

  // register declarations
  reg    [   7:0] req_out_valid_tmp;

  // localparam declarations
  localparam id = 5;
  localparam nports = 8;

  // loop variable declarations
  integer i;


  // array declarations
  wire   [   2:0] req_in[0:7];
  assign req_in[  0] = req_in$000;
  assign req_in[  1] = req_in$001;
  assign req_in[  2] = req_in$002;
  assign req_in[  3] = req_in$003;
  assign req_in[  4] = req_in$004;
  assign req_in[  5] = req_in$005;
  assign req_in[  6] = req_in$006;
  assign req_in[  7] = req_in$007;
  wire   [   0:0] req_in_valid[0:7];
  assign req_in_valid[  0] = req_in_valid$000;
  assign req_in_valid[  1] = req_in_valid$001;
  assign req_in_valid[  2] = req_in_valid$002;
  assign req_in_valid[  3] = req_in_valid$003;
  assign req_in_valid[  4] = req_in_valid$004;
  assign req_in_valid[  5] = req_in_valid$005;
  assign req_in_valid[  6] = req_in_valid$006;
  assign req_in_valid[  7] = req_in_valid$007;

  // PYMTL SOURCE:
  //
  // @s.combinational
  // def arbiter_logic():
  //       s.req_out.value = 0
  //       s.req_out_valid_tmp.value = 0
  //       
  //       for i in range(nports):
  //         if s.req_in[i] == id and s.req_in_valid[i] == 1: 
  //           s.req_out.value = i
  //           s.req_out_valid_tmp[i].value = 1 
  //       
  //       s.req_out_valid.value = reduce_or(s.req_out_valid_tmp) 

  // logic for arbiter_logic()
  always @ (*) begin
    req_out = 0;
    req_out_valid_tmp = 0;
    for (i=0; i < nports; i=i+1)
    begin
      if (((req_in[i] == id)&&(req_in_valid[i] == 1))) begin
        req_out = i;
        req_out_valid_tmp[i] = 1;
      end
      else begin
      end
    end
    req_out_valid = (|req_out_valid_tmp);
  end


endmodule // Arbiter_0x6625ee609cb1d021
`default_nettype wire

//-----------------------------------------------------------------------------
// Arbiter_0x383ccc355c6165a
//-----------------------------------------------------------------------------
// PyMTL: dump_vcd = False
// PyMTL: xbar.Arbiter {"id": 6, "nports": 8}
// PyMTL: verilator_xinit = zeros
`default_nettype none
module Arbiter_0x383ccc355c6165a
(
  input  wire [   0:0] clk,
  input  wire [   2:0] req_in$000,
  input  wire [   2:0] req_in$001,
  input  wire [   2:0] req_in$002,
  input  wire [   2:0] req_in$003,
  input  wire [   2:0] req_in$004,
  input  wire [   2:0] req_in$005,
  input  wire [   2:0] req_in$006,
  input  wire [   2:0] req_in$007,
  input  wire [   0:0] req_in_valid$000,
  input  wire [   0:0] req_in_valid$001,
  input  wire [   0:0] req_in_valid$002,
  input  wire [   0:0] req_in_valid$003,
  input  wire [   0:0] req_in_valid$004,
  input  wire [   0:0] req_in_valid$005,
  input  wire [   0:0] req_in_valid$006,
  input  wire [   0:0] req_in_valid$007,
  output reg  [   2:0] req_out,
  output reg  [   0:0] req_out_valid,
  input  wire [   0:0] reset
);

  // register declarations
  reg    [   7:0] req_out_valid_tmp;

  // localparam declarations
  localparam id = 6;
  localparam nports = 8;

  // loop variable declarations
  integer i;


  // array declarations
  wire   [   2:0] req_in[0:7];
  assign req_in[  0] = req_in$000;
  assign req_in[  1] = req_in$001;
  assign req_in[  2] = req_in$002;
  assign req_in[  3] = req_in$003;
  assign req_in[  4] = req_in$004;
  assign req_in[  5] = req_in$005;
  assign req_in[  6] = req_in$006;
  assign req_in[  7] = req_in$007;
  wire   [   0:0] req_in_valid[0:7];
  assign req_in_valid[  0] = req_in_valid$000;
  assign req_in_valid[  1] = req_in_valid$001;
  assign req_in_valid[  2] = req_in_valid$002;
  assign req_in_valid[  3] = req_in_valid$003;
  assign req_in_valid[  4] = req_in_valid$004;
  assign req_in_valid[  5] = req_in_valid$005;
  assign req_in_valid[  6] = req_in_valid$006;
  assign req_in_valid[  7] = req_in_valid$007;

  // PYMTL SOURCE:
  //
  // @s.combinational
  // def arbiter_logic():
  //       s.req_out.value = 0
  //       s.req_out_valid_tmp.value = 0
  //       
  //       for i in range(nports):
  //         if s.req_in[i] == id and s.req_in_valid[i] == 1: 
  //           s.req_out.value = i
  //           s.req_out_valid_tmp[i].value = 1 
  //       
  //       s.req_out_valid.value = reduce_or(s.req_out_valid_tmp) 

  // logic for arbiter_logic()
  always @ (*) begin
    req_out = 0;
    req_out_valid_tmp = 0;
    for (i=0; i < nports; i=i+1)
    begin
      if (((req_in[i] == id)&&(req_in_valid[i] == 1))) begin
        req_out = i;
        req_out_valid_tmp[i] = 1;
      end
      else begin
      end
    end
    req_out_valid = (|req_out_valid_tmp);
  end


endmodule // Arbiter_0x383ccc355c6165a
`default_nettype wire

//-----------------------------------------------------------------------------
// Arbiter_0x4361cb136b2cd341
//-----------------------------------------------------------------------------
// PyMTL: dump_vcd = False
// PyMTL: xbar.Arbiter {"id": 7, "nports": 8}
// PyMTL: verilator_xinit = zeros
`default_nettype none
module Arbiter_0x4361cb136b2cd341
(
  input  wire [   0:0] clk,
  input  wire [   2:0] req_in$000,
  input  wire [   2:0] req_in$001,
  input  wire [   2:0] req_in$002,
  input  wire [   2:0] req_in$003,
  input  wire [   2:0] req_in$004,
  input  wire [   2:0] req_in$005,
  input  wire [   2:0] req_in$006,
  input  wire [   2:0] req_in$007,
  input  wire [   0:0] req_in_valid$000,
  input  wire [   0:0] req_in_valid$001,
  input  wire [   0:0] req_in_valid$002,
  input  wire [   0:0] req_in_valid$003,
  input  wire [   0:0] req_in_valid$004,
  input  wire [   0:0] req_in_valid$005,
  input  wire [   0:0] req_in_valid$006,
  input  wire [   0:0] req_in_valid$007,
  output reg  [   2:0] req_out,
  output reg  [   0:0] req_out_valid,
  input  wire [   0:0] reset
);

  // register declarations
  reg    [   7:0] req_out_valid_tmp;

  // localparam declarations
  localparam id = 7;
  localparam nports = 8;

  // loop variable declarations
  integer i;


  // array declarations
  wire   [   2:0] req_in[0:7];
  assign req_in[  0] = req_in$000;
  assign req_in[  1] = req_in$001;
  assign req_in[  2] = req_in$002;
  assign req_in[  3] = req_in$003;
  assign req_in[  4] = req_in$004;
  assign req_in[  5] = req_in$005;
  assign req_in[  6] = req_in$006;
  assign req_in[  7] = req_in$007;
  wire   [   0:0] req_in_valid[0:7];
  assign req_in_valid[  0] = req_in_valid$000;
  assign req_in_valid[  1] = req_in_valid$001;
  assign req_in_valid[  2] = req_in_valid$002;
  assign req_in_valid[  3] = req_in_valid$003;
  assign req_in_valid[  4] = req_in_valid$004;
  assign req_in_valid[  5] = req_in_valid$005;
  assign req_in_valid[  6] = req_in_valid$006;
  assign req_in_valid[  7] = req_in_valid$007;

  // PYMTL SOURCE:
  //
  // @s.combinational
  // def arbiter_logic():
  //       s.req_out.value = 0
  //       s.req_out_valid_tmp.value = 0
  //       
  //       for i in range(nports):
  //         if s.req_in[i] == id and s.req_in_valid[i] == 1: 
  //           s.req_out.value = i
  //           s.req_out_valid_tmp[i].value = 1 
  //       
  //       s.req_out_valid.value = reduce_or(s.req_out_valid_tmp) 

  // logic for arbiter_logic()
  always @ (*) begin
    req_out = 0;
    req_out_valid_tmp = 0;
    for (i=0; i < nports; i=i+1)
    begin
      if (((req_in[i] == id)&&(req_in_valid[i] == 1))) begin
        req_out = i;
        req_out_valid_tmp[i] = 1;
      end
      else begin
      end
    end
    req_out_valid = (|req_out_valid_tmp);
  end


endmodule // Arbiter_0x4361cb136b2cd341
`default_nettype wire


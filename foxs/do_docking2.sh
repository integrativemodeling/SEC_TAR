# Example of foxs run for one of the TAR confomers
# Initial docking is done without the loops, but scoring is done
# with the loops (which are later optimized)

buildParams.pl complex_Znloop_woloops2.pdb ../TAR_ensemble/tar_m1.pdb

cp params.txt params_orig.txt

# Include cross-links information into the docking parameters file
sed -e 's/#distanceConstraintsFile file_name/distanceConstraintsFile dist1.txt/g' params_orig.txt > params.txt

# Do docking run
patch_dock.Linux params.txt dock_Znloop2.log

# Get transformations from the dock_Znloop2.lof file
python get_trans.py

# Evaluate the models
saxs_score complex_Znloop_wloops2.pdb tar_m1.pdb trans_dock.dat ../data/saxs_tar_complex.dat -o saxs_score.res --no_filtering_by_rg

import matplotlib.pyplot as plt
from os import path
from stereotaxyz import plotting, skullsweep

data_dir = path.join(path.dirname(path.realpath(__file__)),"../../example_data")
data_file = path.join(data_dir,'skull_6465.csv')
df = skullsweep.load_data(data_file, ultimate_reference='origin')

increment, df = skullsweep.insert_by_angle('VTA', df, pitch=45.,)
plotting.xyz(df, target='VTA', pitch=45., save_as='basic3d.pdf', insertion_resolution=0.05)

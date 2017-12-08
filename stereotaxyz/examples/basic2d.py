import matplotlib.pyplot as plt
from os import path
from stereotaxyz import plotting, skullsweep

data_dir = path.join(path.dirname(path.realpath(__file__)),"../../example_data")
data_file = path.join(data_dir,'skull_6465.csv')
df = skullsweep.load_data(data_file, ultimate_reference='bregma')

t, posteroanterior, inferosuperior, leftright, df_ = skullsweep.implant_by_angle('VTA', df, yz_angle=45.)
plotting.plot_yz(df_, 'VTA', [posteroanterior, inferosuperior], 45., color_projection='c')

plt.savefig('basic2d.png')

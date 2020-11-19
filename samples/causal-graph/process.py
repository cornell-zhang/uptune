import cdt
import pandas as pd

df = pd.read_csv ('archive.csv')
print(df.head())

# glasso = cdt.independence.graph.Glasso()
# skeleton = glasso.predict(df)
# new_skeleton = cdt.utils.graph.remove_indirect_links(skeleton, alg='aracne')
# 
# model = cdt.causality.graph.GES()
# output_graph = model.predict(df, new_skeleton)
# print(nx.adjacency_matrix(output_graph).todense())

model = cdt.causality.graph.CAM()
output_graph = model.predict(df)
print(nx.adjacency_matrix(output_graph).todense())



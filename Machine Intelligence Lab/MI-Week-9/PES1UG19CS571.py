import numpy as np


class KMeansClustering:
    """
    K-Means Clustering Model

    Args:
        n_clusters: Number of clusters(int)
    """

    def __init__(self, n_clusters, n_init=10, max_iter=1000, delta=0.001):

        self.n_cluster = n_clusters
        self.n_init = n_init
        self.max_iter = max_iter
        self.delta = delta

    def init_centroids(self, data):
        idx = np.random.choice(
            data.shape[0], size=self.n_cluster, replace=False)
        self.centroids = np.copy(data[idx, :])

    def fit(self, data):
        """
        Fit the model to the training dataset.
        Args:
            data: M x D Matrix(M data points with D attributes each)(numpy float)
        Returns:
            The object itself
        """
        if data.shape[0] < self.n_cluster:
            raise ValueError(
                'Number of clusters is grater than number of datapoints')

        best_centroids = None
        m_score = float('inf')

        for _ in range(self.n_init):
            self.init_centroids(data)

            for _ in range(self.max_iter):
                cluster_assign = self.e_step(data)
                old_centroid = np.copy(self.centroids)
                self.m_step(data, cluster_assign)

                if np.abs(old_centroid - self.centroids).sum() < self.delta:
                    break

            cur_score = self.evaluate(data)

            if cur_score < m_score:
                m_score = cur_score
                best_centroids = np.copy(self.centroids)

        self.centroids = best_centroids

        return self

    def e_step(self, data):
        """
        Expectation Step.
        Finding the cluster assignments of all the points in the data passed
        based on the current centroids
        Args:
            data: M x D Matrix (M training samples with D attributes each)(numpy float)
        Returns:
            Cluster assignment of all the samples in the training data
            (M) Vector (M number of samples in the train dataset)(numpy int)
        """
        centroids = self.centroids.reshape(self.centroids.shape[0],-1,self.centroids.shape[1])
        #now we need to compute the euclidean distance between a centroid and all the points in the dataset
        dist_matrix = np.sqrt(np.sum((centroids-data)**2, axis=2,keepdims=True)).transpose(2,0,1).T
        return np.argmin(dist_matrix,axis=1).reshape(-1)

    def m_step(self, data, cluster_assgn):
        """
        Maximization Step.
        Compute the centroids
        Args:
            data: M x D Matrix(M training samples with D attributes each)(numpy float)
            cluster_assign: Cluster Assignment
        Change self.centroids
        """
        #create a array with same shape as centroids
        centroids = np.zeros_like(self.centroids)
        # for each centroid we calulate new centroid as mean of points belonging to a cluster
        for clusters in range(centroids.shape[0]):
            centroids[clusters] = np.mean(data[cluster_assgn==clusters],axis=0)
        # copy over the new centroids to old one
        self.centroids = np.copy(centroids)      

    def evaluate(self, data, cluster_assign):
        """
        K-Means Objective
        Args:
            data: Test data (M x D) matrix (numpy float)
            cluster_assign: M vector, Cluster assignment of all the samples in `data`
        Returns:
            metric : (float.)
        """
        #stack the matrics to make it easier to take a difference
        augmented = np.stack([data,self.centroids[cluster_assign]])
        #return the ans as sum of squared differences
        sq_diff = np.diff(augmented, axis = 0) ** 2
        return np.sum(sq_diff)
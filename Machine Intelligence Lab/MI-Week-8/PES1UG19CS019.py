import numpy as np


class HMM:
    """
    HMM model class
    Args:
        A: State transition matrix
        states: list of states
        emissions: list of observations
        B: Emmision probabilites
    """

    def __init__(self, A, states, emissions, pi, B):
        self.A = A
        self.B = B
        self.states = states
        self.emissions = emissions
        self.pi = pi
        self.N = len(states)
        self.M = len(emissions)
        self.make_states_dict()

    def make_states_dict(self):
        """
        Make dictionary mapping between states and indexes
        """
        self.states_dict = dict(zip(self.states, list(range(self.N))))
        self.emissions_dict = dict(
            zip(self.emissions, list(range(self.M))))

    def viterbi_algorithm(self, seq):
        """
        Function implementing the Viterbi algorithm
        Args:
            seq: Observation sequence (list of observations. must be in the emmissions dict)
        Returns:
            nu: Porbability of the hidden state at time t given an obeservation sequence
            hidden_states_sequence: Most likely state sequence 
        """
        seq_len = len(seq)
        nu = np.zeros((seq_len, self.N))
        
        for i in range(self.N):
            nu[0, i] = self.pi[i] * self.B[i, self.emissions_dict[seq[0]]]

        for t in range(1, seq_len):
            for i in range(self.N):
                nu[t, i] = np.max(nu[t - 1, :] * self.A[:, i]) * self.B[i, self.emissions_dict[seq[t]]]

        hidden_states_sequence = []
        for t in range(seq_len - 1, -1, -1):
            hidden_states_sequence.append(np.argmax(nu[t, :]))

        prob = np.max(nu[seq_len - 1, :])
        states_list = list(self.states_dict.keys())
        final_states_sequence = [states_list[i] for i in hidden_states_sequence]
        # print(prob)
        return final_states_sequence[::-1]#, prob
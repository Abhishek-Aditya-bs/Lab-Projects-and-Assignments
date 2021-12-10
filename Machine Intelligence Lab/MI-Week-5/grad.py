import jax.numpy as jnp
from jax import grad

x_tensor = jnp.array([[ 0.5606, -0.7506, -0.9142, -1.1527,  0.0224],
        [-2.4439,  1.5957, -0.2165, -0.2130,  1.0369],
        [ 0.3105, -0.7681, -0.7885, -0.4243, -0.3060],
        [ 0.6828, -0.3238, -1.9912,  1.5819, -1.5010],
        [ 0.2657,  1.1983,  0.3082, -0.6292, -1.2506]])
y_tensor = jnp.array([[-1.0242, -2.2796, -1.0042, -0.6544, -0.0104],
        [-2.4508,  1.0339,  0.3305,  1.0350, -0.9931],
        [ 1.1692, -0.8511,  0.9211,  2.3074,  0.3165],
        [ 0.3364, -0.3250,  1.0391,  0.0773, -0.3774],
        [ 0.7861, -1.4565,  0.2544,  1.1455, -0.1651]])
i_tensor = jnp.array([[ 0.7377, -0.0076, -0.6924,  0.7849, -0.3795],
        [ 1.2860,  0.4247,  0.5646, -0.1582,  0.5034],
        [ 1.1832, -0.7087, -2.2267,  0.0550,  0.7731],
        [ 1.6035,  1.0802,  1.1341,  0.3498,  1.5319],
        [-1.3249,  0.6984,  0.3353,  0.5496, -0.1019]])
j_tensor = jnp.array([[-0.7789, -1.9501, -0.0298,  0.2694,  0.9825],
        [ 0.9122,  0.0995,  0.1650,  0.1503,  0.2796],
        [-1.1105, -0.1824,  0.4612, -1.6591, -0.9712],
        [-0.1923, -1.7089, -1.2546,  0.5906,  0.0530],
        [-0.7918, -0.1133, -0.7857, -0.6806, -0.8384]])

def f(x_tensor, y_tensor,i_tensor,j_tensor):
    a_tensor = x_tensor@y_tensor + x_tensor + y_tensor
    b_tensor = i_tensor + j_tensor + j_tensor
    c_tensor = a_tensor@b_tensor + b_tensor@a_tensor
    d_tensor = c_tensor + a_tensor + b_tensor
    e_tensor = d_tensor@c_tensor@a_tensor@b_tensor
    f_tensor = a_tensor + b_tensor + c_tensor@d_tensor
    return f_tensor

if __name__ == "__main__":
    df_grad = grad(f, argnums=(x_tensor, y_tensor,i_tensor,j_tensor))
    print(df_grad)


 

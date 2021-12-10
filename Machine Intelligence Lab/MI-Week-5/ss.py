import sys
import importlib
import argparse
import numpy as np


parser = argparse.ArgumentParser()
parser.add_argument('--SRN', required=True)

args = parser.parse_args()
subname = args.SRN


try:
    mymodule = importlib.import_module(subname)
except Exception as e:
    print(e)
    print("Rename your written program as YOUR_SRN.py and run python3.7 SampleTest.py --SRN YOUR_SRN ")
    sys.exit()


Tensor = mymodule.Tensor

a = Tensor(np.array([[1.0, 2.0], [3.0, 4.0]]))
b = Tensor(np.array([[3.0, 2.0], [1.0, 5.0]]), requires_grad=False)
c = Tensor(np.array([[3.2, 4.5], [6.1, 4.2]]))
z = np.array([[0.0, 0.0], [0.0, 0.0]])
sans = a+b
sans2 = a+a
mulans = a@b
mulans2 = (a+b)@c
d = a + c + a + c + a + a
sgrad = np.array([[1.0, 1.0], [1.0, 1.0]])
sgrad2 = np.array([[2.0, 2.0], [2.0, 2.0]])
sgrad3 = np.array([])
mulgrad = np.array([[5.0, 6.0], [5.0, 6.0]])
mulgrad2 = np.array([[4.0, 4.0], [6.0, 6.0]])
mulgrad3 = np.array([[7.7, 10.29], [7.7, 10.29]])
mulgrad4 = np.array([[8.0, 8.0], [13.0, 13.0]])

x_tensor = Tensor(np.array([[ 0.5606, -0.7506, -0.9142, -1.1527,  0.0224],
        [-2.4439,  1.5957, -0.2165, -0.2130,  1.0369],
        [ 0.3105, -0.7681, -0.7885, -0.4243, -0.3060],
        [ 0.6828, -0.3238, -1.9912,  1.5819, -1.5010],
        [ 0.2657,  1.1983,  0.3082, -0.6292, -1.2506]],dtype=np.float32))
y_tensor = Tensor(np.array([[-1.0242, -2.2796, -1.0042, -0.6544, -0.0104],
        [-2.4508,  1.0339,  0.3305,  1.0350, -0.9931],
        [ 1.1692, -0.8511,  0.9211,  2.3074,  0.3165],
        [ 0.3364, -0.3250,  1.0391,  0.0773, -0.3774],
        [ 0.7861, -1.4565,  0.2544,  1.1455, -0.1651]],dtype=np.float32))
i_tensor = Tensor(np.array([[ 0.7377, -0.0076, -0.6924,  0.7849, -0.3795],
        [ 1.2860,  0.4247,  0.5646, -0.1582,  0.5034],
        [ 1.1832, -0.7087, -2.2267,  0.0550,  0.7731],
        [ 1.6035,  1.0802,  1.1341,  0.3498,  1.5319],
        [-1.3249,  0.6984,  0.3353,  0.5496, -0.1019]],dtype=np.float32))
j_tensor = Tensor(np.array([[-0.7789, -1.9501, -0.0298,  0.2694,  0.9825],
        [ 0.9122,  0.0995,  0.1650,  0.1503,  0.2796],
        [-1.1105, -0.1824,  0.4612, -1.6591, -0.9712],
        [-0.1923, -1.7089, -1.2546,  0.5906,  0.0530],
        [-0.7918, -0.1133, -0.7857, -0.6806, -0.8384]],dtype=np.float32))
a_tensor = (x_tensor@y_tensor) + (x_tensor + y_tensor)
b_tensor = i_tensor + j_tensor + j_tensor
c_tensor = (a_tensor@b_tensor) + (b_tensor@a_tensor)
d_tensor = c_tensor + a_tensor + b_tensor
e_tensor = d_tensor@c_tensor@a_tensor@b_tensor
f_tensor = (a_tensor + b_tensor) + (c_tensor@d_tensor@e_tensor)
l = x_tensor@y_tensor

xgrad = np.array([[  5612452.0000, -45449808.0000,  57731788.0000,  24802884.0000,31935242.0000],
        [-27300510.0000,  11065352.0000,  20193482.0000,   5820846.5000,4472701.0000],
        [ -4000590.2500,   5860057.5000,  -2655276.2500,  -1215403.7500,-2977807.0000],
        [ -4259985.0000,  25379204.0000, -25847612.0000,  -9083416.0000,-16994940.0000],
        [  6607091.5000,  -5694954.5000,   5132129.5000,   5004749.5000,1784308.5000]])
ygrad = np.array([[ 11497478.0000, -32372608.0000,   7768955.5000, -10898248.0000,-22552056.0000],
        [  1281856.2500,  22021422.0000,   3108409.5000,  14071774.0000,14042512.0000],
        [ -2868590.5000,  -4272955.0000,   2660226.5000,  -5156152.5000,5818608.0000],
        [-26066580.0000,  25459168.0000, -42860020.0000,   -141455.3750,-15409071.0000],
        [  8346468.0000,    260213.0000,  18368492.0000,   4254894.0000,18681852.0000]])
igrad = np.array([[  6387716.0000, -16277129.0000,   9512792.0000,  10917589.0000,22959928.0000],
        [ 26112886.0000, -21732960.0000,  -1020817.0000,  19163146.0000,-25429526.0000],
        [  5472757.5000,   4995246.5000,    533716.0000,   8220840.0000, 3681479.2500],
        [ -4519139.0000,   9529519.0000,  -2127099.0000,  -2991481.0000, -2547669.7500],
        [ -5976778.0000, -11245165.0000,   3216701.0000,  -6127040.5000,3884030.2500]])
jgrad = np.array([[ 12775432.0000, -32554258.0000,  19025584.0000,  21835178.0000,45919856.0000],
        [ 52225772.0000, -43465920.0000,  -2041634.0000,  38326292.0000,-50859052.0000],
        [ 10945515.0000,   9990493.0000,   1067432.0000,  16441680.0000,7362958.5000],
        [ -9038278.0000,  19059038.0000,  -4254198.0000,  -5982962.0000,-5095339.5000],
        [-11953556.0000, -22490330.0000,   6433402.0000, -12254081.0000,7768060.5000]])

lxgrad = np.array([[-4.9728, -1.0445,  3.8631,  0.7504,  0.5644],
        [-4.9728, -1.0445,  3.8631,  0.7504,  0.5644],
        [-4.9728, -1.0445,  3.8631,  0.7504,  0.5644],
        [-4.9728, -1.0445,  3.8631,  0.7504,  0.5644],
        [-4.9728, -1.0445,  3.8631,  0.7504,  0.5644]])

lygrad = np.array([[-0.6243, -0.6243, -0.6243, -0.6243, -0.6243],
        [ 0.9515,  0.9515,  0.9515,  0.9515,  0.9515],
        [-3.6022, -3.6022, -3.6022, -3.6022, -3.6022],
        [-0.8373, -0.8373, -0.8373, -0.8373, -0.8373],
        [-1.9983, -1.9983, -1.9983, -1.9983, -1.9983]])

def test_case():

    try:
        sans.backward()
        np.testing.assert_array_almost_equal(a.grad, sgrad, decimal=2)
        print("Test Case 1 for the function Add Grad PASSED")
    except Exception as e:
        print(e)
        print("Test Case 1 for the function Add Grad FAILED")

    try:
        np.testing.assert_array_almost_equal(b.grad, z, decimal=2)
        print("Test Case 2 for the function Add Grad PASSED")
    except Exception as e:
        print(e)
        print("Test Case 2 for the function Add Grad FAILED")

    a.zero_grad()
    b.zero_grad()

    try:
        sans2.backward()
        np.testing.assert_array_almost_equal(a.grad, sgrad2, decimal=2)
        print("Test Case 3 for the function Add Grad PASSED")
    except Exception as e:
        print(e)
        print("Test Case 3 for the function Add Grad FAILED")

    a.zero_grad()
    b.zero_grad()

    try:
        mulans.backward()
        np.testing.assert_array_almost_equal(a.grad, mulgrad, decimal=2)
        print("Test Case 4 for the function Matmul Grad PASSED")
    except Exception as e:
        print(e)
        print("Test Case 4 for the function Matmul Grad FAILED")

    try:
        np.testing.assert_array_almost_equal(b.grad, z, decimal=2)
        print("Test Case 5 for the function Matmul Grad PASSED")
    except Exception as e:
        print(e)
        print("Test Case 5 for the function Matmul Grad FAILED")

    a.zero_grad()
    b.zero_grad()
    b.requires_grad = True

    try:
        mulans.backward()
        np.testing.assert_array_almost_equal(b.grad, mulgrad2, decimal=2)
        print("Test Case 6 for the function Matmul Grad PASSED")
    except Exception as e:
        print(e)
        print("Test Case 6 for the function Matmul Grad FAILED")

    a.zero_grad()
    b.zero_grad()
    c.zero_grad()
    d.zero_grad()

    try:
        mulans2.backward()
        np.testing.assert_array_almost_equal(a.grad, mulgrad3, decimal=2)
        np.testing.assert_array_almost_equal(b.grad, mulgrad3, decimal=2)
        print("Test Case 7 for the function Matmul and add Grad PASSED")
    except Exception as e:
        print(e)
        print("Test Case 7 for the function Matmul and add Grad FAILED")

    try:
        np.testing.assert_array_almost_equal(c.grad, mulgrad4, decimal=2)
        print("Test Case 8 for the function Matmul and add Grad PASSED")
    except Exception as e:
        print(e)
        print("Test Case 8 for the function Matmul and add Grad FAILED")

    a.zero_grad()
    b.zero_grad()
    c.zero_grad()
    # d.zero_grad()

    try:
        d.backward()
        np.testing.assert_array_almost_equal(a.grad, sgrad*4, decimal=2)
        print("Test Case 9 for the function Matmul and add Grad PASSED")
    except Exception as e:
        print(e)
        print("Test Case 9 for the function Matmul and add Grad FAILED")

    try:
        np.testing.assert_array_almost_equal(c.grad, sgrad*2, decimal=2)
        print("Test Case 10 for the function Matmul and add Grad PASSED")
    except Exception as e:
        print(e)
        print("Test Case 10 for the function Matmul and add Grad FAILED")

    x_tensor.zero_grad()
    y_tensor.zero_grad()

    try:
        l.backward()
        np.testing.assert_array_almost_equal(x_tensor.grad, lxgrad, decimal=2)
        print("Test Case 9 for the function Matmul and add Grad PASSED")
    except Exception as e:
        print(e)
        print("Test Case 9 for the function Matmul and add Grad FAILED")

    try:
        np.testing.assert_array_almost_equal(y_tensor.grad, lygrad, decimal=2)
        print("Test Case 10 for the function Matmul and add Grad PASSED")
    except Exception as e:
        print(e)
        print("Test Case 10 for the function Matmul and add Grad FAILED")

    x_tensor.zero_grad()
    y_tensor.zero_grad()
    i_tensor.zero_grad()
    j_tensor.zero_grad()
    a_tensor.zero_grad()
    b_tensor.zero_grad()
    c_tensor.zero_grad()
    d_tensor.zero_grad()
    e_tensor.zero_grad()
    f_tensor.zero_grad()

    f_tensor.backward()
    # np.testing.assert_array_almost_equal(x_tensor.grad, xgrad, decimal=2)
    print(x_tensor.grad)
    print(xgrad)
    print("Test Case 18 Check if the values are close.")

    print(y_tensor.grad)
    print(ygrad)
    print("Test Case 18 Check if the values are close.")

    print(i_tensor.grad)
    print(igrad)
    print("Test Case 18 Check if the values are close.")

    print(j_tensor.grad)
    print(jgrad)
    print("Test Case 18 Check if the values are close.")


if __name__ == "__main__":
    test_case()

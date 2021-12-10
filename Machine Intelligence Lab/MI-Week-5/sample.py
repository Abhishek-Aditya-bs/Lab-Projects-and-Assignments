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
        [ 0.2657,  1.1983,  0.3082, -0.6292, -1.2506]]))
y_tensor = Tensor(np.array([[-1.0242, -2.2796, -1.0042, -0.6544, -0.0104],
        [-2.4508,  1.0339,  0.3305,  1.0350, -0.9931],
        [ 1.1692, -0.8511,  0.9211,  2.3074,  0.3165],
        [ 0.3364, -0.3250,  1.0391,  0.0773, -0.3774],
        [ 0.7861, -1.4565,  0.2544,  1.1455, -0.1651]]))
i_tensor = Tensor(np.array([[ 0.7377, -0.0076, -0.6924,  0.7849, -0.3795],
        [ 1.2860,  0.4247,  0.5646, -0.1582,  0.5034],
        [ 1.1832, -0.7087, -2.2267,  0.0550,  0.7731],
        [ 1.6035,  1.0802,  1.1341,  0.3498,  1.5319],
        [-1.3249,  0.6984,  0.3353,  0.5496, -0.1019]]))
j_tensor = Tensor(np.array([[-0.7789, -1.9501, -0.0298,  0.2694,  0.9825],
        [ 0.9122,  0.0995,  0.1650,  0.1503,  0.2796],
        [-1.1105, -0.1824,  0.4612, -1.6591, -0.9712],
        [-0.1923, -1.7089, -1.2546,  0.5906,  0.0530],
        [-0.7918, -0.1133, -0.7857, -0.6806, -0.8384]]))
a_tensor = x_tensor@y_tensor + x_tensor + y_tensor
b_tensor = i_tensor + j_tensor + j_tensor
c_tensor = a_tensor@b_tensor + b_tensor@a_tensor
d_tensor = c_tensor + a_tensor + b_tensor
e_tensor = d_tensor@c_tensor@a_tensor@b_tensor
f_tensor = a_tensor + b_tensor + c_tensor@d_tensor

xgrad = np.array([[ -259.0974,  1300.5018, -1644.5557,  -558.8008, -1131.4475],
        [ 1383.8822,  -224.8970, -1311.9617,  -272.2783,  -500.5319],
        [  360.7891,   177.9477,  -728.4351,  -139.5216,  -434.6699],
        [  429.7754,  -537.6080,    35.7628,    18.1170,   166.5874],
        [ -253.5349,    26.9809,    -8.5875,   -69.4854,   -36.2280]])
ygrad = np.array([[ -240.5982,  1250.8086,   429.9676,   241.3056,  1259.6229],
        [  131.6015,  -927.0339,  -718.6907,  -337.8886, -1314.1227],
        [   -5.1307,   110.0491,   542.3163,   180.9906,   631.1237],
        [  255.5849,  -847.7955,   912.8635,  -179.5526,   701.6783],
        [  -80.7825,   -93.6348,  -510.9658,    -2.0664,  -710.0487]])
igrad = np.array([[-445.9666,  650.2254, -533.0087, -543.5874, -947.6356],
        [-674.1143,  497.9639, -117.9936, -520.1741,  306.8812],
        [-340.8250,  173.8932, -570.5732, -440.7168, -787.2073],
        [ 253.8853, -175.9523, -463.7092,   47.2973, -713.4709],
        [ 256.3283,  328.8215, -148.9896,  127.7384, -307.9315]])
jgrad = np.array([[ -891.9332,  1300.4508, -1066.0175, -1087.1748, -1895.2711],
        [-1348.2286,   995.9277,  -235.9871, -1040.3481,   613.7623],
        [ -681.6499,   347.7864, -1141.1464,  -881.4337, -1574.4147],
        [  507.7706,  -351.9045,  -927.4185,    94.5947, -1426.9418],
        [  512.6566,   657.6430,  -297.9792,   255.4767,  -615.8631]])

a_backward_xgrad = np.array([[-3.9728, -0.0445,  4.8631,  1.7504,  1.5644],
        [-3.9728, -0.0445,  4.8631,  1.7504,  1.5644],
        [-3.9728, -0.0445,  4.8631,  1.7504,  1.5644],
        [-3.9728, -0.0445,  4.8631,  1.7504,  1.5644],
        [-3.9728, -0.0445,  4.8631,  1.7504,  1.5644]])

a_backward_ygrad = np.array([[ 0.3757,  0.3757,  0.3757,  0.3757,  0.3757],
        [ 1.9515,  1.9515,  1.9515,  1.9515,  1.9515],
        [-2.6022, -2.6022, -2.6022, -2.6022, -2.6022],
        [ 0.1627,  0.1627,  0.1627,  0.1627,  0.1627],
        [-0.9983, -0.9983, -0.9983, -0.9983, -0.9983]])

# >>> x.grad
c_backward_xgrad = np.array([[ -3.9954,  22.5097, -25.5979,  -8.5898, -17.6537],
        [ 18.9924,  22.7672, -53.7373, -18.7182, -26.7058],
        [  9.2571,  22.6581, -41.8202, -14.4288, -22.8722],
        [ -1.4504,  22.5382, -28.7132,  -9.7111, -18.6559],
        [-11.0475,  22.4307, -16.9654,  -5.4827, -14.8767]])
# >>> y.grad
c_backward_ygrad = np.array([[ 12.0096,  15.1671,  10.0269,  13.2290,  10.6223],
        [-15.9925,   0.4087, -26.2913,  -9.6583, -23.1982],
        [ 10.1968, -11.6732,  23.9296,   1.7505,  19.8051],
        [ -0.6124,   0.7550,  -1.4710,  -0.0843,  -1.2131],
        [ -1.4597,  -9.8498,   3.8088,  -4.7000,   2.2264]])
# >>> i.grad
c_backward_igrad = np.array([[-23.1594,  -0.7743, -11.9566, -20.7748, -11.6678],
        [ -7.8664,  14.5186,   3.3364,  -5.4818,   3.6251],
        [-19.4113,   2.9737,  -8.2085, -17.0267,  -7.9198],
        [-19.7937,   2.5914,  -8.5909, -17.4091,  -8.3021],
        [-18.2555,   4.1296,  -7.0527, -15.8708,  -6.7639]])
# >>> j.grad
c_backward_jgrad = np.array([[-46.3188,  -1.5486, -23.9132, -41.5496, -23.3357],
        [-15.7329,  29.0373,   6.6727, -10.9637,   7.2502],
        [-38.8227,   5.9475, -16.4171, -34.0535, -15.8396],
        [-39.5874,   5.1828, -17.1818, -34.8181, -16.6043],
        [-36.5109,   8.2593, -14.1053, -31.7417, -13.5278]])


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
    i_tensor.zero_grad()
    j_tensor.zero_grad()

    try:
        a_tensor.backward()
        np.testing.assert_array_almost_equal(x_tensor.grad, a_backward_xgrad, decimal=2)
        print("Test Case 11 for the function Matmul and add Grad PASSED")
    except Exception as e:
        print(e)
        print("Test Case 11 for the function Matmul and add Grad FAILED")

    try:
        np.testing.assert_array_almost_equal(y_tensor.grad, a_backward_ygrad, decimal=2)
        print("Test Case 12 for the function Matmul and add Grad PASSED")
    except Exception as e:
        print(e)
        print("Test Case 12 for the function Matmul and add Grad FAILED")

    try:
        b_tensor.backward()
        np.testing.assert_array_almost_equal(i_tensor.grad, np.ones_like(i_tensor), decimal=2)
        np.testing.assert_array_almost_equal(j_tensor.grad, np.ones_like(j_tensor)*2, decimal=2)
        print("Test Case 13 for the function Matmul and add Grad PASSED")
    except Exception as e:
        print(e)
        print("Test Case 13 for the function Matmul and add Grad FAILED")

    x_tensor.zero_grad()
    y_tensor.zero_grad()
    i_tensor.zero_grad()
    j_tensor.zero_grad()
    a_tensor.zero_grad()
    b_tensor.zero_grad()
    c_tensor.zero_grad()

    try:
        c_tensor.backward()
        np.testing.assert_array_almost_equal(x_tensor.grad, c_backward_xgrad, decimal=2)
        print("Test Case 14 for the function Matmul and add Grad PASSED")
    except Exception as e:
        print(e)
        print("Test Case 14 for the function Matmul and add Grad FAILED")

    try:
        np.testing.assert_array_almost_equal(y_tensor.grad, c_backward_ygrad, decimal=2)
        print("Test Case 15 for the function Matmul and add Grad PASSED")
    except Exception as e:
        print(e)
        print("Test Case 15 for the function Matmul and add Grad FAILED")

    try:
        np.testing.assert_array_almost_equal(i_tensor.grad, c_backward_igrad, decimal=2)
        print("Test Case 16 for the function Matmul and add Grad PASSED")
    except Exception as e:
        print(e)
        print("Test Case 16 for the function Matmul and add Grad FAILED")

    try:
        np.testing.assert_array_almost_equal(j_tensor.grad, c_backward_jgrad, decimal=2)
        print("Test Case 17 for the function Matmul and add Grad PASSED")
    except Exception as e:
        print(e)
        print("Test Case 17 for the function Matmul and add Grad FAILED")

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

    # try:
    #     f_tensor.backward()
    #     np.testing.assert_array_almost_equal(x_tensor.grad, xgrad, decimal=2)
    #     print("Test Case 18 for the function Matmul and add Grad PASSED")
    # except Exception as e:
    #     print(e)
    #     print("Test Case 18 for the function Matmul and add Grad FAILED")

    # try:
    #     np.testing.assert_array_almost_equal(y_tensor.grad, ygrad, decimal=2)
    #     print("Test Case 19 for the function Matmul and add Grad PASSED")
    # except Exception as e:
    #     print(e)
    #     print("Test Case 19 for the function Matmul and add Grad FAILED")

    # try:
    #     np.testing.assert_array_almost_equal(i_tensor.grad, igrad, decimal=2)
    #     print("Test Case 20 for the function Matmul and add Grad PASSED")
    # except Exception as e:
    #     print(e)
    #     print("Test Case 20 for the function Matmul and add Grad FAILED")

    # try:
    #     np.testing.assert_array_almost_equal(j_tensor.grad, jgrad, decimal=2)
    #     print("Test Case 21 for the function Matmul and add Grad PASSED")
    # except Exception as e:
    #     print(e)
    #     print("Test Case 21 for the function Matmul and add Grad FAILED")
if __name__ == "__main__":
    test_case()

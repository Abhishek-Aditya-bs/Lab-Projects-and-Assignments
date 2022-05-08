package com.parkingmvc;

import java.awt.BorderLayout;
import javax.swing.GroupLayout;
import javax.swing.JButton;
import javax.swing.JComboBox;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JTextField;
// import javax.swing.SwingConstants;

public class View {
    
    private JFrame frame;
    private JLabel firstnameLabel;
    private JLabel lastnameLabel;
    private JLabel addressLabel;
    private JLabel cityLabel;
    private JLabel stateLabel;
    private JLabel zipLabel;
    private JLabel phoneLabel;
    private JLabel licenseLabel;
    private JLabel makeLabel;
    private JLabel modelLabel;
    private JLabel colorLabel;
    private JLabel plateLabel;
    private JTextField firstnameTextField;
    private JTextField lastnameTextField;
    private JTextField addressTextField;
    private JTextField cityTextField;
    private JTextField stateTextField;
    private JTextField zipTextField;
    private JTextField phoneTextField;
    private JTextField licenseTextField;
    private JTextField makeTextField;
    private JTextField modelTextField;
    private JTextField colorTextField;
    private JTextField plateTextField;
    String p[] = {"Select a parking slot",
                  "Parking Slot 1", "Parking Slot 2", 
                  "Parking Slot 3", "Parking Slot 4", 
                  "Parking Slot 5", "Parking Slot 6", 
                  "Parking Slot 7", "Parking Slot 8", 
                  "Parking Slot 9", "Parking Slot 10"};
    private JComboBox<String> comboBox;
    private JButton submitButton;
    private JButton clearButton;
    private JButton exitButton;
    // Get a drop down list of options
    

    public View(String title) {
        frame = new JFrame(title);
        frame.setLayout(new BorderLayout());
        frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        frame.setSize(400, 400);
        frame.setLocationRelativeTo(null);
        frame.setVisible(true);
        frame.setResizable(true);

        firstnameLabel = new JLabel("First Name: ");
        lastnameLabel = new JLabel("Last Name: ");
        addressLabel = new JLabel("Address: ");
        cityLabel = new JLabel("City: ");
        stateLabel = new JLabel("State: ");
        zipLabel = new JLabel("Zip: ");
        phoneLabel = new JLabel("Phone: ");
        licenseLabel = new JLabel("License: ");
        makeLabel = new JLabel("Make: ");
        modelLabel = new JLabel("Model: ");
        colorLabel = new JLabel("Color: ");
        plateLabel = new JLabel("Plate: ");

        firstnameTextField = new JTextField();
        lastnameTextField = new JTextField();
        addressTextField = new JTextField();
        cityTextField = new JTextField();
        stateTextField = new JTextField();
        zipTextField = new JTextField();
        phoneTextField = new JTextField();
        licenseTextField = new JTextField();
        makeTextField = new JTextField();
        modelTextField = new JTextField();
        colorTextField = new JTextField();
        plateTextField = new JTextField();
        comboBox = new JComboBox(p);
        submitButton = new JButton("Submit");
        clearButton = new JButton("Clear");
        exitButton = new JButton("Exit");

        GroupLayout layout = new GroupLayout(frame.getContentPane());
        frame.getContentPane().setLayout(layout);
        layout.setAutoCreateGaps(true);
        layout.setAutoCreateContainerGaps(true);
        layout.setHorizontalGroup(layout.createParallelGroup()
                .addGroup(layout.createSequentialGroup()
                        .addGroup(layout.createParallelGroup()
                                .addComponent(firstnameLabel)
                                .addComponent(lastnameLabel)
                                .addComponent(addressLabel)
                                .addComponent(cityLabel)
                                .addComponent(stateLabel)
                                .addComponent(zipLabel)
                                .addComponent(phoneLabel)
                                .addComponent(licenseLabel)
                                .addComponent(makeLabel)
                                .addComponent(modelLabel)
                                .addComponent(colorLabel)
                                .addComponent(plateLabel))
                        .addGroup(layout.createParallelGroup()
                                .addComponent(firstnameTextField)
                                .addComponent(lastnameTextField)
                                .addComponent(addressTextField)
                                .addComponent(cityTextField)
                                .addComponent(stateTextField)
                                .addComponent(zipTextField)
                                .addComponent(phoneTextField)
                                .addComponent(licenseTextField)
                                .addComponent(makeTextField)
                                .addComponent(modelTextField)
                                .addComponent(colorTextField)
                                .addComponent(plateTextField)))
                .addGroup(layout.createSequentialGroup()
                        .addComponent(comboBox)
                        .addComponent(submitButton)
                        .addComponent(clearButton)
                        .addComponent(exitButton)));

        layout.setVerticalGroup(layout.createSequentialGroup()
                .addGroup(layout.createParallelGroup()
                        .addComponent(firstnameLabel)
                        .addComponent(firstnameTextField))
                .addGroup(layout.createParallelGroup()
                        .addComponent(lastnameLabel)
                        .addComponent(lastnameTextField))
                .addGroup(layout.createParallelGroup()
                        .addComponent(addressLabel)
                        .addComponent(addressTextField))
                .addGroup(layout.createParallelGroup()
                        .addComponent(cityLabel)
                        .addComponent(cityTextField))
                .addGroup(layout.createParallelGroup()
                        .addComponent(stateLabel)
                        .addComponent(stateTextField))
                .addGroup(layout.createParallelGroup()
                        .addComponent(zipLabel)
                        .addComponent(zipTextField))
                .addGroup(layout.createParallelGroup()
                        .addComponent(phoneLabel)
                        .addComponent(phoneTextField))
                .addGroup(layout.createParallelGroup()
                        .addComponent(licenseLabel)
                        .addComponent(licenseTextField))
                .addGroup(layout.createParallelGroup()
                        .addComponent(makeLabel)
                        .addComponent(makeTextField))
                .addGroup(layout.createParallelGroup()
                        .addComponent(modelLabel)
                        .addComponent(modelTextField))
                .addGroup(layout.createParallelGroup()
                        .addComponent(colorLabel)
                        .addComponent(colorTextField))
                .addGroup(layout.createParallelGroup()
                        .addComponent(plateLabel)
                        .addComponent(plateTextField))
                .addGroup(layout.createParallelGroup()
                        .addComponent(comboBox)
                        .addComponent(submitButton)
                        .addComponent(clearButton)
                        .addComponent(exitButton)));

    }

    public JFrame getFrame() {
        return frame;
    }

    public JLabel getFirstnameLabel() {
        return firstnameLabel;
    }
    public JLabel getLastnameLabel() {
        return lastnameLabel;
    }
    public JLabel getAddressLabel() {
        return addressLabel;
    }
    public JLabel getCityLabel() {
        return cityLabel;
    }
    public JLabel getStateLabel() {
        return stateLabel;
    }
    public JLabel getZipLabel() {
        return zipLabel;
    }
    public JLabel getPhoneLabel() {
        return phoneLabel;
    }
    public JLabel getLicenseLabel() {
        return licenseLabel;
    }
    public JLabel getMakeLabel() {
        return makeLabel;
    }
    public JLabel getModelLabel() {
        return modelLabel;
    }
    public JLabel getColorLabel() {
        return colorLabel;
    }
    public JLabel getPlateLabel() {
        return plateLabel;
    }
    public JComboBox getComboBox() {
        return comboBox;
    }
    public JTextField getFirstnameTextField() {
        return firstnameTextField;
    }
    public JTextField getLastnameTextField() {
        return lastnameTextField;
    }
    public JTextField getAddressTextField() {
        return addressTextField;
    }
    public JTextField getCityTextField() {
        return cityTextField;
    }
    public JTextField getStateTextField() {
        return stateTextField;
    }
    public JTextField getZipTextField() {
        return zipTextField;
    }
    public JTextField getPhoneTextField() {
        return phoneTextField;
    }
    public JTextField getLicenseTextField() {
        return licenseTextField;
    }
    public JTextField getMakeTextField() {
        return makeTextField;
    }
    public JTextField getModelTextField() {
        return modelTextField;
    }
    public JTextField getColorTextField() {
        return colorTextField;
    }
    public JTextField getPlateTextField() {
        return plateTextField;
    }
    public JButton getSubmitButton() {
        return submitButton;
    }
    public JButton getClearButton() {
        return clearButton;
    }
    public JButton getExitButton() {
        return exitButton;
    }

    public void setFirstnameLabel(JLabel firstnameLabel) {
        this.firstnameLabel = firstnameLabel;
    }
    public void setLastnameLabel(JLabel lastnameLabel) {
        this.lastnameLabel = lastnameLabel;
    }
    public void setAddressLabel(JLabel addressLabel) {
        this.addressLabel = addressLabel;
    }
    public void setCityLabel(JLabel cityLabel) {
        this.cityLabel = cityLabel;
    }
    public void setStateLabel(JLabel stateLabel) {
        this.stateLabel = stateLabel;
    }
    public void setZipLabel(JLabel zipLabel) {
        this.zipLabel = zipLabel;
    }
    public void setPhoneLabel(JLabel phoneLabel) {
        this.phoneLabel = phoneLabel;
    }
    public void setLicenseLabel(JLabel licenseLabel) {
        this.licenseLabel = licenseLabel;
    }
    public void setMakeLabel(JLabel makeLabel) {
        this.makeLabel = makeLabel;
    }
    public void setModelLabel(JLabel modelLabel) {
        this.modelLabel = modelLabel;
    }
    public void setColorLabel(JLabel colorLabel) {
        this.colorLabel = colorLabel;
    }
    public void setPlateLabel(JLabel plateLabel) {
        this.plateLabel = plateLabel;
    }
    public void setFirstnameTextField(JTextField firstnameTextField) {
        this.firstnameTextField = firstnameTextField;
    }
    public void setLastnameTextField(JTextField lastnameTextField) {
        this.lastnameTextField = lastnameTextField;
    }
    public void setAddressTextField(JTextField addressTextField) {
        this.addressTextField = addressTextField;
    }
    public void setCityTextField(JTextField cityTextField) {
        this.cityTextField = cityTextField;
    }
    public void setStateTextField(JTextField stateTextField) {
        this.stateTextField = stateTextField;
    }
    public void setZipTextField(JTextField zipTextField) {
        this.zipTextField = zipTextField;
    }
    public void setPhoneTextField(JTextField phoneTextField) {
        this.phoneTextField = phoneTextField;
    }
    public void setLicenseTextField(JTextField licenseTextField) {
        this.licenseTextField = licenseTextField;
    }
    public void setMakeTextField(JTextField makeTextField) {
        this.makeTextField = makeTextField;
    }
    public void setModelTextField(JTextField modelTextField) {
        this.modelTextField = modelTextField;
    }
    public void setColorTextField(JTextField colorTextField) {
        this.colorTextField = colorTextField;
    }
    public void setPlateTextField(JTextField plateTextField) {
        this.plateTextField = plateTextField;
    }
    public void setJComboBox(JComboBox comboBox) {
        this.comboBox = comboBox;
    }
    public void setSubmitButton(JButton submitButton) {
        this.submitButton = submitButton;
    }
    public void setClearButton(JButton clearButton) {
        this.clearButton = clearButton;
    }
    public void setExitButton(JButton exitButton) {
        this.exitButton = exitButton;
    }
}

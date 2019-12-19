m_delay = 1000;

function Controller() 
{
    installer.autoRejectMessageBoxes();
    installer.installationFinished.connect(function() {
        gui.clickButton(buttons.NextButton);
    })
}

Controller.prototype.WelcomePageCallback = function() 
{
    gui.clickButton(buttons.NextButton, m_delay);
}

Controller.prototype.CredentialsPageCallback = function() 
{
    gui.clickButton(buttons.NextButton, m_delay);
}

Controller.prototype.IntroductionPageCallback = function() 
{
    gui.clickButton(buttons.NextButton, m_delay);
}

Controller.prototype.TargetDirectoryPageCallback = function()
{
    gui.currentPageWidget().TargetDirectoryLineEdit.setText(installer.value("ApplicationsDir") + "/Qt");
    gui.clickButton(buttons.NextButton, m_delay);
}

Controller.prototype.ComponentSelectionPageCallback = function()
{
    var widget = gui.currentPageWidget();
    widget.deselectAll();
    widget.selectComponent("qt.563.gcc_64");
    widget.selectComponent("qt.563.qtwebview");
    widget.selectComponent("qt.563.qtscript");
    widget.selectComponent("qt.563.qtserialbus");
    widget.selectComponent("qt.563.qtwebview");
    widget.selectComponent("qt.563.qtwebengine");
    widget.deselectComponent("qt.tools.qtcreator"); // not working?
    gui.clickButton(buttons.NextButton, m_delay);
}

Controller.prototype.LicenseAgreementPageCallback = function() {
    gui.currentPageWidget().AcceptLicenseRadioButton.setChecked(true);
    gui.clickButton(buttons.NextButton, m_delay);
}

Controller.prototype.ReadyForInstallationPageCallback = function()
{
    gui.clickButton(buttons.NextButton, m_delay);
}

Controller.prototype.FinishedPageCallback = function()
{
    var checkBoxForm = gui.currentPageWidget().LaunchQtCreatorCheckBoxForm;
    if (checkBoxForm && checkBoxForm.launchQtCreatorCheckBox) {
        checkBoxForm.launchQtCreatorCheckBox.checked = false;
    }
    gui.clickButton(buttons.FinishButton, m_delay);
}

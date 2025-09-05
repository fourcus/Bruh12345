Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing
Add-Type -AssemblyName PresentationCore

$sourceURL = "https://static.wikia.nocookie.net/unanything/images/a/af/SPOILER_Scary-Maze-Game-the-exorcist-34302996-1600-1200.jpg/revision/latest"
$sourceURL2 = "https://raw.githubusercontent.com/fourcus/Bruh12345/refs/heads/main/scary.wav"
Invoke-WebRequest -Uri $sourceURL -OutFile "C:\Users\$env:USERNAME\AppData\Roaming\scary.png"
Invoke-WebRequest -Uri $sourceURL2 -OutFile "C:\Users\$env:USERNAME\AppData\Roaming\scary.wav"

$form = New-Object Windows.Forms.Form
$form.FormBorderStyle = 'None'   
$form.WindowState = 'Maximized'  
$form.TopMost = $true              
$form.BackColor = 'Black'

$pictureBox = New-Object Windows.Forms.PictureBox
$pictureBox.Dock = 'Fill'
$pictureBox.SizeMode = 'StretchImage'

$pictureBox.Image = [Drawing.Image]::FromFile("C:\Users\$env:USERNAME\AppData\Roaming\scary.png")

$form.Controls.Add($pictureBox)

$player = New-Object System.Media.SoundPlayer "C:\Users\$env:USERNAME\AppData\Roaming\scary.wav"
$player.Play()

$timer = New-Object Windows.Forms.Timer
$timer.Interval = 2000
$timer.Add_Tick({
    $timer.Stop()
    $form.Close()
})

$timer.Start()

$form.ShowDialog()

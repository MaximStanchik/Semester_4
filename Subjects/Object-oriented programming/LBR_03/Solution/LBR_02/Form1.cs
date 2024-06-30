using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Drawing.Imaging;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Xml.Serialization;
using System.Text.RegularExpressions;
using static System.Windows.Forms.VisualStyles.VisualStyleElement;

namespace LBR_02
{
    public partial class Form1 : Form
    {
        string[] productType =
        {
            "Vegetables",
            "Fruits"
        };

        string[] invNumbers = {
            "CU-5678",
            "TM-1234",
            "PT-9012"
        };

        string[] accounts = {
            "Starlight Provisions"
        };

        string[][] products;

        public Form1()
        {
            InitializeComponent();
            products = new string[][] {
            new string[] { invNumbers[0], "Cucumbers", "Marketmore76", "6-8", "0.3 - 0.5", "0,50", "0,75", "19.02.2024", "6:15", "13232", accounts[0], "Texas" , productType[0] },
            new string[] { invNumbers[1], "Tomatoes", "Big Beef", "2-3", "0.2 - 0.3", "1,50", "2,00", "18.02.2024", "10:15", "28748", accounts[0], "Florida", productType[0] },
            new string[] { invNumbers[2], "Potatoes", "Russet Burban", "2-4", "0.3 - 0.6", "0,25", "0,40", "17.02.2024", "21:00", "10549", accounts[0], "Georgia", productType[0] }
            };

            Table.Rows.Add(products[0][1], products[0][11], products[0][7]);
            Table.Rows.Add(products[1][1], products[1][11], products[1][7]);
            Table.Rows.Add(products[2][1], products[2][11], products[2][7]);

            Table.Sort(Table.Columns[0], ListSortDirection.Ascending);

        }



        private void button10_Click(object sender, EventArgs e)
        {

        }

        

        public string FindMatchingRegex(string userInput, string[] productType)
        {
            int maxMatchLength = 0;
            string bestMatchingRegex = null;

            foreach (string regexPattern in productType)
            {
                Match match = Regex.Match(userInput, regexPattern);
                if (match.Success && match.Length > maxMatchLength)
                {
                    maxMatchLength = match.Length;
                    bestMatchingRegex = regexPattern;
                }
            }

            return bestMatchingRegex;
        }

        private void Form1_Load(object sender, EventArgs e)
        {

        }

        private void textBox2_TextChanged(object sender, EventArgs e)
        {

        }

        private void textBox22_TextChanged(object sender, EventArgs e)
        {

        }

        private void textBox26_TextChanged(object sender, EventArgs e)
        {

        }

        private void button1_Click(object sender, EventArgs e)
        {
            tabControl1.SelectedTab = tabPage2;
        }

        private void textBox69_TextChanged(object sender, EventArgs e)
        {
            textBox69.ReadOnly = true;
        }

        private void groupBox1_Enter(object sender, EventArgs e)
        {
        }

        private void numericUpDown1_ValueChanged(object sender, EventArgs e)
        {
            numericUpDown1.Maximum = 500;
        }

        private void trackBar1_Scroll(object sender, EventArgs e)
        {
            int trackBarValue = trackBar1.Value; 
            int numericUpDownMaxValue = 500; 

            decimal numericUpDownValue = (decimal)(trackBarValue / (float)trackBar1.Maximum) * numericUpDownMaxValue;

            numericUpDown1.Value = numericUpDownValue;
        }

        private void textBox28_TextChanged(object sender, EventArgs e)
        {
            textBox28.ReadOnly = true;
        }

        private void textBox81_TextChanged(object sender, EventArgs e)
        {
            textBox81.ReadOnly = true;
        }

        private void numericUpDown2_ValueChanged(object sender, EventArgs e)
        {
            numericUpDown2.Maximum = 500;
        }

        private void numericUpDown3_ValueChanged(object sender, EventArgs e)
        {
            numericUpDown3.Maximum = 500;
        }

        private void numericUpDown4_ValueChanged(object sender, EventArgs e)
        {
            numericUpDown4.Maximum = 500;
        }

        private void trackBarSeats_Scroll(object sender, EventArgs e)
        {
            int trackBarValue = trackBarSeats.Value;
            int numericUpDownMaxValue = 500;

            decimal numericUpDownValue = (decimal)(trackBarValue / (float)trackBar1.Maximum) * numericUpDownMaxValue;

            numericUpDown2.Value = numericUpDownValue;
        }

        private void trackBar2_Scroll(object sender, EventArgs e)
        {
            int trackBarValue = trackBar2.Value;
            int numericUpDownMaxValue = 500;

            decimal numericUpDownValue = (decimal)(trackBarValue / (float)trackBar1.Maximum) * numericUpDownMaxValue;

            numericUpDown3.Value = numericUpDownValue;
        }

        private void trackBar3_Scroll(object sender, EventArgs e)
        {
            int trackBarValue = trackBar3.Value;
            int numericUpDownMaxValue = 500;

            decimal numericUpDownValue = (decimal)(trackBarValue / (float)trackBar1.Maximum) * numericUpDownMaxValue;

            numericUpDown4.Value = numericUpDownValue;
        }

        private void button4_Click(object sender, EventArgs e)
        {
            MessageBox.Show("Application sent successfully!");
        }

        private void tabPage2_Click(object sender, EventArgs e)
        {

        }

        private void button5_Click(object sender, EventArgs e)
        {
            OpenFileDialog openFileDialog1 = new OpenFileDialog();
            openFileDialog1.Filter = "Изображения|*.jpg;*.jpeg;*.png;*.gif";
            if (openFileDialog1.ShowDialog() == DialogResult.OK)
            {
                pictureBox5.Image = Image.FromFile(openFileDialog1.FileName);

            }
        }

        private void pictureBox5_Click(object sender, EventArgs e)
        {
            if (pictureBox5.Image != null)
            {
                using (MemoryStream ms = new MemoryStream())
                {
                    pictureBox5.Image.Save(ms, ImageFormat.Png);
                    byte[] imageBytes = ms.ToArray();

                    DataContainer dataContainer = new DataContainer();
                    dataContainer.ImageBytes = imageBytes;
                }
            }
        }

        public class Purveyor
        {
            public string organization { get; set; }
            public string state { get; set; }
            public string address { get; set; }
            public string phoneNumber { get; set; }

            public Purveyor()
            {
            }

            public Purveyor(string organization, string state, string address, string phoneNumber)
            {
                this.organization = organization;
                this.state = state;
                this.address = address;
                this.phoneNumber = phoneNumber;
            }
        }

        public class Product
        {
            public string name { get; set; }
            public string inventoryNumber { get; set; }
            public int size { get; set; }
            public int weight { get; set; }
            public string type { get; set; }
            public DateTime receiptDate { get; set; }
            public int count { get; set; }
            public int price { get; set; }
            public Purveyor purveyor { get; set; }
            public string productDescription { get; set;}
            public string variety { get; set; }

            public Product()
            {
            }

            public Product(string productName, string inventoryNumberOfProduct, int sizeOfPackage, int weightOfPackage, string typeOfProduct, DateTime receiptDateOfProducts, int countOfProducts, int priceOfProducts, Purveyor infoAboutPurveyor, string productDescrip, string variety)
            {
                name = productName;
                inventoryNumber = inventoryNumberOfProduct;
                size = sizeOfPackage;
                weight = weightOfPackage;
                type = typeOfProduct;
                receiptDate = receiptDateOfProducts;
                count = countOfProducts;
                price = priceOfProducts;
                purveyor = infoAboutPurveyor;
                productDescription = productDescrip;
                variety = variety;
            }
        }

        public class DataContainer
        {
            public Purveyor Purveyor { get; set; }
            public Product Product { get; set; }
            public byte[] ImageBytes { get; set; }
            public string[][] Products { get; set; }
        }

        private void button3_Click(object sender, EventArgs e)
        {
            XmlSerializer serializer = new XmlSerializer(typeof(DataContainer));

            using (FileStream fileStream = new FileStream("data.xml", FileMode.Open))
            {
                DataContainer data = (DataContainer)serializer.Deserialize(fileStream);

                string importText = $"Purveyor Info: {Environment.NewLine}" +
                    $"Organization: {data.Purveyor.organization} {Environment.NewLine}" +
                    $"State: {data.Purveyor.state} {Environment.NewLine}" +
                    $"Address: {data.Purveyor.address} {Environment.NewLine}" +
                    $"Phone Number: {data.Purveyor.phoneNumber} {Environment.NewLine}" +
                    $"Product Info: {Environment.NewLine}" +
                    $"Name: {data.Product.name} {Environment.NewLine}" +
                    $"Inventory Number: {data.Product.inventoryNumber} {Environment.NewLine}" +
                    $"Size: {data.Product.size}{Environment.NewLine}" +
                    $"Weight: {data.Product.weight}{Environment.NewLine}" +
                    $"Type: {data.Product.type} {Environment.NewLine}" +
                    $"Receipt Date: {data.Product.receiptDate}{Environment.NewLine}" +
                    $"Count: {data.Product.count}{Environment.NewLine}" +
                    $"Price: {data.Product.price}{Environment.NewLine}" +
                    $"Product Description: {data.Product.productDescription}{Environment.NewLine}" +
                    $"Picture: successfully serialized";

                ImportList.Text = importText;
            }
        }

        private void textBox93_TextChanged(object sender, EventArgs e)
        {
            string userInput = textBox93.Text;
        }

        private void textBox87_TextChanged(object sender, EventArgs e)
        {
            
        }

        private void textBox86_TextChanged(object sender, EventArgs e)
        {
            string userInput = textBox86.Text;
        }

        private void textBox94_TextChanged(object sender, EventArgs e)
        {
            string userInput = textBox94.Text;
        }

        private void textBox88_TextChanged(object sender, EventArgs e)
        {
            textBox88.ReadOnly = true;
        }

        private void textBox84_TextChanged(object sender, EventArgs e)
        {
            textBox84.ReadOnly = true;
        }

        private void textBox71_TextChanged(object sender, EventArgs e)
        {
            textBox71.ReadOnly = true;
        }

        private void textBox76_TextChanged(object sender, EventArgs e)
        {
            textBox76.ReadOnly = true;
        }

        private void textBox83_TextChanged(object sender, EventArgs e)
        {
            textBox83.ReadOnly = true;
        }

        private void textBox70_TextChanged(object sender, EventArgs e)
        {
            textBox70.ReadOnly = true;
        }

        private void textBox79_TextChanged(object sender, EventArgs e)
        {
            textBox79.ReadOnly = true;
        }

        private void textBox85_TextChanged(object sender, EventArgs e)
        {
            textBox85.ReadOnly = true;
        }

        private void textBox78_TextChanged(object sender, EventArgs e)
        {
            textBox78.ReadOnly = true;
        }

        private void textBox72_TextChanged(object sender, EventArgs e)
        {
            textBox72.ReadOnly = true;
        }

        private void textBox80_TextChanged(object sender, EventArgs e)
        {
            textBox80.ReadOnly = true;
        }

        private void textBox92_TextChanged(object sender, EventArgs e)
        {
            textBox92.ReadOnly = true;
        }

        private void textBox73_TextChanged(object sender, EventArgs e)
        {
            textBox73.ReadOnly = true;
        }

        private void textBox74_TextChanged(object sender, EventArgs e)
        {
            textBox74.ReadOnly = true;
        }

        private void textBox95_TextChanged(object sender, EventArgs e)
        {
            textBox95.ReadOnly = true;
        }

        private void textBox90_TextChanged(object sender, EventArgs e)
        {
            textBox90.ReadOnly = true;
        }

        private void ImportList_TextChanged(object sender, EventArgs e)
        {

        }

        private void textBox2_TextChanged_1(object sender, EventArgs e)
        {
            textBox2.ReadOnly = true;
        }

        private void textBox29_TextChanged(object sender, EventArgs e)
        {
            textBox29.ReadOnly = true;
        }

        private void textBox62_TextChanged(object sender, EventArgs e)
        {
            textBox62.ReadOnly = true;
        }

        private void textBox1_TextChanged(object sender, EventArgs e)
        {
            textBox1.ReadOnly = true;
        }

        private void textBox3_TextChanged(object sender, EventArgs e)
        {
            textBox3.ReadOnly = true;
        }

        private void textBox4_TextChanged(object sender, EventArgs e)
        {
            textBox4.ReadOnly = true;
        }

        private void textBox5_TextChanged(object sender, EventArgs e)
        {
            textBox5.ReadOnly = true;
        }

        private void textBox6_TextChanged(object sender, EventArgs e)
        {
            textBox6.ReadOnly = true;
        }

        private void textBox7_TextChanged(object sender, EventArgs e)
        {
            textBox7.ReadOnly = true;
        }

        private void textBox8_TextChanged(object sender, EventArgs e)
        {
            textBox8.ReadOnly = true;
        }

        private void textBox13_TextChanged(object sender, EventArgs e)
        {
            textBox13.ReadOnly = true;
        }

        private void textBox11_TextChanged(object sender, EventArgs e)
        {
            textBox11.ReadOnly = true;
        }

        private void textBox9_TextChanged(object sender, EventArgs e)
        {
            textBox9.ReadOnly = true;
        }

        private void textBox10_TextChanged(object sender, EventArgs e)
        {
            textBox10.ReadOnly = true;
        }

        private void textBox14_TextChanged(object sender, EventArgs e)
        {
            textBox14.ReadOnly = true;
        }

        private void textBox12_TextChanged(object sender, EventArgs e)
        {
            textBox12.ReadOnly = true;
        }

        private void textBox16_TextChanged(object sender, EventArgs e)
        {
            textBox16.ReadOnly = true;
        }

        private void textBox38_TextChanged(object sender, EventArgs e)
        {
            textBox38.ReadOnly = true;
        }

        private void textBox50_TextChanged(object sender, EventArgs e)
        {
            textBox50.ReadOnly = true;
        }

        private void textBox15_TextChanged(object sender, EventArgs e)
        {
            textBox15.ReadOnly = true;
        }

        private void textBox19_TextChanged(object sender, EventArgs e)
        {
            textBox19.ReadOnly = true;
        }

        private void textBox26_TextChanged_1(object sender, EventArgs e)
        {
            textBox26.ReadOnly = true;
        }

        private void textBox40_TextChanged(object sender, EventArgs e)
        {
            textBox40.ReadOnly = true;
        }

        private void textBox37_TextChanged(object sender, EventArgs e)
        {
            textBox37.ReadOnly = true;
        }

        private void textBox34_TextChanged(object sender, EventArgs e)
        {
            textBox34.ReadOnly = true;
        }

        private void textBox52_TextChanged(object sender, EventArgs e)
        {
            textBox52.ReadOnly = true;
        }

        private void textBox49_TextChanged(object sender, EventArgs e)
        {
            textBox49.ReadOnly = true;
        }

        private void textBox46_TextChanged(object sender, EventArgs e)
        {
            textBox46.ReadOnly = true;
        }

        private void textBox21_TextChanged(object sender, EventArgs e)
        {
            textBox21.ReadOnly = true;
        }

        private void textBox20_TextChanged(object sender, EventArgs e)
        {
            textBox20.ReadOnly = true;
        }

        private void textBox25_TextChanged(object sender, EventArgs e)
        {
            textBox25.ReadOnly = true;
        }

        private void textBox23_TextChanged(object sender, EventArgs e)
        {
            textBox23.ReadOnly = true;
        }

        private void textBox22_TextChanged_1(object sender, EventArgs e)
        {
            textBox22.ReadOnly = true;
        }

        private void textBox24_TextChanged(object sender, EventArgs e)
        {
            textBox24.ReadOnly = true;
        }

        private void textBox27_TextChanged(object sender, EventArgs e)
        {
            textBox27.ReadOnly = true;
        }

        private void textBox30_TextChanged(object sender, EventArgs e)
        {
            textBox30.ReadOnly = true;
        }

        private void textBox31_TextChanged(object sender, EventArgs e)
        {
            textBox31.ReadOnly = true;
        }

        private void textBox56_TextChanged(object sender, EventArgs e)
        {
            textBox56.ReadOnly = true;
        }

        private void textBox57_TextChanged(object sender, EventArgs e)
        {
            textBox57.ReadOnly = true;
        }

        private void textBox63_TextChanged(object sender, EventArgs e)
        {
            textBox63.ReadOnly = true;
        }

        private void textBox66_TextChanged(object sender, EventArgs e)
        {
            textBox66.ReadOnly = true;
        }

        private void textBox42_TextChanged(object sender, EventArgs e)
        {
            textBox42.ReadOnly = true;
        }

        private void textBox43_TextChanged(object sender, EventArgs e)
        {
            textBox43.ReadOnly = true;
        }

        private void textBox35_TextChanged(object sender, EventArgs e)
        {
            textBox35.ReadOnly = true;
        }

        private void textBox41_TextChanged(object sender, EventArgs e)
        {
            textBox41.ReadOnly = true;
        }

        private void textBox39_TextChanged(object sender, EventArgs e)
        {
            textBox39.ReadOnly = true;
        }

        private void textBox36_TextChanged(object sender, EventArgs e)
        {
            textBox36.ReadOnly = true;
        }

        private void textBox33_TextChanged(object sender, EventArgs e)
        {
            textBox33.ReadOnly = true;
        }

        private void textBox32_TextChanged(object sender, EventArgs e)
        {
            textBox32.ReadOnly = true;
        }

        private void textBox17_TextChanged(object sender, EventArgs e)
        {
            textBox17.ReadOnly = true;
        }

        private void textBox59_TextChanged(object sender, EventArgs e)
        {
            textBox59.ReadOnly = true;
        }

        private void textBox58_TextChanged(object sender, EventArgs e)
        {
            textBox58.ReadOnly = true;
        }

        private void textBox64_TextChanged(object sender, EventArgs e)
        {
            textBox64.ReadOnly = true;
        }

        private void textBox67_TextChanged(object sender, EventArgs e)
        {
            textBox67.ReadOnly = true;
        }

        private void textBox54_TextChanged(object sender, EventArgs e)
        {
            textBox54.ReadOnly = true;
        }

        private void textBox55_TextChanged(object sender, EventArgs e)
        {
            textBox55.ReadOnly = true;
        }

        private void textBox47_TextChanged(object sender, EventArgs e)
        {
            textBox47.ReadOnly = true;
        }

        private void textBox53_TextChanged(object sender, EventArgs e)
        {
            textBox53.ReadOnly = true;
        }

        private void textBox51_TextChanged(object sender, EventArgs e)
        {
            textBox51.ReadOnly = true;
        }

        private void textBox48_TextChanged(object sender, EventArgs e)
        {
            textBox48.ReadOnly = true;
        }

        private void textBox45_TextChanged(object sender, EventArgs e)
        {
            textBox45.ReadOnly = true;
        }

        private void textBox44_TextChanged(object sender, EventArgs e)
        {
            textBox44.ReadOnly = true;
        }

        private void textBox18_TextChanged(object sender, EventArgs e)
        {
            textBox18.ReadOnly = true;
        }

        private void textBox61_TextChanged(object sender, EventArgs e)
        {
            textBox61.ReadOnly = true;
        }

        private void textBox60_TextChanged(object sender, EventArgs e)
        {
            textBox60.ReadOnly = true;
        }

        private void textBox65_TextChanged(object sender, EventArgs e)
        {
            textBox65.ReadOnly = true;
        }

        private void textBox68_TextChanged(object sender, EventArgs e)
        {
            textBox68.ReadOnly = true;
        }

        private void textBox75_TextChanged(object sender, EventArgs e)
        {
            string userInput = textBox75.Text;
        }

        private void textBox89_TextChanged(object sender, EventArgs e)
        {
            string userInput = textBox89.Text;
        }

        private void textBox82_TextChanged(object sender, EventArgs e)
        {
            
        }

        private void textBox77_TextChanged(object sender, EventArgs e)
        {
            
        }

        private void radioButton1_CheckedChanged(object sender, EventArgs e)
        {

        }

        private void radioButton2_CheckedChanged(object sender, EventArgs e)
        {

        }

        private void radioButton3_CheckedChanged(object sender, EventArgs e)
        {

        }

        private void dateTimePicker1_ValueChanged(object sender, EventArgs e)
        {

        }

        private void button4_Click_1(object sender, EventArgs e)
        {
            tabControl1.SelectedTab = tabPage3;
        }

        public class StorekeeperDataContainer
        {
            public string FirstName { get; set; }
            public string LastName { get; set; }
            public string PhoneNumber { get; set; }
            public string Experience { get; set; }
            public string Address { get; set; }

            public StorekeeperDataContainer()
            {
            }

            public StorekeeperDataContainer(string FirstName, string LastName, string PhoneNumber, string Experience)
            {
                this.FirstName = FirstName;
                this.LastName = LastName;
                this.PhoneNumber = PhoneNumber;
                this.Experience = Experience;
                this.Address = Address;

                if (string.IsNullOrWhiteSpace(FirstName))
                {
                    MessageBox.Show("Please enter a first name!", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                    return;
                }

                if (string.IsNullOrWhiteSpace(LastName))
                {
                    MessageBox.Show("Please enter a last name!", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                    return;
                }

                if (string.IsNullOrWhiteSpace(LastName))
                {
                    MessageBox.Show("Please enter a phone number!", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                    return;
                }

                if (string.IsNullOrWhiteSpace(Experience))
                {
                    MessageBox.Show("Please enter an experience!", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                    return;
                }

                if (string.IsNullOrWhiteSpace(Address))
                {
                    MessageBox.Show("Please enter an adress!", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                    return;
                }
            }
        }

        private void textBox97_TextChanged(object sender, EventArgs e)
        {

        }

        private void textBox99_TextChanged(object sender, EventArgs e)
        {

        }

        private void textBox98_TextChanged(object sender, EventArgs e)
        {
            textBox98.ReadOnly = true;
        }

        private void textBox100_TextChanged(object sender, EventArgs e)
        {
            textBox100.ReadOnly = true;
        }

        private void textBox104_TextChanged(object sender, EventArgs e)
        {
            textBox104.ReadOnly = true;
        }

        private void textBox102_TextChanged(object sender, EventArgs e)
        {
            textBox102.ReadOnly = true;
        }

        private void textBox106_TextChanged(object sender, EventArgs e)
        {
            textBox106.ReadOnly = true;
        }

        private void button7_Click(object sender, EventArgs e)
        {
            string firstName = textBox97.Text;
            string lastName = textBox99.Text;
            string address = textBox103.Text;
            string phoneNumber = textBox101.Text;
            string experience = textBox105.Text;

            var data = new StorekeeperDataContainer
            {
                FirstName = firstName,
                LastName = lastName,
                Address = address,
                PhoneNumber = phoneNumber,
                Experience = experience
            };

            var serializer = new XmlSerializer(typeof(StorekeeperDataContainer));

            using (var writer = new StreamWriter("userData.xml"))
            {
                serializer.Serialize(writer, data);
            }

            MessageBox.Show("Data serialized into XML file.");
        }

        private void button6_Click(object sender, EventArgs e)
        {
            XmlSerializer serializer = new XmlSerializer(typeof(StorekeeperDataContainer));

            using (FileStream fileStream = new FileStream("userData.xml", FileMode.Open))
            {
                StorekeeperDataContainer data = (StorekeeperDataContainer)serializer.Deserialize(fileStream);

                string importText = $"Purveyor Info: {Environment.NewLine}" +
                    $"First name: {data.FirstName}{Environment.NewLine}" +
                    $"Last name: {data.LastName}{Environment.NewLine}" +
                    $"Address: {data.Address}{Environment.NewLine}" +
                    $"Phone number: {data.PhoneNumber}{Environment.NewLine}" +
                    $"Experience: {data.Experience}";

                textBox107.Text = importText;
            }
        }

        private void tabPage3_Click(object sender, EventArgs e)
        {

        }

        private void textBox105_TextChanged(object sender, EventArgs e)
        {

        }

        private void textBox101_TextChanged(object sender, EventArgs e)
        {

        }

        private void textBox103_TextChanged(object sender, EventArgs e)
        {

        }

        private void textBox107_TextChanged(object sender, EventArgs e)
        {
        }

        private void panel4_Paint(object sender, PaintEventArgs e)
        {

        }

        private void textBox96_TextChanged(object sender, EventArgs e)
        {
            textBox96.ReadOnly = true;
        }

        private void button8_Click(object sender, EventArgs e)
        {
            tabControl1.SelectedTab = tabPage4;
        }

        private void rToolStripMenuItem_Click(object sender, EventArgs e)
        {
            tabControl1.SelectedTab = tabPage5;
        }

        private void aboutAProgrammToolStripMenuItem_Click(object sender, EventArgs e)
        {
            tabControl1.SelectedTab = tabPage4;
        }

        private void textBox110_TextChanged(object sender, EventArgs e)
        {
            textBox110.ReadOnly = true;
        }

        private void byPriceRangeToolStripMenuItem_Click(object sender, EventArgs e)
        {
            tabControl1.SelectedTab = tabPage4;

            var inputForm = new Form();
            inputForm.Text = "Введите диапазон цен";

            var minTextBox = new System.Windows.Forms.TextBox();
            minTextBox.Location = new System.Drawing.Point(10, 10);
            minTextBox.Size = new System.Drawing.Size(150, 20);

            var maxTextBox = new System.Windows.Forms.TextBox();
            maxTextBox.Location = new System.Drawing.Point(10, 40);
            maxTextBox.Size = new System.Drawing.Size(150, 20);

            var okButton = new System.Windows.Forms.Button();
            okButton.Text = "ОК";
            okButton.Location = new System.Drawing.Point(10, 70);
            okButton.Click += (s, args) =>
            {
                string minPrice = minTextBox.Text;
                string maxPrice = maxTextBox.Text;

                if (!string.IsNullOrEmpty(minPrice) && !string.IsNullOrEmpty(maxPrice)
                    && System.Text.RegularExpressions.Regex.IsMatch(minPrice, @"^[\d,]+$")
                    && System.Text.RegularExpressions.Regex.IsMatch(maxPrice, @"^[\d,]+$"))
                {
                    tabControl1.SelectedTab = tabPage4;

                    ShowInvNumbersInRange(minPrice, maxPrice);

                    inputForm.Close();
                }
                else
                {
                    MessageBox.Show("Пожалуйста, введите корректный диапазон цен. Используйте только цифры и запятые.");
                }
            };

            inputForm.Controls.Add(minTextBox);
            inputForm.Controls.Add(maxTextBox);
            inputForm.Controls.Add(okButton);

            inputForm.ShowDialog();
        }

        private void ShowInvNumbersInRange(string minPrice, string maxPrice)
        {
            List<string> invNumbersInRange = new List<string>();

            foreach (string[] product in products)
            {
                string price = product[5];

                if (IsPriceInRange(price, minPrice, maxPrice))
                {
                    string invNumber = product[0];
                    invNumbersInRange.Add(invNumber);
                }
            }

            if (invNumbersInRange.Count > 0)
            {
                string result = string.Join(", ", invNumbersInRange);
                MessageBox.Show(result, "InvNumbers в указанном диапазоне цен");

                SaveDataToFile(invNumbersInRange);
            }
            else
            {
                MessageBox.Show("Nothing found", "Результат");
            }
        }

        private void SaveDataToFile(List<string> data)
        {
            string filePath = "results.xml";

            bool fileExists = File.Exists(filePath);

            List<string> existingData = new List<string>();
            if (fileExists)
            {
                ResultData existingResultData;
                using (StreamReader reader = new StreamReader(filePath))
                {
                    XmlSerializer serializer = new XmlSerializer(typeof(ResultData));
                    existingResultData = (ResultData)serializer.Deserialize(reader);
                }
                existingData = existingResultData.InvNumbers;
            }

            existingData.AddRange(data);

            ResultData resultData = new ResultData()
            {
                Type = "PriceRange",
                InvNumbers = existingData
            };

            XmlSerializer xmlSerializer = new XmlSerializer(typeof(ResultData));
            using (TextWriter writer = new StreamWriter(filePath))
            {
                xmlSerializer.Serialize(writer, resultData);
            }
        }

        private bool IsPriceInRange(string price, string minPrice, string maxPrice)
        {
            decimal parsedPrice;
            decimal parsedMinPrice;
            decimal parsedMaxPrice;

            bool isPriceValid = decimal.TryParse(price, out parsedPrice);
            bool isMinPriceValid = decimal.TryParse(minPrice, out parsedMinPrice);
            bool isMaxPriceValid = decimal.TryParse(maxPrice, out parsedMaxPrice);

            if (isPriceValid && isMinPriceValid && isMaxPriceValid)
            {
                if (parsedPrice >= parsedMinPrice && parsedPrice <= parsedMaxPrice)
                {
                    return true;
                }
            }

            return false;
        }

        private void byTypeToolStripMenuItem_Click(object sender, EventArgs e)
        {
            tabControl1.SelectedTab = tabPage4;
            var inputForm = new Form();
            inputForm.Text = "Введите тип";

            var textBox = new System.Windows.Forms.TextBox();
            textBox.Location = new System.Drawing.Point(10, 10);
            textBox.Size = new System.Drawing.Size(150, 20);

            var okButton = new System.Windows.Forms.Button();
            okButton.Text = "ОК";
            okButton.Location = new System.Drawing.Point(10, 40);
            okButton.Click += (s, args) =>
            {
                string type = textBox.Text;

                if (!string.IsNullOrEmpty(type))
                {
                    tabControl1.SelectedTab = tabPage4;

                    ShowInvNumbersByType(type);

                    inputForm.Close();
                }
                else
                {
                    MessageBox.Show("Пожалуйста, введите тип");
                }
            };

            inputForm.Controls.Add(textBox);
            inputForm.Controls.Add(okButton);

            inputForm.ShowDialog();
            lastAction = "Поиск по типу";
        }

        private void ShowInvNumbersByType(string type)
        {
            List<string> invNumbersByType = new List<string>();

            foreach (string[] product in products)
            {
                string productType = product[12];

                if (productType.Equals(type, StringComparison.OrdinalIgnoreCase))
                {
                    string invNumber = product[0];
                    invNumbersByType.Add(invNumber);
                }
            }

            if (invNumbersByType.Count > 0)
            {
                string result = string.Join(", ", invNumbersByType);
                MessageBox.Show(result, "InvNumbers для типа " + type);

                SaveDataToFile(invNumbersByType, type);
            }
            else
            {
                MessageBox.Show("Nothing found", "Результат");
            }
        }

        private void SaveDataToFile(List<string> data, string type)
        {
            ResultData resultData = new ResultData()
            {
                Type = type,
                InvNumbers = data
            };

            string xmlFilePath = "results.xml";
            XmlSerializer xmlSerializer = new XmlSerializer(typeof(ResultData));
            using (TextWriter writer = new StreamWriter(xmlFilePath))
            {
                xmlSerializer.Serialize(writer, resultData);
            }
        }

        [Serializable]
        public class ResultData
        {
            public string Type { get; set; }
            public List<string> InvNumbers { get; set; }
        }

        private void textBox127_TextChanged(object sender, EventArgs e)
        {
            textBox127.ReadOnly = true;
        }

        private void textBox128_TextChanged(object sender, EventArgs e)
        {
            textBox128.ReadOnly = true;
        }

        private void textBox130_TextChanged(object sender, EventArgs e)
        {
            textBox130.ReadOnly = true;
        }

        private void textBox129_TextChanged(object sender, EventArgs e)
        {
            textBox129.ReadOnly = true;
        }

        private void textBox132_TextChanged(object sender, EventArgs e)
        {
            textBox132.ReadOnly = true;
        }

        private void textBox131_TextChanged(object sender, EventArgs e)
        {
            textBox131.ReadOnly = true;
        }

        private void groupBox2_Enter(object sender, EventArgs e)
        {
            
        }

        private void radioButton6_CheckedChanged(object sender, EventArgs e)
        {

        }

        private void toolStripMenuItem1_Click(object sender, EventArgs e)
        {

        }

        private void textBox120_TextChanged(object sender, EventArgs e)
        {

        }

        private void button8_Click_1(object sender, EventArgs e)
        {

        }


        private void textBox97_TextChanged_1(object sender, EventArgs e)
        {

        }

        private void sortByToolStripMenuItem_Click(object sender, EventArgs e)
        {

        }
        private void receiptDateNNMMYYYYToolStripMenuItem_Click(object sender, EventArgs e)
        {
            var inputForm = new Form();
            inputForm.Text = "Write data in format xx.xx.xxxx";

            var textBox = new System.Windows.Forms.TextBox();
            textBox.Location = new System.Drawing.Point(10, 10);
            textBox.Size = new System.Drawing.Size(150, 20);

            var okButton = new System.Windows.Forms.Button();
            okButton.Text = "ОК";
            okButton.Location = new System.Drawing.Point(10, 40);
            okButton.Click += (s, args) =>
            {
                string input = textBox.Text;
                if (System.Text.RegularExpressions.Regex.IsMatch(input, @"^\d{2}\.\d{2}\.\d{4}$"))
                {
                    MessageBox.Show("Data: " + input);
                    inputForm.Close(); 
                }
                else
                {
                    MessageBox.Show("Incorrect input of date. Try again");
                }
            };

            inputForm.Controls.Add(textBox);
            inputForm.Controls.Add(okButton);

            inputForm.ShowDialog();
        }



        private void button2_Click_1(object sender, EventArgs e)
        {
            string organization = textBox93.Text;
            string state = textBox87.Text;
            string address = textBox86.Text;
            string phoneNumber = textBox94.Text;
            string variety = textBox82.Text;

            string productName = textBox75.Text;
            string productDescription = textBox89.Text;
            string inventoryNumber = textBox77.Text;
            int size = (int)numericUpDown2.Value;
            int weight = (int)numericUpDown1.Value;
            string type = textBox82.Text;
            DateTime date = dateTimePicker1.Value;
            int price = (int)numericUpDown4.Value;
            int count = (int)numericUpDown3.Value;

            if (string.IsNullOrWhiteSpace(organization))
            {
                MessageBox.Show("Please enter an organization name!", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                return;
            }
            if (string.IsNullOrWhiteSpace(variety))
            {
                MessageBox.Show("Please enter a variety!", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                return;
            }
            if (string.IsNullOrWhiteSpace(state))
            {
                MessageBox.Show("Please enter a state!", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                return;
            }
            if (string.IsNullOrWhiteSpace(address))
            {
                MessageBox.Show("Please enter an address!", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                return;
            }
            if (string.IsNullOrWhiteSpace(phoneNumber))
            {
                MessageBox.Show("Please enter a phoneNumber!", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                return;
            }

            if (string.IsNullOrWhiteSpace(productName))
            {
                MessageBox.Show("Please enter a product name!", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                return;
            }
            if (string.IsNullOrWhiteSpace(productDescription))
            {
                MessageBox.Show("Please enter a product description!", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                return;
            }
            if (string.IsNullOrWhiteSpace(inventoryNumber))
            {
                MessageBox.Show("Please enter an inventoryNumber!", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                return;
            }
            if (string.IsNullOrWhiteSpace(type))
            {
                MessageBox.Show("Please enter a type of product!", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                return;
            }
            if (size == 0)
            {
                MessageBox.Show("Please enter a size!", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                return;
            }
            if (weight == 0)
            {
                MessageBox.Show("Please enter a weight!", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                return;
            }
            if (price == 0)
            {
                MessageBox.Show("Please enter a price!", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                return;
            }
            if (count == 0)
            {
                MessageBox.Show("Please enter a count!", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                return;
            }

            Purveyor purveyor = new Purveyor(organization, state, address, phoneNumber);
            Product product = new Product(productName, inventoryNumber, size, weight, type, date, count, price, purveyor, productDescription, variety);

            DataContainer data = new DataContainer
            {
                Purveyor = purveyor,
                Product = product
            };

            if (pictureBox5.Image != null)
            {
                using (MemoryStream ms = new MemoryStream())
                {
                    pictureBox5.Image.Save(ms, ImageFormat.Png);
                    byte[] imageBytes = ms.ToArray();

                    data.ImageBytes = imageBytes;
                }
            }

            string[][] products = new string[][]
            {
            new string[]
            {
            inventoryNumber, productName, variety, size.ToString(), weight.ToString(),
            price.ToString(), date.ToString("dd.MM.yyyy"), date.ToString("HH:mm"), count.ToString(),
            organization, state, type
            }
            };

            data.Products = products;

            XmlSerializer serializer = new XmlSerializer(typeof(DataContainer));

            using (FileStream fileStream = new FileStream("data.xml", FileMode.Create))
            {
                serializer.Serialize(fileStream, data);
            }

            MessageBox.Show("Data serialized into XML file.");
        }

        private void button7_Click_1(object sender, EventArgs e)
        {

        }

        private void textBox75_TextChanged_1(object sender, EventArgs e)
        {
            string userInput = textBox75.Text;
        }

        private void menuStrip1_ItemClicked(object sender, ToolStripItemClickedEventArgs e)
        {

        }

        private void textBox89_TextChanged_1(object sender, EventArgs e)
        {
            string userInput = textBox89.Text;
        }

        private void companyToolStripMenuItem_Click(object sender, EventArgs e)
        {
            var inputForm = new Form();
            inputForm.Text = "Write variety";

            var textBox = new System.Windows.Forms.TextBox();
            textBox.Location = new System.Drawing.Point(10, 10);
            textBox.Size = new System.Drawing.Size(150, 20);

            var okButton = new System.Windows.Forms.Button();
            okButton.Text = "ОК";
            okButton.Location = new System.Drawing.Point(10, 40);
            okButton.Click += (s, args) =>
            {
                string input = textBox.Text;
                    MessageBox.Show("Variety: " + input);
                    inputForm.Close();
            };

            inputForm.Controls.Add(textBox);
            inputForm.Controls.Add(okButton);

            inputForm.ShowDialog();
        }

        private void byCompanyToolStripMenuItem_Click(object sender, EventArgs e)
        {
            var inputForm = new Form();
            inputForm.Text = "Write company";

            var textBox = new System.Windows.Forms.TextBox();
            textBox.Location = new System.Drawing.Point(10, 10);
            textBox.Size = new System.Drawing.Size(150, 20);

            var okButton = new System.Windows.Forms.Button();
            okButton.Text = "ОК";
            okButton.Location = new System.Drawing.Point(10, 40);
            okButton.Click += (s, args) =>
            {
                string input = textBox.Text;
                ShowInvNumbersByCompany(input);
                inputForm.Close();
            };

            inputForm.Controls.Add(textBox);
            inputForm.Controls.Add(okButton);

            inputForm.ShowDialog();
        }

        private void ShowInvNumbersByCompany(string companyName)
        {
            List<string> invNumbersByCompany = new List<string>();

            foreach (string[] product in products)
            {
                string account = product[10];

                if (account.Equals(companyName, StringComparison.OrdinalIgnoreCase))
                {
                    string invNumber = product[0];
                    invNumbersByCompany.Add(invNumber);
                }
            }

            if (invNumbersByCompany.Count > 0)
            {
                string result = string.Join(", ", invNumbersByCompany);
                MessageBox.Show(result, "InvNumbers для компании " + companyName);

                SaveDataToFile_1(invNumbersByCompany);
            }
            else
            {
                MessageBox.Show("Nothing found", "Результат");
            }
        }

        private void SaveDataToFile_1(List<string> data)
        {
            string filePath = "results.xml";

            bool fileExists = File.Exists(filePath);

            List<string> existingData = new List<string>();
            if (fileExists)
            {
                ResultData existingResultData;
                using (StreamReader reader = new StreamReader(filePath))
                {
                    XmlSerializer xmalSerializer = new XmlSerializer(typeof(ResultData));
                    existingResultData = (ResultData)xmalSerializer.Deserialize(reader);
                }
                existingData = existingResultData.InvNumbers;
            }

            existingData.AddRange(data);

            ResultData resultData = new ResultData()
            {
                Type = "Company",
                InvNumbers = existingData
            };

            XmlSerializer xmlSerializer = new XmlSerializer(typeof(ResultData));
            using (TextWriter writer = new StreamWriter(filePath))
            {
                xmlSerializer.Serialize(writer, resultData);
            }
        }

        private void button1_Click_1(object sender, EventArgs e)
        {
            tabControl1.SelectedTab = tabPage2;
        }

        private void button4_Click_2(object sender, EventArgs e)
        {
            tabControl1.SelectedTab = tabPage3;
        }

        private void textBox93_TextChanged_1(object sender, EventArgs e)
        {
            string userInput = textBox93.Text;
        }

        private void textBox87_TextChanged_1(object sender, EventArgs e)
        {
            string userInput = textBox87.Text;
        }

        private void textBox86_TextChanged_1(object sender, EventArgs e)
        {
            string userInput = textBox86.Text;
        }

        private void textBox94_TextChanged_1(object sender, EventArgs e)
        {
            string userInput = textBox94.Text;
        }

        private void numericUpDown1_ValueChanged_1(object sender, EventArgs e)
        {
            numericUpDown1.Maximum = 500;
        }

        private void numericUpDown2_ValueChanged_1(object sender, EventArgs e)
        {
            numericUpDown2.Maximum = 500;
        }

        private void numericUpDown3_ValueChanged_1(object sender, EventArgs e)
        {
            numericUpDown3.Maximum = 500;
        }

        private void numericUpDown4_ValueChanged_1(object sender, EventArgs e)
        {
            numericUpDown4.Maximum = 500;
        }

        private void textBox82_TextChanged_1(object sender, EventArgs e)
        {
            string userInput = textBox82.Text;
        }

        private void textBox77_TextChanged_1(object sender, EventArgs e)
        {
            string userInput = textBox77.Text;
        }

        private void button3_Click_1(object sender, EventArgs e)
        {
            XmlSerializer serializer = new XmlSerializer(typeof(DataContainer));

            using (FileStream fileStream = new FileStream("data.xml", FileMode.Open))
            {
                DataContainer data = (DataContainer)serializer.Deserialize(fileStream);

                string importText = $"Purveyor Info: {Environment.NewLine}" +
                    $"Organization: {data.Purveyor.organization} {Environment.NewLine}" +
                    $"State: {data.Purveyor.state} {Environment.NewLine}" +
                    $"Address: {data.Purveyor.address} {Environment.NewLine}" +
                    $"Phone Number: {data.Purveyor.phoneNumber} {Environment.NewLine}" +
                    $"Product Info: {Environment.NewLine}" +
                    $"Name: {data.Product.name} {Environment.NewLine}" +
                    $"Inventory Number: {data.Product.inventoryNumber} {Environment.NewLine}" +
                    $"Size: {data.Product.size}{Environment.NewLine}" +
                    $"Weight: {data.Product.weight}{Environment.NewLine}" +
                    $"Type: {data.Product.type} {Environment.NewLine}" +
                    $"Receipt Date: {data.Product.receiptDate}{Environment.NewLine}" +
                    $"Count: {data.Product.count}{Environment.NewLine}" +
                    $"Price: {data.Product.price}{Environment.NewLine}" +
                    $"Product Description: {data.Product.productDescription}{Environment.NewLine}" +
                    $"Variety: {data.Product.productDescription}{Environment.NewLine}" +
                    $"Picture: successfully serialized";

                ImportList.Text = importText;
            }
        }

        private void trackBar1_Scroll_1(object sender, EventArgs e)
        {
            int trackBarValue = trackBar1.Value;
            int numericUpDownMaxValue = 500;

            decimal numericUpDownValue = (decimal)(trackBarValue / (float)trackBar1.Maximum) * numericUpDownMaxValue;

            numericUpDown1.Value = numericUpDownValue;
        }

        private void trackBarSeats_Scroll_1(object sender, EventArgs e)
        {
            int trackBarValue = trackBarSeats.Value;
            int numericUpDownMaxValue = 500;

            decimal numericUpDownValue = (decimal)(trackBarValue / (float)trackBar1.Maximum) * numericUpDownMaxValue;

            numericUpDown2.Value = numericUpDownValue;
        }

        private void trackBar2_Scroll_1(object sender, EventArgs e)
        {
            int trackBarValue = trackBar2.Value;
            int numericUpDownMaxValue = 500;

            decimal numericUpDownValue = (decimal)(trackBarValue / (float)trackBar1.Maximum) * numericUpDownMaxValue;

            numericUpDown3.Value = numericUpDownValue;
        }

        private void trackBar3_Scroll_1(object sender, EventArgs e)
        {
            int trackBarValue = trackBar3.Value;
            int numericUpDownMaxValue = 500;

            decimal numericUpDownValue = (decimal)(trackBarValue / (float)trackBar1.Maximum) * numericUpDownMaxValue;

            numericUpDown4.Value = numericUpDownValue;
        }
        private void tabPage5_Click(object sender, EventArgs e)
        {

        }

        private void textBox123_TextChanged(object sender, EventArgs e)
        {

        }
        private void textBox140_TextChanged(object sender, EventArgs e)
        {

        }
        private void textBox143_TextChanged(object sender, EventArgs e)
        {

        }

        private void textBox2_TextChanged_2(object sender, EventArgs e)
        {

        }

        private void textBox112_TextChanged(object sender, EventArgs e)
        {
            textBox112.ReadOnly = true;
        }

        private void textBox109_TextChanged(object sender, EventArgs e)
        {
            textBox109.ReadOnly = true;
        }

        private void textBox108_TextChanged(object sender, EventArgs e)
        {
            textBox108.ReadOnly = true;
        }

        private void textBox111_TextChanged(object sender, EventArgs e)
        {
            textBox111.ReadOnly = true;
        }

        private void textBox115_TextChanged(object sender, EventArgs e)
        {
            textBox115.ReadOnly = true;
        }

        private void textBox116_TextChanged(object sender, EventArgs e)
        {
            textBox116.ReadOnly = true;
        }

        private void textBox114_TextChanged(object sender, EventArgs e)
        {
            textBox114.ReadOnly = true;
        }
        private void textBox119_TextChanged(object sender, EventArgs e)
        {
            textBox119.ReadOnly = true;
        }

        private void button8_Click_2(object sender, EventArgs e)
        {
            Table.Sort(Table.Columns[0], ListSortDirection.Ascending);
        }

        private void button9_Click(object sender, EventArgs e)
        {
            Table.Sort(Table.Columns[1], ListSortDirection.Ascending);
        }

        private void button10_Click_1(object sender, EventArgs e)
        {
            Table.Sort(Table.Columns[2], ListSortDirection.Ascending);
        }

        private void backToolStripMenuItem_Click(object sender, EventArgs e)
        {
            if (tabControl1.SelectedIndex > 0)
            {
                tabControl1.SelectedIndex -= 1;
            }
                
        }

        private void fourthToolStripMenuItem_Click(object sender, EventArgs e)
        {
            if (tabControl1.SelectedIndex < tabControl1.TabCount - 1)
            {
                tabControl1.SelectedIndex += 1;
            }   
        }

        private void sortToolStripMenuItem_Click(object sender, EventArgs e)
        {

        }

        private void clearToolStripMenuItem_Click(object sender, EventArgs e)
        {
            if (tabControl1.SelectedTab == tabPage2)
            {
                textBox75.Clear();
                textBox89.Clear();
                textBox82.Clear();
                numericUpDown1.Value = 0;
                numericUpDown2.Value = 0;
                numericUpDown3.Value = 0;
                numericUpDown4.Value = 0;
                textBox77.Clear();
                textBox93.Clear();
                textBox87.Clear();
                textBox86.Clear();
                textBox94.Clear();
                pictureBox5.Image = null;
            }
            if (tabControl1.SelectedTab == tabPage2)
            {
                textBox97.Clear();
                textBox99.Clear();
                textBox103.Clear();
                textBox101.Clear();
                textBox105.Clear();
                textBox107.Clear();
            }
            if (tabControl1.SelectedTab == tabPage3)
            {
                textBox97.Clear();
                textBox99.Clear();
                textBox103.Clear();
                textBox101.Clear();
                textBox105.Clear();
                textBox107.Clear();
            }
        }

        private void tabPage2_Click_1(object sender, EventArgs e)
        {

        }

        private void pictureBox5_Click_1(object sender, EventArgs e)
        {

        }

        private void textBox99_TextChanged_1(object sender, EventArgs e)
        {

        }

        private void textBox103_TextChanged_1(object sender, EventArgs e)
        {

        }

        private void textBox101_TextChanged_1(object sender, EventArgs e)
        {

        }

        private void textBox105_TextChanged_1(object sender, EventArgs e)
        {

        }

        private void textBox107_TextChanged_1(object sender, EventArgs e)
        {

        }

        private void Table_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {

        }

        private void textBox113_TextChanged(object sender, EventArgs e)
        {
            textBox113.Text = DateTime.Now.ToString("dd.MM.yyyy HH:mm:ss");
        }

        private void textBox117_TextChanged(object sender, EventArgs e)
        {
            textBox1.Text = DateTime.Now.ToString("dd.MM.yyyy HH:mm:ss");
        }

       

      

       

        private void hideToolStripMenuItem_Click(object sender, EventArgs e)
        {
            toolStripMenuItem1.Visible = false;
            aboutAProgrammToolStripMenuItem.Visible = false;
            backToolStripMenuItem.Visible = false;
            fourthToolStripMenuItem.Visible = false;
            clearToolStripMenuItem.Visible = false;
            hideToolStripMenuItem.Visible = false;
            showToolStripMenuItem.Visible = true;
        }

        private void showToolStripMenuItem_Click(object sender, EventArgs e)
        {
            toolStripMenuItem1.Visible = true;
            aboutAProgrammToolStripMenuItem.Visible = true;
            backToolStripMenuItem.Visible = true;
            fourthToolStripMenuItem.Visible = true;
            clearToolStripMenuItem.Visible = true;
            hideToolStripMenuItem.Visible = true;
            showToolStripMenuItem.Visible = false;
        }

        private void menuStrip3_ItemClicked(object sender, ToolStripItemClickedEventArgs e)
        {

        }

        private void textBox113_TextChanged_1(object sender, EventArgs e)
        {
            
        }

        public string lastAction = "";

        private void button11_Click(object sender, EventArgs e)
        {
            textBox113.Text = $"Последнее действие: {lastAction}\r\nТекущая дата и время: {DateTime.Now}";
        }
    }
}

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
using static System.Windows.Forms.VisualStyles.VisualStyleElement;

namespace LBR_02
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
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

            public Product()
            {
            }

            public Product(string productName, string inventoryNumberOfProduct, int sizeOfPackage, int weightOfPackage, string typeOfProduct, DateTime receiptDateOfProducts, int countOfProducts, int priceOfProducts, Purveyor infoAboutPurveyor, string productDescrip)
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
            }
        }

        public class DataContainer
        {
            public Purveyor Purveyor { get; set; }
            public Product Product { get; set; }
            public byte[] ImageBytes { get; set; }
        }

        private void button2_Click(object sender, EventArgs e)
        {
            string organization = textBox93.Text;
            string state = textBox87.Text;
            string address = textBox86.Text;
            string phoneNumber = textBox94.Text;

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
            if (size == null)
            {
                MessageBox.Show("Please enter a size!", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                return;
            }
            if (weight == null)
            {
                MessageBox.Show("Please enter a weight!", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                return;
            }
            if (price == null)
            {
                MessageBox.Show("Please enter a price!", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                return;
            }
            if (count == null)
            {
                MessageBox.Show("Please enter a count!", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                return;
            }

            Purveyor purveyor = new Purveyor(organization, state, address, phoneNumber);
            Product product = new Product(productName, inventoryNumber, size, weight, type, date, count, price, purveyor, productDescription);

            DataContainer data = new DataContainer
            {
                Purveyor = purveyor,
                Product = product
            };

            XmlSerializer serializer = new XmlSerializer(typeof(DataContainer));

            using (FileStream fileStream = new FileStream("data.xml", FileMode.Create))
            {
                serializer.Serialize(fileStream, data);
            }

            if (pictureBox5.Image != null)
            {
                using (MemoryStream ms = new MemoryStream())
                {
                    pictureBox5.Image.Save(ms, ImageFormat.Png);
                    byte[] imageBytes = ms.ToArray();
                    
                    data.ImageBytes = imageBytes;
                }
            }

            MessageBox.Show("Data serialized into XML file.");
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
    }
}

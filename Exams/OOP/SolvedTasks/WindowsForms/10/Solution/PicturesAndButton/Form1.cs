using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace PicturesAndButton
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        private void button1_Click(object sender, EventArgs e)
        {

            string imagePath = "";
            if (pictureBox1.Image == null)
            {
                imagePath = "Images/HELLOKITTY.jpg";
                Image image = Image.FromFile(imagePath);
                pictureBox1.Image = image;
            }
            else if (pictureBox2.Image == null)
            {
                imagePath = "Images/VOLK.jfif";
                Image image = Image.FromFile(imagePath);
                pictureBox2.Image = image;
            }
            else if (pictureBox3.Image == null)
            {
                imagePath = "Images/ZAIKA.jfif";
                Image image = Image.FromFile(imagePath);
                pictureBox3.Image = image;
            }
            else if (pictureBox4.Image == null)
            {
                imagePath = "Images/ZAIKA_2.jfif";
                Image image = Image.FromFile(imagePath);
                pictureBox4.Image = image;
            }
        }
    }
}

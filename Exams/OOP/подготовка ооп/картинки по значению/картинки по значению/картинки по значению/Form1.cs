using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace картинки_по_значению
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        private void numericUpDown1_ValueChanged(object sender, EventArgs e)
        {
            int selectednum = (int)numericUpDown1.Value;
            if (selectednum == 1) {
                pictureBox1.Image = new Bitmap("C:\\Users\\glebs\\Downloads\\1.jpg");
                    }
            if (selectednum == 2)
            {
                pictureBox1.Image = new Bitmap("C:\\Users\\glebs\\Downloads\\2.jpg");
            }
        }
    }
}

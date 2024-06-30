using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace кратинки_пересоздать
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            OpenFileDialog dialog = new OpenFileDialog();

            if (dialog.ShowDialog() == DialogResult.OK)
            {
                pictureBox1.ImageLocation = dialog.FileName;
            }
        }



        private void button2_Click_1(object sender, EventArgs e)
        {
            SaveFileDialog saveFileDialog = new SaveFileDialog();

            if (saveFileDialog.ShowDialog() == DialogResult.OK)
            {
                pictureBox1.Image.Save(saveFileDialog.FileName);
            }
        }
    }
}

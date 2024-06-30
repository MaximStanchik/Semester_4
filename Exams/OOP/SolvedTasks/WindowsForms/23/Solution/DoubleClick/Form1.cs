using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace DoubleClick
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
            listBox1.DoubleClick += listBox1_DoubleClick;
            listBox2.DoubleClick += listBox2_DoubleCLick;
        }
         

        private void listBox1_DoubleClick(object sender, EventArgs e)
        {
            string userSelectedElement = listBox1.SelectedItem.ToString();
            listBox1.Items.Remove(userSelectedElement);
            listBox2.Items.Add(userSelectedElement);
        }
        private void listBox2_DoubleCLick(object sender, EventArgs e)
        {
            string userSelectedElement = listBox2.SelectedItem.ToString();
            listBox2.Items.Remove(userSelectedElement);
            listBox1.Items.Add(userSelectedElement);
        }
    }
}

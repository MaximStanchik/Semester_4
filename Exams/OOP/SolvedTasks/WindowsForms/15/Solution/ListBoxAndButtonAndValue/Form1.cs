using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using static System.Windows.Forms.VisualStyles.VisualStyleElement;

namespace ListBoxAndButtonAndValue
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            if (listBox1.SelectedItem != null)
            {
                int selected = int.Parse(listBox1.SelectedItem.ToString());
                textBox1.Text = selected.ToString();
            }
        }

        private void listBox1_SelectedIndexChanged(object sender, EventArgs e)
        {
            textBox1.Clear();
            //listBox1.ClearSelected();
        }

        private void textBox1_TextChanged(object sender, EventArgs e)
        {

        }
    }
}

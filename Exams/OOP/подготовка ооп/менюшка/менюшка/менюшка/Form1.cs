using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace менюшка
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
            string[] countries = { "Италия", "Франция", "Германия", "Беларусь", "Канада", "Латвия" };
            listBox1.Items.AddRange(countries);
        }

        private void toolStripMenuItem1_Click(object sender, EventArgs e)
        {
            listBox1.Sorted = true;
        }

        private void удалитьToolStripMenuItem_Click(object sender, EventArgs e)
        {
            listBox1.Items.Remove(listBox1.SelectedItem);
        }
    }
}

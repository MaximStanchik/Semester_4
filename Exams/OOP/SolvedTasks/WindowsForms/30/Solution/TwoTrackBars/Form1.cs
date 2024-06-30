using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace TwoTrackBars
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();

            trackBar1.Minimum = 0;
            trackBar1.Maximum = 100;

            trackBar2.Minimum = 0;
            trackBar2.Maximum = 100;
        }

        private void trackBar2_Scroll(object sender, EventArgs e)
        {
            calcTheDifBetTwoVal(trackBar1.Value, trackBar2.Value);
        }

        private void trackBar1_Scroll(object sender, EventArgs e)
        {
            calcTheDifBetTwoVal(trackBar2.Value, trackBar1.Value);
        }

        private void calcTheDifBetTwoVal(int firstValue, int secondValue)
        {
            int totalValue = secondValue - firstValue;
            textBox1.Text = totalValue.ToString();
        }
    }
}

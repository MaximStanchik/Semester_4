   M S B A M L   `   `   `  ����I  EJewelleryStore, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null/clr-namespace:JewelleryStoreJewelleryStore  5   	   #    JewelleryStore.UserEditDialog   5   	   W SPresentationCore, Version=6.0.2.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=6.0.2.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35e aSystem.Windows.Controls.Ribbon, Version=6.0.2.0, Culture=neutral, PublicKeyToken=b77a5c561934e089R NWindowsBase, Version=6.0.2.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     5   	   R NSystem.Xaml, Version=6.0.2.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   @d2http://schemas.microsoft.com/expression/blend/2008     5   	   Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5   	   _ [MaterialDesignThemes.Wpf, Version=4.8.0.0, Culture=neutral, PublicKeyToken=df2a72020bd7962aFmaterialDesign1http://materialdesigninxaml.net/winfx/xaml/themes  5   	   (localclr-namespace:JewelleryStore  5   	   _ [Microsoft.Xaml.Behaviors, Version=1.1.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a3i+http://schemas.microsoft.com/xaml/behaviors  64     � Title$  EditUser��5	   	   $	��520��6   $	��400��6'    � 
ResizeMode$ NoResize=�5
   	    � WindowStartupLocation$ CenterScreen=�5   	    � WindowStyle$
 None=�5   	    � 	Resources 5      (   "JewelleryStore.VisibilityConverter   BTVConverter��%   &	          5   
   6$   5      .��5      ��   PrimaryHueLightBrush#���  6   $��2q�6B   ._�5   
   �  � RowDefinitions 5      �� 5      $	��73* �6    �� 5      $	��73* �6    �� 5      $	��73* �6    �� 5      $	��73* �6    �� 5      $	��73* �6    �� 5      $	��72* �6    �� 5      $	��82* �6    .+�5!      �� -   5         ��Name$ editUserLabel��5!        Edit#��[ 6+   $��15(�6K   $��	10,5,0,26q�6Y   $
��Bold"�6l   #���  6~   �� 5#      -   5         ��Name$ 	nameField��5#      $��1��6)   $	��350��66   $��40��6B    % !MaterialDesignFloatingHintTextBox#��[ 5%      )  #MaterialDesignThemes.Wpf.HintAssist   Hint# � ��5&      $
��Left=�5'      $	��Top=�6-   $��	20,10,0,0q�6E   ��5$      �� *Name+	 �� Mode$	 TwoWay=�
 �� UpdateSourceTrigger$
 PropertyChanged=�5'   E   �� 5)      -   5        $ lastnameField��5)      $��2��6-   $	��350��6:   $��40��6F   #��[ 5+        Lastname# �  5,      $
��Left=�5-      $	��Top=�6/   $��	20,10,0,0q�6G   ��5*      �� *
LastName+$	 TwoWay=�$
 PropertyChanged=�5-   G   �� 5/      -   5        $ usernameField��5/      $��3��6-   $	��350��6:   $��40��6F   #��[ 51        Username# �  52      $
��Left=�53      $	��Top=�6/   $��	20,10,0,0q�6G   ��50      �� *Login+$	 TwoWay=�$
 PropertyChanged=�53   G   �� 54      -   5        $ 
emailField��54      $��4��6+   $	��350��68   $��40��55      #��[ 56       
 E-mail# �  57      $
��Left=�58      $	��Top=�6/   $��	20,10,0,0q�6G   ��55   !   �� *Email+58   G   (  "System.Windows.Controls.DatePicker  59      -   5          Name$ dateOfBirth��59        	DateBirth# �  5:       $  MaterialDesignOutlinedDatePicker#��[ 5;      $��
20,0,240,0q�6I   $��5��6]   $��56��6j      SelectedDate 59   .   �� *DateOfBirth+5;   j   �� 5=      -   5         ��Name$ EditBtn��5=       %	 !MaterialDesignOutlinedLightButton#��[	 5>      #���  5?      $��84,15,98,27q�6,   $��6��6A   $��40��6N   ��5=   &   �� *EditUserCommand+5?   N   �� 5B       !
 MaterialDesignFlatLightButton#��[
 5C      $��339,10,0,31q�5D      $
��Auto��6    ��5B      �� *CloseCommand+.��5E      '  !MaterialDesignThemes.Wpf.PackIcon     Kind$ Close=�6*   5F      �� 5G        	ErrorName#���  6   
���  ��$
��Left=�6�   $��10(�6�   $��	15,47,0,0q�6�   $��1��6�   $	��Top=�6�   $	��350��6   $��20��6  y�6:   �� *ErrorNameVisibility+ �� 	Converter# [  6  �� 5H        ErrorLastName#���  6   
���  ��$
��Left=�6�   $��10(�6�   $��	15,47,0,0q�6�   $��2��6�   $	��Top=�6�   $	��350��6  $��20��6  y�6>   �� *ErrorLastNameVisibility+# [  6  �� 5I      
���  ��$
��Left=�6E   $��10(�6`   $��	15,47,0,0q�6n   $��3��6�   $	��Top=�6�   $	��350��6�   $��20��6�   ��6   �� *
ErrorLogin+6�   �� 5J      
���  ��$
��Left=�6E   $��10(�6`   $��	15,47,0,0q�6n   $��4��6�   $	��Top=�6�   $	��350��6�   $��20��6�   ��6   �� *
ErrorEmail+6�   5K      5L      5M      
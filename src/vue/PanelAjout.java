package vue;

import java.awt.Color;
import java.awt.GridLayout;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

import javax.swing.JButton;
import javax.swing.JLabel;
import javax.swing.JOptionPane;
import javax.swing.JTextField;

import controleur.Article;
import controleur.Alume;

public class PanelAjout extends PanelCentral implements ActionListener 
{
	private JTextField txtNOMP = new JTextField();
	private JTextField txtPRIXHT = new JTextField();
	private JTextField txtQUANTITESTOCK = new JTextField();
	private JButton btAnnuler = new JButton("Annuler");
	private JButton btEnregistrer = new JButton("Enregistrer");
	
	public PanelAjout()
	{
		super();
		this.setLayout(new GridLayout(4,2));
		this.add(new JLabel("Nom :"));
		this.add(this.txtNOMP);
		this.add(new JLabel("Prix :"));
		this.add(this.txtPRIXHT);
		this.add(new JLabel("Quantite :"));
		this.add(this.txtQUANTITESTOCK);
		this.add(this.btAnnuler);
		this.add(this.btEnregistrer);
		
		this.btAnnuler.addActionListener(this);
		this.btEnregistrer.addActionListener(this);
	}

	@Override
	public void actionPerformed(ActionEvent e) 
	{
		if (e.getSource()== this.btAnnuler)
		{
			this.txtNOMP.setText("");
			this.txtPRIXHT.setText("");
			this.txtQUANTITESTOCK.setText("");
		}
		else if (e.getSource()== this.btEnregistrer)
		{
			String NOMP = this.txtNOMP.getText();
			float PRIXHT = 0;
			int QUANTITESTOCK = 0;
			try {
				PRIXHT = Float.parseFloat(this.txtPRIXHT.getText());
				QUANTITESTOCK = Integer.parseInt(this.txtQUANTITESTOCK.getText());
			}
			catch (NumberFormatException exp)
			{
				this.txtPRIXHT.setBackground(Color.red);
				this.txtQUANTITESTOCK.setBackground(Color.red);
			}
			if (NOMP.equals("") || PRIXHT <=0 || QUANTITESTOCK <=0)
			{
				JOptionPane.showMessageDialog(this, "Erreur de saisie de données", "Erreur", JOptionPane.ERROR_MESSAGE);
			}else {
				//insertion dans la bdd 
				Article unArticle = new Article (NOMP, PRIXHT , QUANTITESTOCK);
				Alume.insertArticle(unArticle);
				JOptionPane.showMessageDialog(this, "Insertion reussie de l'article","Information", JOptionPane.INFORMATION_MESSAGE);
				
				unArticle = Alume.selectWhereArticle (unArticle);
				
				Object ligne[] = {unArticle.getNOMP(),
						unArticle.getPRIXHT(), unArticle.getQUANTITESTOCK(), unArticle.getIDPRODUIT()};
				
				PanelLister.getUnTableau().addRow(ligne);
				}
					this.setVisible(false);
				
			}
		}
		
	}

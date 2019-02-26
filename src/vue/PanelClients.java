package vue;

import java.awt.Color;
import java.awt.GridLayout;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

import javax.swing.JButton;
import javax.swing.JLabel;
import javax.swing.JOptionPane;
import javax.swing.JTextField;

import modele.ModeleClient;
import controleur.Alume;
import controleur.Article;
import controleur.Clients;

public class PanelClients extends PanelCentral implements ActionListener 
{
	private JTextField txtNOMCLIENT = new JTextField();
	private JTextField txtPRENOMCLIENT = new JTextField();
	private JTextField txtMAIL = new JTextField();
	private JTextField txtRAISON_SOCIALE = new JTextField();
	private JTextField txtADRESSE = new JTextField();
	private JTextField txtCPT = new JTextField();
	private JTextField txtVILLE = new JTextField();
	private JTextField txtTELEPHONE = new JTextField();
	private JButton btAnnuler = new JButton("Annuler");
	private JButton btEnregistrer = new JButton("Enregistrer");
	
	public PanelClients()
	{
		super();
		this.setLayout(new GridLayout(9,3));
		this.add(new JLabel("Nom :"));
		this.add(this.txtNOMCLIENT);
		this.add(new JLabel("Prénom :"));
		this.add(this.txtPRENOMCLIENT);
		this.add(new JLabel("Email :"));
		this.add(this.txtMAIL);
		this.add(new JLabel("Raison sociale :"));
		this.add(this.txtRAISON_SOCIALE);
		this.add(new JLabel("Adresse :"));
		this.add(this.txtADRESSE);
		this.add(new JLabel("Code Postale :"));
		this.add(this.txtCPT);
		this.add(new JLabel("Ville :"));
		this.add(this.txtVILLE);
		this.add(new JLabel("Téléphone :"));
		this.add(this.txtTELEPHONE);

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
			this.txtNOMCLIENT.setText("");
			this.txtPRENOMCLIENT.setText("");
			this.txtMAIL.setText("");
			this.txtRAISON_SOCIALE.setText("");
			this.txtADRESSE.setText("");
			this.txtCPT.setText("");
			this.txtVILLE.setText("");
			this.txtTELEPHONE.setText("");
		}
		else if (e.getSource()== this.btEnregistrer)
		{
			String NOMCLIENT = this.txtNOMCLIENT.getText();
			String PRENOMCLIENT = this.txtPRENOMCLIENT.getText();
			String MAIL = this.txtMAIL.getText();
			String RAISON_SOCIALE = this.txtRAISON_SOCIALE.getText();
			String ADRESSE = this.txtADRESSE.getText();
			String VILLE = this.txtVILLE.getText();
			String CPT = this.txtCPT.getText();
			String TELEPHONE = this.txtTELEPHONE.getText();
			
			if (NOMCLIENT.equals("")||PRENOMCLIENT.equals("")||MAIL.equals("")||RAISON_SOCIALE.equals("")
					|| ADRESSE.equals("")|| VILLE.equals("") || CPT.equals("") || TELEPHONE.equals("") )
			{
				JOptionPane.showMessageDialog(this, "Erreur de saisie de données", "Erreur", JOptionPane.ERROR_MESSAGE);
			}else {
				//insertion dans la bdd 
				Clients unClient = new Clients(NOMCLIENT, PRENOMCLIENT, MAIL, RAISON_SOCIALE, ADRESSE, VILLE, CPT, TELEPHONE);
				Alume.insertClients(unClient);
				JOptionPane.showMessageDialog(this, "Insertion reussie de l'article","Information", JOptionPane.INFORMATION_MESSAGE);
				
				unClient = Alume.selectWhereClient(unClient);
				
				Object ligne[] = {unClient.getNOMCLIENT(),
						unClient.getPRENOMCLIENT(), unClient.getMAIL(), unClient.getRAISON_SOCIALE(),unClient.getADRESSE()
						,unClient.getVILLE(),unClient.getCPT(),unClient.getTELEPHONE()};
				
				PanelLister.getUnTableau().addRow(ligne);
				}
					this.setVisible(false);
				
			}
		}
		
	}


#Ideen und Pseudocode

## Aufgabe 1 b)

Zu bedenken:

- Die eine Hälfte der Firmen kauft die smarte Komponente beim Spezialisten
- Die andere Hälfte produziert die smarte Komponente selber.

- Preise des Spezialisten hängen vom Markup ab - Markup des Spezialisten hängt von Marktanteil desselben ab.
- Preise der Firmen, welche die smarte Komponente einkaufen, hängen von dem Preis des Spezialisten ab.
- Preise der anderen Firmen hängt ausschließlich von den Grenzkosten und dem konstanten Markup der Firmen ab.

- Qualität der Produkte von Firmen, welche die smarte Komponente selber herstellen, hängt von deren aggregiertem Output ab.
- Qualität der Produkte von Firmen, welche die smarte Komponente einkaufen, hängt von der aggregierten Produktionsmenge des Spezialisten ab.

Was brauche ich?

- Um die Nachfrage zu bestimmen braucht man Preise und Qualitäten?!
- Genauer: 
	- Preise und Qualitäten der Firmen, welche die smarte Komponente **selber herstellen**
	  - Zur Berechnung der Qualität benötige ich die aggregierte Produktionsmenge der Firmen
	  - Zur Berechnung der Preise brauche ich nur die Grenzkosten und den Markup der Firmen (konstant)
	- Preise und Qualitäten der Firmen, welche die smarte Kopmonente **einkaufen**
	  - Zur Berechnung der Qualität benötigt man die aggregierte Produktionsmenge des Spezialisten
	  - Zur Berechnung des Preises braucht man den Markup in der Periode.
		- Der Markup hängt von dem Marktantanteil des Spezialisten ab.
- Bestimme die Wahrscheinlichkeitsverteilung mit Hilfe der Preise und Qualitäten
- Nutze die Wahrscheinlichkeitsverteilung und bestimme die Nachfrage
- Die Nachfrage legt fest, wieviele Einheiten jede Firma produziert. 

### ALGORITHMUS
  
#### Erste Periode:

- Festlegen, welchen Wert der Markup des Spezialisten in erster Periode hat!

- Preis des Spezialisten ausrechnen
- Preis der Firmen welche die Smarte Komponente selber herstellen ausrechnen

- Festlegen, welchen Wert der aggregierte Output der Firmen in Periode 1 hat.
- Festlegen, welchen Wert der aggregierte Output des Spezialisten in Periode 1 hat.

- Mit Hilfe der aggregierten Produktionsmenge die Qualität der Produkte ermitteln, 
  die eine selbsthergestellte Komponente enthalten.
- Mit Hilfe des aggregierten Outputs des Spezialisten die Qualität der Produkte ermitteln, 
  bei denen die Smarte Komponente vom Spezialisten eingekauft wurde.

- Unter Berücksichtigung der Preise und Qualitäten der Firmen die Wahrscheinlichkeitsverteilung
  berechnen

- Periodenoutput jeder Firma ausrechenen

- Menge der smarten Koponenten ermitteln, die von dem Spezialisten 
  (Summe der Produktionsmengen der Firmen, die die smarte Koponente einkaufen) 
  und von den jeweiligen Firmen hergestellt (entspricht der Menge des Periodenoutputs der jeweiligen Firma)
  wurden.

- Profite des Spezialisten, der Firmen, die die Smarte Komponente selber produzieren, und der Firmen, welche
  die smarte Komponente einkaufen, ermitteln.

- Marktantanteil des Spezialisten ausrechnen

### Zweite und alle anderen folgenden Periode:

- Mit Hilfe des aggregierten Outputs und der perioden Profite der letzten Periode den aggregierten Output der aktuellen
  Periode ausrechnen! Sowohl für den Spezialisten 

- Mit dem Marktanteil aus der letzen Periode den Markup des Spezialisten ausrechnen!

- Preis des Spezialisten ausrechnen
- Preis der Firmen welche die Smarte Komponente selber herstellen ausrechnen

- Festlegen, welchen Wert der aggregierte Output der Firmen in Periode 1 hat.
- Festlegen, welchen Wert der aggregierte Output des Spezialisten in Periode 1 hat.

- Mit Hilfe der aggregierten Produktionsmenge die Qualität der Produkte ermitteln, 
  die eine selbsthergestellte Komponente enthalten.
- Mit Hilfe des aggregierten Outputs des Spezialisten die Qualität der Produkte ermitteln, 
  bei denen die Smarte Komponente vom Spezialisten eingekauft wurde.

- Unter Berücksichtigung der Preise und Qualitäten der Firmen die Wahrscheinlichkeitsverteilung
  berechnen

- Periodenoutput jeder Firma ausrechenen

- Menge der smarten Koponenten ermitteln, die von dem Spezialisten 
  (Summe der Produktionsmengen der Firmen, die die smarte Koponente einkaufen) 
  und von den jeweiligen Firmen hergestellt (entspricht der Menge des Periodenoutputs der jeweiligen Firma)
  wurden.

- Profite des Spezialisten, der Firmen, die die Smarte Komponente selber produzieren, und der Firmen, welche
  die smarte Komponente einkaufen, ermitteln.

- Marktantanteil des Spezialisten ausrechnen


## Aufgabe 1 c)

Zu bedenken:

- Um die Nachfrage zu bestimmen braucht man Preise und Qualitäten?!

- Preise des Spezialisten hängen von dem Markup des Spezialisten ab!
- Der Markup hängt vom Marktanteil des Spezialitsen ab!
- Der Marktantanteil des Spezialisten hängt von dem Output des Spezialisten und der Firmen ab!

- Preise der Firmen hängen von den Preisen des Spezialisten ab, weil dies die Grenzkosten verändert!

- Qualitäten hängen diesmal von der aggregierten Produktionsmenge des Spezialisten ab!

### ALGORITHMUS

#### Erste Periode:

- Festlegen, welchen Wert der Markup des Spezialisten in erster Periode hat!

- Markup is Null -> Spezialist verlangt einen Preis, der den Grenzkosten entspricht -> Der Preis unterscheidet sich
  in der ersten Periode nicht von dem Preis der Firma!

- Festlegen, welchen Wert der aggregierte Output hat!

- Aggregierter Output des Spezialisten ist Null in erster Periode

-  Berechnungen durchführen!
   1. Preis des Spezialisten berechnen
   2. Preise der Firmen mit Hilfe des Preises vom Spezialisten ausrechnen!
   3. Qualität berechnen: Weil die Smarte Komponente eingekauft wird,
	  hängt die Qualität nun vom aggregierten Output des Spezialisten ab!
   4. Mit Hilfe der Preise der Firmen und Qualität des Spezialisten
	  die Wahrscheinlichkeiten ausrechen!
   5. Mit Hilfe der Wahrscheinlichkeiten die Nachfrage ausrechnen
	  die von den Firmen bedient wird!
   6. q0 ausrechnen
	  - ist die Summe der Nachfrage
	  -  wird zur Berechnung des Marktanteils verwendet!
   7. Marktanteil ausrechnen!
   8. q0/Summe der Nachfrage (sollte 1 ergeben!)
   9. Profit des Spezialisten ausrechnen!
   10. Profit der Firma ausrechnen!

#### Zweite und alle folgenden Perioden:

- Mit Hilfe des aggregierten Outputs und der perioden Profit der letzten Periode den aggregierten Output der aktuellen
  Periode ausrechnen!
  
- Berechnungen durchführen!
  1. Mit dem Marktanteil aus der letzen Periode den Markup des Spezialisten ausrechnen!
  2. Preis des Spezialisten berechnen
  3. Preise der Firmen mit Hilfe des Preises vom Spezialisten ausrechnen!
  4. berechne aggregierten Output des Spezialisten!
  5. Qualität mit Hilfe des aggregierten Outputs des Spezialisten berechnen:
	 Weil die Smarte Komponente eingekauft wird,
	 hängt die Qualität nun ausschließlich vom
	 aggregierten Output des Spezialisten ab!
  6. Mit Hilfe der Preise der Firmen und Qualität des Spezialisten
	 die Wahrscheinlichkeiten ausrechen!
  7. Mit Hilfe der Wahrscheinlichkeiten die Nachfrage ausrechnen
	 die von den Firmen bedient wird!
  8. q0 ausrechnen
	  * ist die Summe der Nachfrage
	  * wird zur Berechnung des Marktanteils verwendet!
  9. Marktanteil ausrechnen!
	 - q0/Summe der Nachfrage (sollte 1 ergeben!)
  10. Profit des Spezialisten ausrechnen!
  11. Profit der Firma ausrechnen!

Fortführen bis zum Ende der Schleife!

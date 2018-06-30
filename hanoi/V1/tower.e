class TOWER
-- Represente une tour et les disques qu'elle contient
	
creation {ANY}
	full, empty

feature {}
	t: ARRAY[INTEGER]
			-- La tour est un tableau d'entiers.
	      -- L'index i du tableau représente la taille du disque à 
	      -- l'étage i
	top: INTEGER
			-- Represente le dernier étage auquel un disque est present

feature {}
	full (n: INTEGER) is
			-- Creation d'une tour de taille n, avec n disques presents
		require
			n >= 1
		local
			i: INTEGER
		do

			-- A Remplir

		end

	empty (n: INTEGER) is
			-- Creation d'une tour vide de taille n
		require
			n >= 1
		do

			-- A Remplir
		ensure
			height = n
			top = 1
		end

feature {HANOI}
	height: INTEGER is
			-- La taille de la tour
		do
			Result := t.upper
		end

	afficher_etage (d: INTEGER) is
			-- Affiche l'etage d de la tour
		require
			1 <= d
			d <= height
		local
			taille_disque, taille_disque_max, i: INTEGER
		do
			taille_disque := t.item(d)
			taille_disque_max := height
			from
				i := taille_disque_max - taille_disque
			until
				i = 0
			loop
				io.put_character(' ')
				i := i - 1
			end
			from
				i := taille_disque
			until
				i = 0
			loop
				io.put_character('=')
				i := i - 1
			end
			io.put_character('|')
			from
				i := taille_disque
			until
				i = 0
			loop
				io.put_character('=')
				i := i - 1
			end
			from
				i := taille_disque_max - taille_disque
			until
				i = 0
			loop
				io.put_character(' ')
				i := i - 1
			end
		end

	retirer_disque: INTEGER is
			-- Retire le dernier disque de la tour courante
		do
			-- A remplir
			Result := 0
		ensure
			top >= 1
		end

	ajouter_disque (d: INTEGER) is
			-- Ajoute un disque de taille d sur la tour.
			-- Renvoie une erreur (Explicite) si le disque ne peut pas etre ajoute
		do

			-- A Remplir
			
		ensure
			top <= height
		end

end -- class TOWER

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
			create t.make(1, n)
			from
				i := 1
			until
				i = n+1
			loop
				t.put(n-i+1, i)
				i:= i + 1
			end
			top := n
		end
		
	empty (n: INTEGER) is
			-- Creation d'une tour vide de taille n
		require
			n >= 1
		local
			i: INTEGER
		do
			create t.make(1, n)
			from
				i := 1
			until
				i = n
			loop
				t.put(0, i)
				i:= i + 1
			end
			top := 1
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
		local
			last_item: INTEGER
		do
			if not_empty then
				last_item := t.item(top)
				t.put(0, top)
				if top /= 1 then
					top := top - 1
				end
				Result := last_item
			else
				io.put_string("La tour est vide ! %N")
			end
		ensure
			top >= 1
		end

	ajouter_disque (d: INTEGER): BOOLEAN is
			-- Ajoute un disque de taille d sur la tour.
			-- Renvoie une erreur (Explicite) si le disque ne peut pas etre ajoute
		do
			if t.item(top) > d  then
				t.put(d, top+1)
				top := top + 1
				Result := True
			elseif t.item(top) = 0 then
				t.put(d, top)
				Result := True
			else
				io.put_string("Le disque ne peut être ajouté ! %N")
				Result := False
			end
		ensure
			top <= height
		end

	not_empty : BOOLEAN is
	-- tour non vide ?
		do
			if top = 1 and t.item(top) = 0 then
				Result := False
			else
				Result := True
			end
		end
	
	is_full: BOOLEAN is
	-- tour pleine ?
		do
			if top = height then
				Result := True
			else
				Result := False
			end
		end

end -- class TOWER

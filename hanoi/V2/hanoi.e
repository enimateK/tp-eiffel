class HANOI
	--
	-- Le jeu des tours de Hanoi
	--
--
	
creation {ANY}
	make

feature {}
	nb: INTEGER
			-- Taille des tours

	tower1, tower2, tower3: TOWER
	      -- Les 3 tours du jeu

feature {ANY}
	make is
			-- Creation du jeu et boucle principale
		local
			source: INTEGER
			destination: INTEGER
			disque: INTEGER
			resultat: BOOLEAN
		do
			io.put_string("Hauteur des tours : ")
			io.flush
			io.read_integer
			nb := io.last_integer

			create tower1.full(nb)
			create tower2.empty(nb)
			create tower3.empty(nb)
			io.put_string("Situation au depart :%N")
			print_game
			
			-- Le jeu commence ici et s'arrête quand la tour 3 est pleine
			from
			until
				end_game = True
			loop
				io.put_string("Entrez un chiffre entre 1 et 3 ! (4 pour tricher)")
				
				-- Entrez la tour de départ
				io.put_string("Tour de depart : ")
				io.flush
				io.read_integer
				source := io.last_integer
				if source = 1 then
					disque := tower1.retirer_disque
				elseif source = 2 then
					disque := tower2.retirer_disque
				elseif source = 3 then
					disque := tower2.retirer_disque
				elseif source = 4 then
					-- Cheat activé !
					resolve(nb, tower1, tower3, tower2)
				else
					io.put_string("Un chiffre entre 1 et 3 ! (4 pour tricher)")
				end
				
				-- Entrez la tour d'arrivée
				io.put_string("Tour d'arrivée : ")
				io.flush
				io.read_integer
				destination := io.last_integer
				if destination = 1 then
					resultat := tower1.ajouter_disque(disque)
				elseif destination = 2 then
					resultat := tower2.ajouter_disque(disque)
				elseif destination = 3 then
					resultat := tower3.ajouter_disque(disque)
				else
					io.put_string("Un chiffre entre 1 et 3 !")
				end
				
				-- Si le disque est trop grand, remet le disque sur sa tour d'origine
				if resultat = False then
					if source = 1 then
						resultat := tower1.ajouter_disque(disque)
					elseif source = 2 then
						resultat := tower2.ajouter_disque(disque)
					elseif source = 3 then
						resultat := tower3.ajouter_disque(disque)
					end
				end
				print_game
			end
			io.put_string("Situation a la fin :%N")
			print_game
		end
		
	end_game: BOOLEAN is
		-- Tour 3 remplie
		do
			if tower3.is_full then
				Result := True
				io.put_string("Bravo !! :%N")
			else
				Result := False
			end
		end

	resolve (how_many: INTEGER; source, destination, intermediate: TOWER) is
			-- Algorithme recursif de resolution du jeu qui transfère how_many jetons de la tour source à la tour destination en passant par la tour intermediate
		local
			disque: INTEGER
			resultat: BOOLEAN
		do
			if how_many /= 0 then
				resolve(how_many - 1, source, intermediate, destination)
				disque := source.retirer_disque
				resultat := destination.ajouter_disque(disque)
				print_game
				resolve(how_many - 1, intermediate, destination, source)
			end
		end


	print_game is
			-- Affichage de l'etat courant de la partie
		local
			i: INTEGER
		do
		from
			i := nb
		until
			i = 0
		loop
			io.put_character(' ')
			tower1.afficher_etage(i)
			io.put_character(' ')
			tower2.afficher_etage(i)
			io.put_character(' ')
			tower3.afficher_etage(i)
			io.put_string("%N")
			i := i-1
		end
	
		from
			i:= (2 * (nb + 1) + 1) * 3 - 2
		until
			i = 0
		loop
			io.put_character('-')
			i := i - 1
		end
	   io.put_string("%N")

	end
	

end -- class HANOI

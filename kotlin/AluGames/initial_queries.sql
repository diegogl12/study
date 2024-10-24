CREATE DATABASE alugames;

CREATE TABLE jogos (
            id INT AUTO_INCREMENT PRIMARY KEY,
            capa VARCHAR(255),
            descricao VARCHAR(255),
            preco DOUBLE,
            titulo VARCHAR(100));

INSERT INTO alugames.jogos (titulo, capa, preco, descricao)
    VALUES ('The Witcher 3: Wild Hunt', 'https://cdn.cloudflare.steamstatic.com/steam/apps/292030/header.jpg?t=1675178392', 4.99, 'Um RPG de ação épico com um mundo aberto vasto e envolvente.'),
  ('Grand Theft Auto V', 'https://cdn.cloudflare.steamstatic.com/steam/apps/271590/header.jpg?t=1678296348', 2.99, 'Um jogo de ação em mundo aberto, onde você pode assumir o papel de três protagonistas e explorar uma cidade cheia de possibilidades.'),
  ('The Last of Us Part I', 'https://cdn.cloudflare.steamstatic.com/steam/apps/1888930/header.jpg?t=1686864554', 5.99, 'Uma aventura pós-apocalíptica de sobrevivência em um mundo infestado por zumbis e facções em conflito.'),
  ('Red Dead Redemption 2', 'https://cdn.cloudflare.steamstatic.com/steam/apps/1174180/header.jpg?t=1671485009', 1.99, 'Um épico de ação no Velho Oeste, com uma história imersiva e um vasto mundo aberto para explorar.'),
  ('Assassin''s Creed Valhalla', 'https://cdn.cloudflare.steamstatic.com/steam/apps/2208920/header.jpg?t=1671135934', 7.99, 'Viaje para a era viking e assuma o papel de um feroz guerreiro em uma luta por poder e glória.'),
  ('Dandara', 'https://cdn.cloudflare.steamstatic.com/steam/apps/612390/header.jpg?t=1674055293', 9.99, 'Um jogo de plataforma e ação com elementos de metroidvania, onde você controla a heroína Dandara em sua luta para libertar um mundo repleto de opressão e tirania.'),
  ('Cyberpunk 2077', 'https://cdn.cloudflare.steamstatic.com/steam/apps/1091500/header.jpg?t=1687178759', 3.99, 'Um RPG de ação futurista, onde você explora uma cidade cyberpunk cheia de conspirações e tecnologia avançada.'),
  ('God of War', 'https://cdn.cloudflare.steamstatic.com/steam/apps/1593500/header.jpg?t=1650554420', 2.99, 'Assuma o papel de Kratos, um poderoso guerreiro espartano, e enfrente deuses e criaturas mitológicas em uma busca de vingança.'),
  ('Call of Duty: Warzone', 'https://cdn.cloudflare.steamstatic.com/steam/apps/1962663/header_alt_assets_0_brazilian.jpg?t=1687569624', 4.99, 'Um jogo de batalha real gratuito, onde você luta pela sobrevivência em um campo de batalha intenso.'),
  ('Minecraft Dungeons', 'https://cdn.cloudflare.steamstatic.com/steam/apps/1672970/header.jpg?t=1666102880', 2.99, 'Um jogo de construção e exploração, onde você pode criar seu próprio mundo e sobreviver em um ambiente cheio de possibilidades.'),
  ('Resident Evil Village', 'https://cdn.cloudflare.steamstatic.com/steam/apps/1196590/header.jpg?t=1687764412', 6.99, 'Um jogo de terror de sobrevivência, onde você enfrenta ameaças sobrenaturais em uma vila assombrada.'),
  ('Battlefield 2042', 'https://cdn.cloudflare.steamstatic.com/steam/apps/1517290/header.jpg?t=1686216000', 7.99, 'Um jogo de tiro em primeira pessoa, ambientado em um futuro próximo de conflitos globais e batalhas intensas.'),
  ('Horizon Zero Dawn', 'https://cdn.cloudflare.steamstatic.com/steam/apps/1151640/header.jpg?t=1667297464', 3.99, 'Um jogo de ação e aventura, onde você assume o papel de Aloy, uma caçadora habilidosa, em um mundo pós-apocalíptico dominado por máquinas.'),
  ('Marvel''s Spider-Man', 'https://cdn.cloudflare.steamstatic.com/steam/apps/1817070/header.jpg?t=1673999865', 4.99, 'Balance pelos arranha-céus de Nova York como o icônico herói Spider-Man e enfrente vilões perigosos em uma narrativa emocionante.'),
  ('Persona 5', 'https://cdn.cloudflare.steamstatic.com/steam/apps/1687950/header.jpg?t=1679398700', 2.99, 'Um RPG estilizado, onde você vive a vida de um estudante do ensino médio durante o dia e combate ameaças sobrenaturais durante a noite.'),
  ('BioShock Infinite', 'https://cdn.cloudflare.steamstatic.com/steam/apps/8870/header.jpg?t=1602794480', 2.99, 'Uma experiência imersiva de tiro em primeira pessoa, ambientada em uma cidade flutuante cheia de mistérios e reviravoltas.'),
  ('Final Fantasy VII Remake', 'https://cdn.cloudflare.steamstatic.com/steam/apps/1462040/header.jpg?t=1663767129', 6.99, 'Um remake do clássico RPG, onde você acompanha Cloud Strife e seus aliados em uma jornada para salvar o mundo da corporação maligna Shinra.'),
  ('Dark Souls III', 'https://cdn.cloudflare.steamstatic.com/steam/apps/374320/header.jpg?t=1682651227', 5.99, 'Um desafiador RPG de ação, onde você enfrenta inimigos poderosos e explora um mundo sombrio e perigoso.'),
  ('The Elder Scrolls V: Skyrim', 'https://cdn.cloudflare.steamstatic.com/steam/apps/72850/header.jpg?t=1647357402', 4.99, 'Um épico RPG de fantasia, onde você explora um vasto mundo aberto, enfrenta dragões e molda seu próprio destino.'),
  ('Hades', 'https://cdn.cloudflare.steamstatic.com/steam/apps/1145360/header.jpg?t=1680293801', 4.99, 'Um jogo de ação e roguelike, onde você assume o papel do filho do deus dos mortos e luta para escapar do submundo grego.');
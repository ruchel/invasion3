require("Paraquedas") ------- Chamada do Arquivo Paraquedas ------
-----------------------variaveis----------------------------------
local lose = false
local nextLevel = 10
local points = 0
local Paraquedas = nil
local music  = nil
local music2 = nil
local music3 = nil
local music4 = nil
local music5 = nil
local gameover = nil
local fundo  = nil
local fundo2 = nil
local fundo3 = nil
local fundo4 = nil
local fundo5 = nil
local actveStartMenu = true
local fonteGimmeDanger = "fonts/Gimme Danger.ttf"
-----------------------variaveis----------------------------------

function love.load()

-------------------mira ou ponteiro do mouse----------------------
imgs = love.graphics.newImage( "imgs/Mira.png" )
love.mouse.setVisible( false )
-------------------mira ou ponteiro do mouse----------------------


love.window.setTitle("INVASION")--invasão
math.randomseed(os.time())
Paraquedas = newParaquedas(3, 30)
Paraquedas:initAllParaquedas()


----------------------imagem de fundo 1----------------------------
fundo = love.graphics.newImage( "imgs/Background01.png" )

	planoDeFundo = {
		x = 0,
		y = 0,
		y2 = 0 - fundo:getHeight(),
		vel = 30
	}
----------------------imagem de fundo 1----------------------------



----------------------imagem de fundo 2----------------------------
fundo2 = love.graphics.newImage( "imgs/Background02.png" )

	planoDeFundo2 = {
		x = 0,
		y = 0,
		y2 = 0 - fundo:getHeight(),
		vel = 30
	}
----------------------imagem de fundo 2-----------------------------


----------------------imagem de fundo 3-----------------------------
fundo3 = love.graphics.newImage( "imgs/Background03.png" )

	planoDeFundo3 = {
		x = 0,
		y = 0,
		y2 = 0 - fundo:getHeight(),
		vel = 30
	}
----------------------imagem de fundo 3-----------------------------


----------------------imagem de fundo 4-----------------------------
fundo4 = love.graphics.newImage( "imgs/Background04.png" )

	planoDeFundo4 = {
		x = 0,
		y = 0,
		y2 = 0 - fundo:getHeight(),
		vel = 30
	}
----------------------imagem de fundo 4 ----------------------------


----------------------imagem de fundo 5-----------------------------
fundo5 = love.graphics.newImage( "imgs/Background05.png" )

	planoDeFundo5 = {
		x = 0,
		y = 0,
		y2 = 0 - fundo:getHeight(),
		vel = 30
	}
----------------------imagem de fundo 5-----------------------------


-----------------------tela inicial---------------------------------
abretela = false
TelaInicial = love.graphics.newImage( "imgs/Menu.png" )
-----------------------tela inicial---------------------------------



-----------------------audios do jogo-------------------------------
music = love.audio.newSource("sound/blast_off.mp3", "stream")
music:setLooping(true)
love.audio.play(music)

music2 = love.audio.newSource("sound/blast_off2.mp3", "stream")
music3 = love.audio.newSource("sound/blast_off3.mp3", "stream")
music4 = love.audio.newSource("sound/blast_off4.mp3", "stream")
music5 = love.audio.newSource("sound/blast_off5.mp3", "stream")
gameover = love.audio.newSource("sound/gameover.mp3", "stream")
-----------------------audios do jogo------------------------------

------------------------------gameover-----------------------------
fimdejogo = love.graphics.newImage( "imgs/gameover.png")

------------------------------gameover-----------------------------

-------------------------------pause------------------------------
pausar= false
-------------------------------pause------------------------------
end

function love.update()

  lose = Paraquedas:updateParaquedas()

end



---------------------------botão de play---------------------------
PLAY = love.graphics.newImage( "imgs/play.png")
---------------------------botão de play---------------------------



---------------------função de pontuação---------------------------
function love.mousepressed(x, y, button, istouch)
  points = points + Paraquedas:checkClickParaquedas(x, y)

  if (points >= nextLevel) then
    Paraquedas:IncNumParaquedas()
    nextLevel = nextLevel + 10
  end

  if (lose == true) then --lose = perder
	Paraquedas:reinit()
	love.audio.stop()
	love.audio.play(music)
	lose = false
    points = 0
    nextLevel = 10
  end

  if button == 1 and x >= 600 and x < 600 + PLAY:getWidth() and button == 1 and y >= 280 and y < 280 + PLAY:getHeight() then
	actveStartMenu = false  ----------- inicia o Jogo
  end

  if (points >= 20 and points < 40) then -----troca de música-------
	love.audio.stop(music)
	love.audio.play(music2)
	music2:setLooping(true)
  end

  if (points >= 40 and points < 60) then -----troca de música-------
	love.audio.stop(music2)
	love.audio.play(music3)
	music3:setLooping(true)
  end

  if (points >= 60 and points < 80) then -----troca de música-------
	love.audio.stop(music3)
	love.audio.play(music4)
	music4:setLooping(true)
  end

  if (points >= 80 and points < 100) then -----troca de música------
	love.audio.stop(music4)
	love.audio.play(music5)
	music5:setLooping(true)
  end

end
---------------------função de pontuação----------------------------


function love.draw()
	love.graphics.draw( TelaInicial, planoDeFundo.x, planoDeFundo.y )
	love.graphics.draw( PLAY, 600, 280 )
	love.graphics.draw( imgs, love.mouse.getX(), love.mouse.getY() )

	if ( actveStartMenu == true) then
		else
		  love.graphics.draw( fundo, planoDeFundo.x, planoDeFundo.y ) ----- Cenário inicial -----
			love.graphics.draw( imgs, love.mouse.getX(), love.mouse.getY() )

		if (points >= 20 and points < 40) then ------ troca de cenário ------
			love.graphics.draw( fundo2, planoDeFundo2.x, planoDeFundo2.y )
			love.graphics.draw( imgs, love.mouse.getX(), love.mouse.getY() )
		end

		if (points >= 40 and points < 60) then ------ troca de cenário ------
			love.graphics.draw( fundo3, planoDeFundo3.x, planoDeFundo3.y )
			love.graphics.draw( imgs, love.mouse.getX(), love.mouse.getY() )
		end

		if (points >= 60 and points < 80) then ------ troca de cenário ------
			love.graphics.draw( fundo4, planoDeFundo4.x, planoDeFundo4.y )
			love.graphics.draw( imgs, love.mouse.getX(), love.mouse.getY() )
		end

		if (points >= 80 and points < 100) then ------ troca de cenário ------
			love.graphics.draw( fundo5, planoDeFundo5.x, planoDeFundo5.y )
			love.graphics.draw( imgs, love.mouse.getX(), love.mouse.getY() )
		end


		if (lose == false) then
			Paraquedas:drawParaquedas()
		else
			love.graphics.draw( fimdejogo , 350, 300 ) ----- GameOver -----
			love.audio.play(gameover)
			gameover:setLooping(false)
		end

		  love.graphics.setColor(0, 0, 0, 255)
		  love.graphics.setFont(love.graphics.newFont(fonteGimmeDanger, 20))
		  love.graphics.print("PONTOS  " .. points, 20, 20)
	end	  love.graphics.setColor(255, 255, 255, 255)

end

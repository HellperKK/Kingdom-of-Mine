require 'gosu'
require 'opengl'
require 'glu'
include Gl, Glu

class Position
	attr_accessor :x, :y, :z
	def initialize(x = 0.0, y = 0.0, z = 0.0)
		@x, @y, @z = x, y, z
	end
end

class Window < Gosu::Window
	def initialize
		super(640, 480, false)
		self.caption = 'OpenGL Test'
		@position = Position.new(0, 200, 20)
		@target = Position.new(0, 0, 0)
	end
	def draw
		gl do
			# on active les textures
			glEnable(GL_TEXTURE_2D)
			# on active le Z buffer
			glEnable(GL_DEPTH_TEST)
			# on efface l'écran précédent
			glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT)
			# on passe la matrice courante sur la projection
			glMatrixMode(GL_PROJECTION)
			# on remet à zéro cette matrice
			glLoadIdentity
			# on définit notre perspective : fovy, ratio, near, far
			gluPerspective(45.0, self.width.to_f / self.height.to_f, 0.1, 1000.0)
			# on passe la matrice courante sur MODELVIEW
			glMatrixMode(GL_MODELVIEW)
			# on remet à zéro cette matrice
			glLoadIdentity
			# on positionne le regard, via la position et la cible du regard, et on choisit la verticale (ici sur Y)
			gluLookAt(@position.x, @position.y, @position.z, @target.x, @target.y, @target.z, 0, 1, 0)

			# dessin 3D
			# et enfin, on va pouvoir dessiner !
		end
	end
end

Window.new.show
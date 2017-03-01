#!/usr/bin/env python
# -*- coding: utf-8 -*-

'''
Wrapper for the daedalus monochrome maze functionality.

maze = Maze(63, 63)
maze.create_perfect()
maze.resize(31, 61)
maze.create_perfect()
maze.save_bitmap('test.bmp')
maze.save_text('test.txt')
'''

from libcpp cimport bool

cdef extern from "pdconfig.h":
    cdef int PYTHON_VERSION2

cdef extern from "wrapper.h":
    cdef cppclass CMaz:
        int m_x
        int m_y
    cdef cppclass CCol:
        pass
    ctypedef long KV
    ctypedef struct MS:
        int xEntrance
        int yEntrance
        int xExit
        int yExit
    cdef MS ms
    # enums for return values of save functions
    cdef int SAVE_NO_MAZE_ERROR
    cdef int SAVE_NO_FILENAME_GIVEN_ERROR
    cdef int SAVE_FILE_OPEN_ERROR
    cdef int SAVE_UNKNOWN_CMD_ERROR
    cdef int SAVE_SUCCESS
    # color value constants
    cdef KV kvWhite
    cdef KV kvBlack
    # enums for setting nEntrancePos
    cdef int epCorner
    cdef int epMiddle
    cdef int epBalanced
    cdef int epRandom
    # random number generator
    void InitRndL(unsigned long int l)
    # wrapping functions
    void cpp_Init()
    CMaz *cpp_Constructor(unsigned width, unsigned height)
    void cpp_Destructor(CMaz *maze)
    bool cpp_Get(CMaz *maze, unsigned x, unsigned y)
    bool cpp_CreateMazePerfect ( CMaz *maze,
                                 bool  fRiver,
                                 bool  fRiverEdge,
                                 bool  fRiverFlow,
                                 bool  fSection,
                                 bool  fTreeWall,
                                 int   nEntrancePos,
                                 int   nRndBias,
                                 int   nRndRun )
    bool cpp_CreateMazePerfect2 ( CMaz *maze,
                                  bool  fRiver,
                                  bool  fSection,
                                  int   nEntrancePos,
                                  int   nRndBias,
                                  int   nRndRun )
    bool cpp_CreateMazeBraid ( CMaz *maze,
                               bool  fSection,
                               int   nEntrancePos,
                               int   nRndBias,
                               int   nRndRun )
    bool cpp_CreateMazeBraidTilt ( CMaz *maze,
                                   bool  fSection,
                                   bool  fTiltDiamond,
                                   int   nEntrancePos,
                                   int   nRndBias,
                                   int   nRndRun )
    bool cpp_CreateMazeSpiral ( CMaz *maze,
                                int   cRandomAdd,
                                int   cSpiral,
                                int   cSpiralWall,
                                bool  fSection,
                                int   nEntrancePos,
                                int   nRndBias,
                                int   nRndRun )
    bool cpp_CreateMazeDiagonal ( CMaz *maze,
                                  int   cRandomAdd,
                                  bool  fSection,
                                  int   nEntrancePos,
                                  int   nRndBias,
                                  int   nRndRun )
    bool cpp_CreateMazeRecursive ( CMaz *maze,
                                   bool  fSection,
                                   int   nEntrancePos,
                                   int   nRndBias,
                                   int   nRndRun )
    bool cpp_CreateMazePrim ( CMaz *maze,
                              bool  fSection,
                              bool  fTreeWall,
                              int   nEntrancePos,
                              int   nRndBias,
                              int   nRndRun )
    bool cpp_CreateMazePrim2 ( CMaz *maze,
                               bool  fSection,
                               bool  fTreeRandom,
                               bool  fTreeWall,
                               int   nEntrancePos,
                               int   nRndBias,
                               int   nRndRun )
    bool cpp_CreateMazeKruskal ( CMaz *maze,
                                 bool  fClear,
                                 CCol *c2,
                                 CCol *c3,
                                 bool  fKruskalPic,
                                 bool  fSection,
                                 bool  fTreeWall,
                                 int   nEntrancePos,
                                 int   nRndBias,
                                 int   nRndRun )
    bool cpp_CreateMazeTree ( CMaz *maze,
                              bool  fSection,
                              bool  fTreeRandom,
                              bool  fTreeWall,
                              int   nEntrancePos,
                              int   nRndBias,
                              int   nRndRun,
                              int   nTreeRiver )
    bool cpp_CreateMazeForest ( CMaz *maze,
                                bool  fWall,
                                bool  fRiverFlow,
                                bool  fSection,
                                bool  fTreeRandom,
                                bool  fTreeWall,
                                int   nEntrancePos,
                                int   nForsAdd,
                                int   nForsInit,
                                int   nRndBias,
                                int   nRndRun,
                                int   nTreeRiver )
    bool cpp_CreateMazeAldousBroder ( CMaz *maze,
                                      bool  fSection,
                                      bool  fTreeWall,
                                      int   nEntrancePos,
                                      int   nRndBias,
                                      int   nRndRun )
    bool cpp_CreateMazeWilson ( CMaz *maze,
                                bool  fSection,
                                bool  fTreeWall,
                                int   nEntrancePos,
                                int   nRndBias,
                                int   nRndRun )
    bool cpp_CreateMazeEller ( CMaz *maze,
                               bool  fSection,
                               bool  fTreeWall,
                               int   nEntrancePos,
                               int   nRndBias,
                               int   nRndRun )
    bool cpp_CreateMazeBraidEller ( CMaz *maze,
                                    bool  fSection,
                                    int   nEntrancePos,
                                    int   nRndBias,
                                    int   nRndRun )
    bool cpp_CreateMazeDivision ( CMaz *maze,
                                  bool  fSection,
                                  int   nEntrancePos,
                                  int   nRndBias,
                                  int   nRndRun )
    bool cpp_CreateMazeBinary ( CMaz *maze,
                                int   cRandomAdd,
                                bool  fSection,
                                bool  fTreeWall,
                                int   nEntrancePos,
                                int   nRndBias,
                                int   nRndRun )
    bool cpp_CreateMazeSidewinder ( CMaz *maze,
                                    bool  fSection,
                                    bool  fTreeWall,
                                    int   nEntrancePos,
                                    int   nRndBias,
                                    int   nRndRun )
    bool cpp_CreateMazeUnicursal ( CMaz *maze,
                                   int   cRandomAdd,
                                   bool  fRiver,
                                   bool  fRiverEdge,
                                   bool  fRiverFlow,
                                   bool  fSection,
                                   bool  fTreeWall,
                                   int   nEntrancePos,
                                   int   nRndBias,
                                   int   nRndRun )
    bool cpp_Resize(CMaz *maze, unsigned width, unsigned height)
    int cpp_SaveBitmap(CMaz *maze,
                       const char *filename,
                       KV kvOn,
                       KV kvOff)
    int cpp_SaveText(CMaz *maze,
                     const char *filename,
                     bool fTextClip,
                     bool fLineChar,
                     bool fTextTab)

# color value constants
COLOR_WHITE = kvWhite
COLOR_BLACK = kvBlack

# nEntrancePos enum constants
ENTRANCE_CORNER   = epCorner
ENTRANCE_MIDDLE   = epMiddle
ENTRANCE_BALANCED = epBalanced
ENTRANCE_RANDOM   = epRandom

# global initialisation
cpp_Init()

def init_random(seed):
    '''
    Seeds the random number generator used internally by Daedalus to
    generate mazes.

    :param int seed: The new seed value for the random number
        generator.
    :rtype: None
    '''
    InitRndL(seed)

class MazeError(Exception):
    '''An error while performing an action on a Maze object.'''
    pass

cdef class Maze(object):
    '''
    A monochrome daedalus Maze object.

    Even-numbered rows and columns in the Maze are walls, and
    odd-numbered rows and columns are passages.

    Walls are "on" pixels and passages are "off" pixels.
    '''

    cdef CMaz *_maze
    cdef int _xEntrance
    cdef int _yEntrance
    cdef int _xExit
    cdef int _yExit

    def __cinit__(self, width, height):
        '''
        Maze constructor.

        :param int width: Odd integer, 3 or greater
        :param int height: Odd integer, 3 or greater
        '''
        if width < 0:
            raise ValueError('negative width')
        if height < 0:
            raise ValueError('negative height')
        # if width % 2 != 1:
        #     raise ValueError('width must be odd')
        # if height % 2 != 1:
        #     raise ValueError('height must be odd')
        self._xEntrance = 0
        self._yEntrance = 0
        self._xExit = 0
        self._yExit = 0
        self._maze = cpp_Constructor(width, height)
        if self._maze is NULL:
            raise MazeError('Could not construct Maze object.')

    def __dealloc__(self):
        '''Destructor.'''
        if self._maze is not NULL:
            cpp_Destructor(self._maze)
            self._maze = NULL

    def __len__(self):
        return self.height

    def __getitem__(self, key):
        if isinstance(key, int):
            y = key
            return [int(self.get(x, y)) for x in range(self.width)]
        else:
            if not isinstance(key, tuple) and len(key) == 2 and list(set(map(type, key))) == [int]:
                raise ValueError('key must be an integer or a tuple of two integers')
            (x,y) = key
            return self.get(x,y)

    def __contains__(self, value):
        for v in self:
            if v == value:
                return True
        return False

    def __iter__(self):
        i = 0
        try:
            while True:
                v = self[i]
                yield v
                i += 1
        except IndexError:
            return

    def __str__(self):
        return '<Maze: {}x{}>'.format(self.width, self.height)

    def __repr__(self):
        return str(self)

    def index(self, value):
        '''
        S.index(value) -> integer -- return first index of value.  Raises
        ValueError if the value is not present.

        :param value: A value to search for in this Maze
        :return: The index of the location in this Maze where `value` is first found
        :rtype: int
        :raises ValueError: If `value` is not found in this Maze
        '''
        for i, v in enumerate(self):
            if v == value:
                return i
        raise ValueError

    def count(self, value):
        '''
        S.count(value) -> integer -- return number of occurrences of
        value.

        :param value: A value to count in this Maze
        :return: The number of times `value` is found in this Maze.
        :rtype: int
        '''
        return sum(1 for v in self if v == value)

    @property
    def width(self):
        '''
        Returns this Maze's width.
        '''
        if self._maze is NULL:
            return 0
        return self._maze.m_x

    @property
    def height(self):
        '''
        Returns this Maze's height.
        '''
        if self._maze is NULL:
            return 0
        return self._maze.m_y

    @property
    def entrance(self):
        '''
        Returns this Maze's entrance location as a tuple (x,y).
        '''
        return (self._xEntrance, self._yEntrance)

    @property
    def exit(self):
        '''
        Returns this Maze's exit location as a tuple (x,y).
        '''
        return (self._xExit, self._yExit)

    def get(self, x, y):
        '''
        Gets the monochrome pixel value at the coordinate (x,y) on this
        Maze.

        :param int x: The x-coordinate of the pixel to get
        :param int y: The y-coordinate of the pixel to get
        :return: True if the given pixel is on, False if it is off.
        :rtype: bool
        '''
        if x < 0 or self.width <= x:
            raise IndexError('x coordinate out of range')
        if y < 0 or self.height <= y:
            raise IndexError('y coordinate out of range')
        return cpp_Get(self._maze, x, y)

    def create_perfect(self,
                       fRiver=True,
                       fTreeWall=False,
                       nEntrancePos=ENTRANCE_RANDOM,
                       nRndBias=0,
                       nRndRun=0):
        '''
        Overwrites the contents of this Maze to create a perfect maze
        using the Hunt and Kill algorithm.

        Create a new perfect Maze in the bitmap using the Hunt and
        Kill algorithm, by carving passages.

        :param bool fRiver: If set, creates a Maze with a relatively
            high "river" factor (with relatively longer passages between
            junctions and fewer but longer dead ends).  Defaults to True.
        :param bool fTreeWall: If true, creates the Maze by adding
            walls; if false, creates the Maze by carving passages.
            Defaults to False.
        :param int nEntrancePos: One of ENTRANCE_CORNER (entrance is
            in the upper-left corner, and the exit in the lower-right),
            ENTRANCE_MIDDLE (entrance and exit are in the middle of the
            top and bottom edges), ENTRANCE_BALANCED (entrance and exit
            are placed randomly, but are horizontally "balanced"),
            ENTRANCE_RANDOM (entrance and exit are placed randomly).
            Defaults to ENTRANCE_RANDOM.
        :param int nRndBias: This allows most styles of random Mazes
            created to be passage biased. A biased Maze has
            straightaways that tend to go along one axis more often
            than at other angles. When this value is positive, Mazes
            will be horizontally biased, and when this is negative,
            Mazes will be vertically biased. The farther the value
            from zero, the more extreme the bias. A value of zero
            means no bias.  Defaults to 0.
        :param int nRndRun: This allows some styles of random Mazes
            created to have a "run" factor. The run of a Maze means
            how long straightaways tend to go before forced turnings
            present themselves. A Maze with a low run won’t have
            straight passages for more than three or four cells, and
            will look very random. A Maze with a high run will have
            long passages going across a good percentage of the Maze,
            and will look similar to a microchip. The more this value
            is greater than zero, the higher the run.  Defaults to 0.
        :rtype: None
        '''
        if not cpp_CreateMazePerfect(self._maze,
                                     fRiver,
                                     True,
                                     True,
                                     False,
                                     fTreeWall,
                                     nEntrancePos,
                                     nRndBias,
                                     nRndRun):
            raise MazeError('Could not create Perfect Maze.')
        self._store_back_globals()

    def create_perfect2(self,
                        fRiver=True,
                        nEntrancePos=ENTRANCE_RANDOM,
                        nRndBias=0,
                        nRndRun=0):
        '''
        Overwrites the contents of this Maze to create a Perfect2 maze.

        Create a new perfect Maze in the bitmap using the Hunt and
        Kill algorithm, by adding walls.

        :param bool fRiver: If set, creates a Maze with a relatively
            high "river" factor (with relatively longer passages between
            junctions and fewer but longer dead ends).  Defaults to True.
        :param int nEntrancePos: One of ENTRANCE_CORNER (entrance is
            in the upper-left corner, and the exit in the lower-right),
            ENTRANCE_MIDDLE (entrance and exit are in the middle of the
            top and bottom edges), ENTRANCE_BALANCED (entrance and exit
            are placed randomly, but are horizontally "balanced"),
            ENTRANCE_RANDOM (entrance and exit are placed randomly).
            Defaults to ENTRANCE_RANDOM.
        :param int nRndBias: This allows most styles of random Mazes
            created to be passage biased. A biased Maze has
            straightaways that tend to go along one axis more often
            than at other angles. When this value is positive, Mazes
            will be horizontally biased, and when this is negative,
            Mazes will be vertically biased. The farther the value
            from zero, the more extreme the bias. A value of zero
            means no bias.  Defaults to 0.
        :param int nRndRun: This allows some styles of random Mazes
            created to have a "run" factor. The run of a Maze means
            how long straightaways tend to go before forced turnings
            present themselves. A Maze with a low run won’t have
            straight passages for more than three or four cells, and
            will look very random. A Maze with a high run will have
            long passages going across a good percentage of the Maze,
            and will look similar to a microchip. The more this value
            is greater than zero, the higher the run.  Defaults to 0.
        :rtype: None
        '''
        if not cpp_CreateMazePerfect2(self._maze,
                                      fRiver,
                                      False,
                                      nEntrancePos,
                                      nRndBias,
                                      nRndRun):
            raise MazeError('Could not create Perfect2 Maze.')
        self._store_back_globals()

    def create_braid(self,
                     nEntrancePos=ENTRANCE_RANDOM,
                     nRndBias=0,
                     nRndRun=0):
        '''
        Overwrites the contents of this Maze to create a Braid maze.

        Create a new braid Maze in the bitmap, i.e. a Maze without any
        dead ends, using a wall adding algorithm.

        :param int nEntrancePos: One of ENTRANCE_CORNER (entrance is
            in the upper-left corner, and the exit in the lower-right),
            ENTRANCE_MIDDLE (entrance and exit are in the middle of the
            top and bottom edges), ENTRANCE_BALANCED (entrance and exit
            are placed randomly, but are horizontally "balanced"),
            ENTRANCE_RANDOM (entrance and exit are placed randomly).
            Defaults to ENTRANCE_RANDOM.
        :param int nRndBias: This allows most styles of random Mazes
            created to be passage biased. A biased Maze has
            straightaways that tend to go along one axis more often
            than at other angles. When this value is positive, Mazes
            will be horizontally biased, and when this is negative,
            Mazes will be vertically biased. The farther the value
            from zero, the more extreme the bias. A value of zero
            means no bias.  Defaults to 0.
        :param int nRndRun: This allows some styles of random Mazes
            created to have a "run" factor. The run of a Maze means
            how long straightaways tend to go before forced turnings
            present themselves. A Maze with a low run won’t have
            straight passages for more than three or four cells, and
            will look very random. A Maze with a high run will have
            long passages going across a good percentage of the Maze,
            and will look similar to a microchip. The more this value
            is greater than zero, the higher the run.  Defaults to 0.
        :rtype: None
        '''
        if not cpp_CreateMazeBraid(self._maze,
                                   False,
                                   nEntrancePos,
                                   nRndBias,
                                   nRndRun):
            raise MazeError('Could not create Braid Maze.')
        self._store_back_globals()

    def create_braid_tilt(self,
                          fTiltDiamond=False,
                          nEntrancePos=ENTRANCE_RANDOM,
                          nRndBias=0,
                          nRndRun=0):
        '''
        Overwrites the contents of this Maze to create a BraidTilt maze.

        Create a new braid Maze in the bitmap using a binary
        algorithm, i.e.  starting with a template based on the Tilt
        Maze pattern.

        :param bool fTiltDiamond: When this is set, there will never
            be any "diamonds" or places where 2x2 groups of diagonal
            lines fit together to make a diamond shaped
            space. Defaults to False.
        :param int nEntrancePos: One of ENTRANCE_CORNER (entrance is
            in the upper-left corner, and the exit in the lower-right),
            ENTRANCE_MIDDLE (entrance and exit are in the middle of the
            top and bottom edges), ENTRANCE_BALANCED (entrance and exit
            are placed randomly, but are horizontally "balanced"),
            ENTRANCE_RANDOM (entrance and exit are placed randomly).
            Defaults to ENTRANCE_RANDOM.
        :param int nRndBias: This allows most styles of random Mazes
            created to be passage biased. A biased Maze has
            straightaways that tend to go along one axis more often
            than at other angles. When this value is positive, Mazes
            will be horizontally biased, and when this is negative,
            Mazes will be vertically biased. The farther the value
            from zero, the more extreme the bias. A value of zero
            means no bias.  Defaults to 0.
        :param int nRndRun: This allows some styles of random Mazes
            created to have a "run" factor. The run of a Maze means
            how long straightaways tend to go before forced turnings
            present themselves. A Maze with a low run won’t have
            straight passages for more than three or four cells, and
            will look very random. A Maze with a high run will have
            long passages going across a good percentage of the Maze,
            and will look similar to a microchip. The more this value
            is greater than zero, the higher the run.  Defaults to 0.
        :rtype: None
        '''
        if not cpp_CreateMazeBraidTilt(self._maze,
                                       False,
                                       fTiltDiamond,
                                       nEntrancePos,
                                       nRndBias,
                                       nRndRun):
            raise MazeError('Could not create BraidTilt Maze.')
        self._store_back_globals()

    def create_spiral(self,
                      cRandomAdd=0,
                      cSpiral=15,
                      cSpiralWall=15,
                      nEntrancePos=ENTRANCE_RANDOM,
                      nRndBias=0,
                      nRndRun=0):
        '''
        Overwrites the contents of this Maze to create a Spiral maze.

        Create a new spiral Maze in the bitmap, formed of interlocking
        spirals.

        :param int cRandomAdd: The number of random walls and passages
            to add to the maze.  A high number will make the maze more
            random and less like its base design, while a large negative
            number will make the maze be its base design with longer
            passages and dead ends.  Defaults to 0.
        :param int cSpiral: The maximum number of spirals that can be
            drawn at once.  Larger numbers make the maze have many
            smaller spirals; smaller number make the maze have fewer,
            larger spirals.  Defaults to 15.
        :param int cSpiralWall: The maximum number of walls that can
            be drawn at once around each spiral.  Larger numbers make
            spirals have many passages that rapidly spiral away from
            the centre, while smaller values make spirals with fewer
            passages that go around the centre more times. Defaults to
            15.
        :param int nEntrancePos: One of ENTRANCE_CORNER (entrance is
            in the upper-left corner, and the exit in the lower-right),
            ENTRANCE_MIDDLE (entrance and exit are in the middle of the
            top and bottom edges), ENTRANCE_BALANCED (entrance and exit
            are placed randomly, but are horizontally "balanced"),
            ENTRANCE_RANDOM (entrance and exit are placed randomly).
            Defaults to ENTRANCE_RANDOM.
        :param int nRndBias: This allows most styles of random Mazes
            created to be passage biased. A biased Maze has
            straightaways that tend to go along one axis more often
            than at other angles. When this value is positive, Mazes
            will be horizontally biased, and when this is negative,
            Mazes will be vertically biased. The farther the value
            from zero, the more extreme the bias. A value of zero
            means no bias.  Defaults to 0.
        :param int nRndRun: This allows some styles of random Mazes
            created to have a "run" factor. The run of a Maze means
            how long straightaways tend to go before forced turnings
            present themselves. A Maze with a low run won’t have
            straight passages for more than three or four cells, and
            will look very random. A Maze with a high run will have
            long passages going across a good percentage of the Maze,
            and will look similar to a microchip. The more this value
            is greater than zero, the higher the run.  Defaults to 0.
        :rtype: None
        '''
        if not cpp_CreateMazeSpiral(self._maze,
                                    cRandomAdd,
                                    cSpiral,
                                    cSpiralWall,
                                    False,
                                    nEntrancePos,
                                    nRndBias,
                                    nRndRun):
            raise MazeError('Could not create Spiral Maze.')
        self._store_back_globals()

    def create_diagonal(self,
                        cRandomAdd=0,
                        nEntrancePos=ENTRANCE_RANDOM,
                        nRndBias=0,
                        nRndRun=0):
        '''
        Overwrites the contents of this Maze to create a Diagonal maze.

        Create a Maze with a diagonal bias, where many walls look like
        stairs.

        :param int cRandomAdd: The number of random walls and passages
            to add to the maze.  A high number will make the maze more
            random and less like its base design, while a large negative
            number will make the maze be its base design with longer
            passages and dead ends.  Defaults to 0.
        :param int nEntrancePos: One of ENTRANCE_CORNER (entrance is
            in the upper-left corner, and the exit in the lower-right),
            ENTRANCE_MIDDLE (entrance and exit are in the middle of the
            top and bottom edges), ENTRANCE_BALANCED (entrance and exit
            are placed randomly, but are horizontally "balanced"),
            ENTRANCE_RANDOM (entrance and exit are placed randomly).
            Defaults to ENTRANCE_RANDOM.
        :param int nRndBias: This allows most styles of random Mazes
            created to be passage biased. A biased Maze has
            straightaways that tend to go along one axis more often
            than at other angles. When this value is positive, Mazes
            will be horizontally biased, and when this is negative,
            Mazes will be vertically biased. The farther the value
            from zero, the more extreme the bias. A value of zero
            means no bias.  Defaults to 0.
        :param int nRndRun: This allows some styles of random Mazes
            created to have a "run" factor. The run of a Maze means
            how long straightaways tend to go before forced turnings
            present themselves. A Maze with a low run won’t have
            straight passages for more than three or four cells, and
            will look very random. A Maze with a high run will have
            long passages going across a good percentage of the Maze,
            and will look similar to a microchip. The more this value
            is greater than zero, the higher the run.  Defaults to 0.
        :rtype: None
        '''
        if not cpp_CreateMazeDiagonal(self._maze,
                                      cRandomAdd,
                                      False,
                                      nEntrancePos,
                                      nRndBias,
                                      nRndRun):
            raise MazeError('Could not create Diagonal Maze.')
        self._store_back_globals()

    def create_recursive(self,
                         nEntrancePos=ENTRANCE_RANDOM,
                         nRndBias=0,
                         nRndRun=0):
        '''
        Overwrites the contents of this Maze to create a Recursive maze.

        Create a new perfect Maze in the bitmap using the Recursive
        Backtracking algorithm. This carves passages.

        :param int nEntrancePos: One of ENTRANCE_CORNER (entrance is
            in the upper-left corner, and the exit in the lower-right),
            ENTRANCE_MIDDLE (entrance and exit are in the middle of the
            top and bottom edges), ENTRANCE_BALANCED (entrance and exit
            are placed randomly, but are horizontally "balanced"),
            ENTRANCE_RANDOM (entrance and exit are placed randomly).
            Defaults to ENTRANCE_RANDOM.
        :param int nRndBias: This allows most styles of random Mazes
            created to be passage biased. A biased Maze has
            straightaways that tend to go along one axis more often
            than at other angles. When this value is positive, Mazes
            will be horizontally biased, and when this is negative,
            Mazes will be vertically biased. The farther the value
            from zero, the more extreme the bias. A value of zero
            means no bias.  Defaults to 0.
        :param int nRndRun: This allows some styles of random Mazes
            created to have a "run" factor. The run of a Maze means
            how long straightaways tend to go before forced turnings
            present themselves. A Maze with a low run won’t have
            straight passages for more than three or four cells, and
            will look very random. A Maze with a high run will have
            long passages going across a good percentage of the Maze,
            and will look similar to a microchip. The more this value
            is greater than zero, the higher the run.  Defaults to 0.
        :rtype: None
        '''
        if not cpp_CreateMazeRecursive(self._maze,
                                       False,
                                       nEntrancePos,
                                       nRndBias,
                                       nRndRun):
            raise MazeError('Could not create Recursive Maze.')
        self._store_back_globals()

    def create_prim(self,
                    fTreeWall=False,
                    nEntrancePos=ENTRANCE_RANDOM,
                    nRndBias=0,
                    nRndRun=0):
        '''
        Overwrites the contents of this Maze to create a Prim maze.

        Create a new perfect Maze in the bitmap using a modified
        version of Prim's algorithm. This can carve passages or add
        walls.

        :param bool fTreeWall: If true, creates the Maze by adding
            walls; if false, creates the Maze by carving passages.
            Defaults to False.
        :param int nEntrancePos: One of ENTRANCE_CORNER (entrance is
            in the upper-left corner, and the exit in the lower-right),
            ENTRANCE_MIDDLE (entrance and exit are in the middle of the
            top and bottom edges), ENTRANCE_BALANCED (entrance and exit
            are placed randomly, but are horizontally "balanced"),
            ENTRANCE_RANDOM (entrance and exit are placed randomly).
            Defaults to ENTRANCE_RANDOM.
        :param int nRndBias: This allows most styles of random Mazes
            created to be passage biased. A biased Maze has
            straightaways that tend to go along one axis more often
            than at other angles. When this value is positive, Mazes
            will be horizontally biased, and when this is negative,
            Mazes will be vertically biased. The farther the value
            from zero, the more extreme the bias. A value of zero
            means no bias.  Defaults to 0.
        :param int nRndRun: This allows some styles of random Mazes
            created to have a "run" factor. The run of a Maze means
            how long straightaways tend to go before forced turnings
            present themselves. A Maze with a low run won’t have
            straight passages for more than three or four cells, and
            will look very random. A Maze with a high run will have
            long passages going across a good percentage of the Maze,
            and will look similar to a microchip. The more this value
            is greater than zero, the higher the run.  Defaults to 0.
        :rtype: None
        '''
        if not cpp_CreateMazePrim(self._maze,
                                  False,
                                  fTreeWall,
                                  nEntrancePos,
                                  nRndBias,
                                  nRndRun):
            raise MazeError('Could not create Prim Maze.')
        self._store_back_globals()

    def create_prim2(self,
                     fTreeRandom=True,
                     fTreeWall=False,
                     nEntrancePos=ENTRANCE_RANDOM,
                     nRndBias=0,
                     nRndRun=0):
        '''
        Overwrites the contents of this Maze to create a Prim2 maze.

        Create a new perfect Maze in the bitmap using full or
        simplified versions of Prim's algorithm. This can carve
        passages or add walls.

        :param bool fTreeRandom: If False, the algorithm will tend to
            create Mazes with long and windy solutions; if True, the
            solution will tend to be shorter and more direct.
            Defaults to True.
        :param bool fTreeWall: If true, creates the Maze by adding
            walls; if false, creates the Maze by carving passages.
            Defaults to False.
        :param int nEntrancePos: One of ENTRANCE_CORNER (entrance is
            in the upper-left corner, and the exit in the lower-right),
            ENTRANCE_MIDDLE (entrance and exit are in the middle of the
            top and bottom edges), ENTRANCE_BALANCED (entrance and exit
            are placed randomly, but are horizontally "balanced"),
            ENTRANCE_RANDOM (entrance and exit are placed randomly).
            Defaults to ENTRANCE_RANDOM.
        :param int nRndBias: This allows most styles of random Mazes
            created to be passage biased. A biased Maze has
            straightaways that tend to go along one axis more often
            than at other angles. When this value is positive, Mazes
            will be horizontally biased, and when this is negative,
            Mazes will be vertically biased. The farther the value
            from zero, the more extreme the bias. A value of zero
            means no bias.  Defaults to 0.
        :param int nRndRun: This allows some styles of random Mazes
            created to have a "run" factor. The run of a Maze means
            how long straightaways tend to go before forced turnings
            present themselves. A Maze with a low run won’t have
            straight passages for more than three or four cells, and
            will look very random. A Maze with a high run will have
            long passages going across a good percentage of the Maze,
            and will look similar to a microchip. The more this value
            is greater than zero, the higher the run.  Defaults to 0.
        :rtype: None
        '''
        if not cpp_CreateMazePrim2(self._maze,
                                   False,
                                   fTreeRandom,
                                   fTreeWall,
                                   nEntrancePos,
                                   nRndBias,
                                   nRndRun):
            raise MazeError('Could not create Prim2 Maze.')
        self._store_back_globals()

    def create_kruskal(self, fClear, c2, c3,
                       fKruskalPic=False,
                       fTreeWall=False,
                       nEntrancePos=ENTRANCE_RANDOM,
                       nRndBias=0,
                       nRndRun=0):
        '''
        Overwrites the contents of this Maze to create a Kruskal maze.

        Create a new perfect Maze in the bitmap using Kruskal's
        algorithm. This can carve passages or add walls.

        :param bool fKruskalPic: defaults to False
        :param bool fTreeWall: If true, creates the Maze by adding
            walls; if false, creates the Maze by carving passages.
            Defaults to False.
        :param int nEntrancePos: One of ENTRANCE_CORNER (entrance is
            in the upper-left corner, and the exit in the lower-right),
            ENTRANCE_MIDDLE (entrance and exit are in the middle of the
            top and bottom edges), ENTRANCE_BALANCED (entrance and exit
            are placed randomly, but are horizontally "balanced"),
            ENTRANCE_RANDOM (entrance and exit are placed randomly).
            Defaults to ENTRANCE_RANDOM.
        :param int nRndBias: This allows most styles of random Mazes
            created to be passage biased. A biased Maze has
            straightaways that tend to go along one axis more often
            than at other angles. When this value is positive, Mazes
            will be horizontally biased, and when this is negative,
            Mazes will be vertically biased. The farther the value
            from zero, the more extreme the bias. A value of zero
            means no bias.  Defaults to 0.
        :param int nRndRun: This allows some styles of random Mazes
            created to have a "run" factor. The run of a Maze means
            how long straightaways tend to go before forced turnings
            present themselves. A Maze with a low run won’t have
            straight passages for more than three or four cells, and
            will look very random. A Maze with a high run will have
            long passages going across a good percentage of the Maze,
            and will look similar to a microchip. The more this value
            is greater than zero, the higher the run.  Defaults to 0.
        :rtype: None
        '''
        # TODO
        cdef CCol *cpp_c2 = NULL
        cdef CCol *cpp_c3 = NULL
        if not cpp_CreateMazeKruskal(self._maze, fClear, cpp_c2, cpp_c3,
                                     fKruskalPic,
                                     False,
                                     fTreeWall,
                                     nEntrancePos,
                                     nRndBias,
                                     nRndRun):
            raise MazeError('Could not create Kruskal Maze.')
        self._store_back_globals()

    def create_tree(self,
                    fTreeRandom=True,
                    fTreeWall=False,
                    nEntrancePos=ENTRANCE_RANDOM,
                    nRndBias=0,
                    nRndRun=0,
                    nTreeRiver=10):
        '''
        Overwrites the contents of this Maze to create a Tree maze.

        Create a new perfect Maze in the bitmap using the Growing Tree
        algorithm.  This can carve passages or add walls.

        :param bool fTreeRandom: If False, the algorithm will tend to
            create Mazes with long and windy solutions; if True, the
            solution will tend to be shorter and more direct.
            Defaults to True.
        :param bool fTreeWall: If true, creates the Maze by adding
            walls; if false, creates the Maze by carving passages.
            Defaults to False.
        :param int nEntrancePos: One of ENTRANCE_CORNER (entrance is
            in the upper-left corner, and the exit in the lower-right),
            ENTRANCE_MIDDLE (entrance and exit are in the middle of the
            top and bottom edges), ENTRANCE_BALANCED (entrance and exit
            are placed randomly, but are horizontally "balanced"),
            ENTRANCE_RANDOM (entrance and exit are placed randomly).
            Defaults to ENTRANCE_RANDOM.
        :param int nRndBias: This allows most styles of random Mazes
            created to be passage biased. A biased Maze has
            straightaways that tend to go along one axis more often
            than at other angles. When this value is positive, Mazes
            will be horizontally biased, and when this is negative,
            Mazes will be vertically biased. The farther the value
            from zero, the more extreme the bias. A value of zero
            means no bias.  Defaults to 0.
        :param int nRndRun: This allows some styles of random Mazes
            created to have a "run" factor. The run of a Maze means
            how long straightaways tend to go before forced turnings
            present themselves. A Maze with a low run won’t have
            straight passages for more than three or four cells, and
            will look very random. A Maze with a high run will have
            long passages going across a good percentage of the Maze,
            and will look similar to a microchip. The more this value
            is greater than zero, the higher the run.  Defaults to 0.
        :param int nTreeRiver: with fTreeRandom set to False, this
            determines how many of the most recent sections to choose
            from; higher values give less windy solutions.  With
            fTreeRandom set to True, higher values of this param give
            more windy solutions.  Defaults to 10.
        :rtype: None
        '''
        if not cpp_CreateMazeTree(self._maze,
                                  False,
                                  fTreeRandom,
                                  fTreeWall,
                                  nEntrancePos,
                                  nRndBias,
                                  nRndRun,
                                  nTreeRiver):
            raise MazeError('Could not create Tree Maze.')
        self._store_back_globals()

    def create_forest(self, fWall,
                      fTreeRandom=True,
                      fTreeWall=False,
                      nEntrancePos=ENTRANCE_RANDOM,
                      nForsAdd=-100,
                      nForsInit=1,
                      nRndBias=0,
                      nRndRun=0,
                      nTreeRiver=10):
        '''
        Overwrites the contents of this Maze to create a Forest maze.

        Create a new perfect Maze in the bitmap using the Growing
        Forest algorithm.  This can carve passages or add walls.

        The Growing Forest algorithm is basically multiple instances
        of the Growing Tree algorithm running at the same time.

        :param bool fTreeRandom: If False, the algorithm will tend to
            create Mazes with long and windy solutions; if True, the
            solution will tend to be shorter and more direct.
            Defaults to True.
        :param bool fTreeWall: If true, creates the Maze by adding
            walls; if false, creates the Maze by carving passages.
            Defaults to False.
        :param int nEntrancePos: One of ENTRANCE_CORNER (entrance is
            in the upper-left corner, and the exit in the lower-right),
            ENTRANCE_MIDDLE (entrance and exit are in the middle of the
            top and bottom edges), ENTRANCE_BALANCED (entrance and exit
            are placed randomly, but are horizontally "balanced"),
            ENTRANCE_RANDOM (entrance and exit are placed randomly).
            Defaults to ENTRANCE_RANDOM.
        :param int nForsAdd: Indicates the number of instances to add
            each time a cell is added to the Maze: If positive, the
            field indicates the exact number of instances to add, and,
            if negative, indicates that one instance should be added
            every X cells. Defaults to -100.
        :param int nForsInit: The number of instances to begin with.
            If positive, the field indicates the exact number of
            instances, and, if negative, the field indicates that one
            in X cells should start out as instances. Defaults to 1.
            If both nForsInit is 1 and nForsAdd is 0, then this
            function behaves like the Growing Tree algorithm.
        :param int nRndBias: This allows most styles of random Mazes
            created to be passage biased. A biased Maze has
            straightaways that tend to go along one axis more often
            than at other angles. When this value is positive, Mazes
            will be horizontally biased, and when this is negative,
            Mazes will be vertically biased. The farther the value
            from zero, the more extreme the bias. A value of zero
            means no bias.  Defaults to 0.
        :param int nRndRun: This allows some styles of random Mazes
            created to have a "run" factor. The run of a Maze means
            how long straightaways tend to go before forced turnings
            present themselves. A Maze with a low run won’t have
            straight passages for more than three or four cells, and
            will look very random. A Maze with a high run will have
            long passages going across a good percentage of the Maze,
            and will look similar to a microchip. The more this value
            is greater than zero, the higher the run.  Defaults to 0.
        :param int nTreeRiver: with fTreeRandom set to False, this
            determines how many of the most recent sections to choose
            from; higher values give less windy solutions.  With
            fTreeRandom set to True, higher values of this param give
            more windy solutions.  Defaults to 10.
        :rtype: None
        '''
        if not cpp_CreateMazeForest(self._maze, fWall,
                                    True,
                                    False,
                                    fTreeRandom,
                                    fTreeWall,
                                    nEntrancePos,
                                    nForsAdd,
                                    nForsInit,
                                    nRndBias,
                                    nRndRun,
                                    nTreeRiver):
            raise MazeError('Could not create Forest Maze.')
        self._store_back_globals()

    def create_aldous_broder(self,
                             fTreeWall=False,
                             nEntrancePos=ENTRANCE_RANDOM,
                             nRndBias=0,
                             nRndRun=0):
        '''
        Overwrites the contents of this Maze to create a AldousBroder maze.

        Create a new perfect Maze in the bitmap using the
        Aldous-Broder algorithm.  This can carve passages or add
        walls. This is the simplest unbiased algorithm for creating
        perfect Mazes.

        :param bool fTreeWall: If true, creates the Maze by adding
            walls; if false, creates the Maze by carving passages.
            Defaults to False.
        :param int nEntrancePos: One of ENTRANCE_CORNER (entrance is
            in the upper-left corner, and the exit in the lower-right),
            ENTRANCE_MIDDLE (entrance and exit are in the middle of the
            top and bottom edges), ENTRANCE_BALANCED (entrance and exit
            are placed randomly, but are horizontally "balanced"),
            ENTRANCE_RANDOM (entrance and exit are placed randomly).
            Defaults to ENTRANCE_RANDOM.
        :param int nRndBias: This allows most styles of random Mazes
            created to be passage biased. A biased Maze has
            straightaways that tend to go along one axis more often
            than at other angles. When this value is positive, Mazes
            will be horizontally biased, and when this is negative,
            Mazes will be vertically biased. The farther the value
            from zero, the more extreme the bias. A value of zero
            means no bias.  Defaults to 0.
        :param int nRndRun: This allows some styles of random Mazes
            created to have a "run" factor. The run of a Maze means
            how long straightaways tend to go before forced turnings
            present themselves. A Maze with a low run won’t have
            straight passages for more than three or four cells, and
            will look very random. A Maze with a high run will have
            long passages going across a good percentage of the Maze,
            and will look similar to a microchip. The more this value
            is greater than zero, the higher the run.  Defaults to 0.
        :rtype: None
        '''
        if not cpp_CreateMazeAldousBroder(self._maze,
                                          False,
                                          fTreeWall,
                                          nEntrancePos,
                                          nRndBias,
                                          nRndRun):
            raise MazeError('Could not create AldousBroder Maze.')
        self._store_back_globals()

    def create_wilson(self,
                      fTreeWall=False,
                      nEntrancePos=ENTRANCE_RANDOM,
                      nRndBias=0,
                      nRndRun=0):
        '''
        Overwrites the contents of this Maze to create a Wilson maze.

        Create a new perfect Maze in the bitmap using Wilson's
        algorithm. This can carve passages or add walls. Like the
        Aldous-Broder algorithm, this generates all possible Mazes
        with equal probability, however this runs about five times
        faster on average.

        :param bool fTreeWall: If true, creates the Maze by adding
            walls; if false, creates the Maze by carving passages.
            Defaults to False.
        :param int nEntrancePos: One of ENTRANCE_CORNER (entrance is
            in the upper-left corner, and the exit in the lower-right),
            ENTRANCE_MIDDLE (entrance and exit are in the middle of the
            top and bottom edges), ENTRANCE_BALANCED (entrance and exit
            are placed randomly, but are horizontally "balanced"),
            ENTRANCE_RANDOM (entrance and exit are placed randomly).
            Defaults to ENTRANCE_RANDOM.
        :param int nRndBias: This allows most styles of random Mazes
            created to be passage biased. A biased Maze has
            straightaways that tend to go along one axis more often
            than at other angles. When this value is positive, Mazes
            will be horizontally biased, and when this is negative,
            Mazes will be vertically biased. The farther the value
            from zero, the more extreme the bias. A value of zero
            means no bias.  Defaults to 0.
        :param int nRndRun: This allows some styles of random Mazes
            created to have a "run" factor. The run of a Maze means
            how long straightaways tend to go before forced turnings
            present themselves. A Maze with a low run won’t have
            straight passages for more than three or four cells, and
            will look very random. A Maze with a high run will have
            long passages going across a good percentage of the Maze,
            and will look similar to a microchip. The more this value
            is greater than zero, the higher the run.  Defaults to 0.
        :rtype: None
        '''
        if not cpp_CreateMazeWilson(self._maze,
                                    False,
                                    fTreeWall,
                                    nEntrancePos,
                                    nRndBias,
                                    nRndRun):
            raise MazeError('Could not create Wilson Maze.')
        self._store_back_globals()

    def create_eller(self,
                     fTreeWall=False,
                     nEntrancePos=ENTRANCE_RANDOM,
                     nRndBias=0,
                     nRndRun=0):
        '''
        Overwrites the contents of this Maze to create a Eller maze.

        Create a new perfect Maze in the bitmap using Eller's
        algorithm. This can carve passages or add walls. This is the
        fastest algorithm for creating general perfect Mazes, and runs
        over twice as fast as any of the others.

        :param bool fTreeWall: If true, creates the Maze by adding
            walls; if false, creates the Maze by carving passages.
            Defaults to False.
        :param int nEntrancePos: One of ENTRANCE_CORNER (entrance is
            in the upper-left corner, and the exit in the lower-right),
            ENTRANCE_MIDDLE (entrance and exit are in the middle of the
            top and bottom edges), ENTRANCE_BALANCED (entrance and exit
            are placed randomly, but are horizontally "balanced"),
            ENTRANCE_RANDOM (entrance and exit are placed randomly).
            Defaults to ENTRANCE_RANDOM.
        :param int nRndBias: This allows most styles of random Mazes
            created to be passage biased. A biased Maze has
            straightaways that tend to go along one axis more often
            than at other angles. When this value is positive, Mazes
            will be horizontally biased, and when this is negative,
            Mazes will be vertically biased. The farther the value
            from zero, the more extreme the bias. A value of zero
            means no bias.  Defaults to 0.
        :param int nRndRun: This allows some styles of random Mazes
            created to have a "run" factor. The run of a Maze means
            how long straightaways tend to go before forced turnings
            present themselves. A Maze with a low run won’t have
            straight passages for more than three or four cells, and
            will look very random. A Maze with a high run will have
            long passages going across a good percentage of the Maze,
            and will look similar to a microchip. The more this value
            is greater than zero, the higher the run.  Defaults to 0.
        :rtype: None
        '''
        if not cpp_CreateMazeEller(self._maze,
                                   False,
                                   fTreeWall,
                                   nEntrancePos,
                                   nRndBias,
                                   nRndRun):
            raise MazeError('Could not create Eller Maze.')
        self._store_back_globals()

    def create_braid_eller(self,
                           nEntrancePos=ENTRANCE_RANDOM,
                           nRndBias=0,
                           nRndRun=0):
        '''
        Overwrites the contents of this Maze to create a BraidEller maze.

        Create a new braid Maze in a bitmap using a variation of
        Eller's Algorithm.

        :param int nEntrancePos: One of ENTRANCE_CORNER (entrance is
            in the upper-left corner, and the exit in the lower-right),
            ENTRANCE_MIDDLE (entrance and exit are in the middle of the
            top and bottom edges), ENTRANCE_BALANCED (entrance and exit
            are placed randomly, but are horizontally "balanced"),
            ENTRANCE_RANDOM (entrance and exit are placed randomly).
            Defaults to ENTRANCE_RANDOM.
        :param int nRndBias: This allows most styles of random Mazes
            created to be passage biased. A biased Maze has
            straightaways that tend to go along one axis more often
            than at other angles. When this value is positive, Mazes
            will be horizontally biased, and when this is negative,
            Mazes will be vertically biased. The farther the value
            from zero, the more extreme the bias. A value of zero
            means no bias.  Defaults to 0.
        :param int nRndRun: This allows some styles of random Mazes
            created to have a "run" factor. The run of a Maze means
            how long straightaways tend to go before forced turnings
            present themselves. A Maze with a low run won’t have
            straight passages for more than three or four cells, and
            will look very random. A Maze with a high run will have
            long passages going across a good percentage of the Maze,
            and will look similar to a microchip. The more this value
            is greater than zero, the higher the run.  Defaults to 0.
        :rtype: None
        '''
        if not cpp_CreateMazeBraidEller(self._maze,
                                        False,
                                        nEntrancePos,
                                        nRndBias,
                                        nRndRun):
            raise MazeError('Could not create BraidEller Maze.')
        self._store_back_globals()

    def create_division(self,
                        nEntrancePos=ENTRANCE_RANDOM,
                        nRndBias=0,
                        nRndRun=0):
        '''
        Overwrites the contents of this Maze to create a Division maze.

        Create a new perfect Maze in the bitmap using recursive
        division. This always adds walls, recursively dividing the
        Maze into smaller rectangles.

        :param int nEntrancePos: One of ENTRANCE_CORNER (entrance is
            in the upper-left corner, and the exit in the lower-right),
            ENTRANCE_MIDDLE (entrance and exit are in the middle of the
            top and bottom edges), ENTRANCE_BALANCED (entrance and exit
            are placed randomly, but are horizontally "balanced"),
            ENTRANCE_RANDOM (entrance and exit are placed randomly).
            Defaults to ENTRANCE_RANDOM.
        :param int nRndBias: This allows most styles of random Mazes
            created to be passage biased. A biased Maze has
            straightaways that tend to go along one axis more often
            than at other angles. When this value is positive, Mazes
            will be horizontally biased, and when this is negative,
            Mazes will be vertically biased. The farther the value
            from zero, the more extreme the bias. A value of zero
            means no bias.  Defaults to 0.
        :param int nRndRun: This allows some styles of random Mazes
            created to have a "run" factor. The run of a Maze means
            how long straightaways tend to go before forced turnings
            present themselves. A Maze with a low run won’t have
            straight passages for more than three or four cells, and
            will look very random. A Maze with a high run will have
            long passages going across a good percentage of the Maze,
            and will look similar to a microchip. The more this value
            is greater than zero, the higher the run.  Defaults to 0.
        :rtype: None
        '''
        if not cpp_CreateMazeDivision(self._maze,
                                      False,
                                      nEntrancePos,
                                      nRndBias,
                                      nRndRun):
            raise MazeError('Could not create Division Maze.')
        self._store_back_globals()

    def create_binary(self,
                      cRandomAdd=0,
                      fTreeWall=False,
                      nEntrancePos=ENTRANCE_RANDOM,
                      nRndBias=0,
                      nRndRun=0):
        '''
        Overwrites the contents of this Maze to create a Binary maze.

        Create a new perfect Maze in the bitmap using the Binary Tree
        algorithm.  This can carve passages or add walls. This is the
        simplest algorithm of any type for creating perfect
        Mazes.

        :param int cRandomAdd: The number of random walls and passages
            to add to the maze.  A high number will make the maze more
            random and less like its base design, while a large negative
            number will make the maze be its base design with longer
            passages and dead ends.  Defaults to 0.
        :param bool fTreeWall: If true, creates the Maze by adding
            walls; if false, creates the Maze by carving passages.
            Defaults to False.
        :param int nEntrancePos: One of ENTRANCE_CORNER (entrance is
            in the upper-left corner, and the exit in the lower-right),
            ENTRANCE_MIDDLE (entrance and exit are in the middle of the
            top and bottom edges), ENTRANCE_BALANCED (entrance and exit
            are placed randomly, but are horizontally "balanced"),
            ENTRANCE_RANDOM (entrance and exit are placed randomly).
            Defaults to ENTRANCE_RANDOM.
        :param int nRndBias: This allows most styles of random Mazes
            created to be passage biased. A biased Maze has
            straightaways that tend to go along one axis more often
            than at other angles. When this value is positive, Mazes
            will be horizontally biased, and when this is negative,
            Mazes will be vertically biased. The farther the value
            from zero, the more extreme the bias. A value of zero
            means no bias.  Defaults to 0.
        :param int nRndRun: This allows some styles of random Mazes
            created to have a "run" factor. The run of a Maze means
            how long straightaways tend to go before forced turnings
            present themselves. A Maze with a low run won’t have
            straight passages for more than three or four cells, and
            will look very random. A Maze with a high run will have
            long passages going across a good percentage of the Maze,
            and will look similar to a microchip. The more this value
            is greater than zero, the higher the run.  Defaults to 0.
        :rtype: None
        '''
        if not cpp_CreateMazeBinary(self._maze,
                                    cRandomAdd,
                                    False,
                                    fTreeWall,
                                    nEntrancePos,
                                    nRndBias,
                                    nRndRun):
            raise MazeError('Could not create Binary Maze.')
        self._store_back_globals()

    def create_sidewinder(self,
                          fTreeWall=False,
                          nEntrancePos=ENTRANCE_RANDOM,
                          nRndBias=0,
                          nRndRun=0):
        '''
        Overwrites the contents of this Maze to create a Sidewinder maze.

        Create a new perfect Maze in the bitmap using the Sidewinder
        algorithm.  This can carve passages or add walls.

        :param bool fTreeWall: If true, creates the Maze by adding
            walls; if false, creates the Maze by carving passages.
            Defaults to False.
        :param int nEntrancePos: One of ENTRANCE_CORNER (entrance is
            in the upper-left corner, and the exit in the lower-right),
            ENTRANCE_MIDDLE (entrance and exit are in the middle of the
            top and bottom edges), ENTRANCE_BALANCED (entrance and exit
            are placed randomly, but are horizontally "balanced"),
            ENTRANCE_RANDOM (entrance and exit are placed randomly).
            Defaults to ENTRANCE_RANDOM.
        :param int nRndBias: This allows most styles of random Mazes
            created to be passage biased. A biased Maze has
            straightaways that tend to go along one axis more often
            than at other angles. When this value is positive, Mazes
            will be horizontally biased, and when this is negative,
            Mazes will be vertically biased. The farther the value
            from zero, the more extreme the bias. A value of zero
            means no bias.  Defaults to 0.
        :param int nRndRun: This allows some styles of random Mazes
            created to have a "run" factor. The run of a Maze means
            how long straightaways tend to go before forced turnings
            present themselves. A Maze with a low run won’t have
            straight passages for more than three or four cells, and
            will look very random. A Maze with a high run will have
            long passages going across a good percentage of the Maze,
            and will look similar to a microchip. The more this value
            is greater than zero, the higher the run.  Defaults to 0.
        :rtype: None
        '''
        if not cpp_CreateMazeSidewinder(self._maze,
                                        False,
                                        fTreeWall,
                                        nEntrancePos,
                                        nRndBias,
                                        nRndRun):
            raise MazeError('Could not create Sidewinder Maze.')
        self._store_back_globals()

    def create_unicursal(self,
                         cRandomAdd=0,
                         fRiver=True,
                         fTreeWall=False,
                         nEntrancePos=ENTRANCE_RANDOM,
                         nRndBias=0,
                         nRndRun=0):
        '''
        Overwrites the contents of this Maze to create a Unicursal maze.

        Create a new Unicursal Maze in the bitmap, i.e. a Maze without
        junctions.

        :param int cRandomAdd: The number of random walls and passages
            to add to the maze.  A high number will make the maze more
            random and less like its base design, while a large negative
            number will make the maze be its base design with longer
            passages and dead ends.  Defaults to 0.
        :param bool fRiver: If set, creates a Maze with a relatively
            high "river" factor (with relatively longer passages between
            junctions and fewer but longer dead ends).  Defaults to True.
        :param bool fTreeWall: If true, creates the Maze by adding
            walls; if false, creates the Maze by carving passages.
            Defaults to False.
        :param int nEntrancePos: One of ENTRANCE_CORNER (entrance is
            in the upper-left corner, and the exit in the lower-right),
            ENTRANCE_MIDDLE (entrance and exit are in the middle of the
            top and bottom edges), ENTRANCE_BALANCED (entrance and exit
            are placed randomly, but are horizontally "balanced"),
            ENTRANCE_RANDOM (entrance and exit are placed randomly).
            Defaults to ENTRANCE_RANDOM.
        :param int nRndBias: This allows most styles of random Mazes
            created to be passage biased. A biased Maze has
            straightaways that tend to go along one axis more often
            than at other angles. When this value is positive, Mazes
            will be horizontally biased, and when this is negative,
            Mazes will be vertically biased. The farther the value
            from zero, the more extreme the bias. A value of zero
            means no bias.  Defaults to 0.
        :param int nRndRun: This allows some styles of random Mazes
            created to have a "run" factor. The run of a Maze means
            how long straightaways tend to go before forced turnings
            present themselves. A Maze with a low run won’t have
            straight passages for more than three or four cells, and
            will look very random. A Maze with a high run will have
            long passages going across a good percentage of the Maze,
            and will look similar to a microchip. The more this value
            is greater than zero, the higher the run.  Defaults to 0.
        :rtype: None
        '''
        if not cpp_CreateMazeUnicursal(self._maze,
                                       cRandomAdd,
                                       fRiver,
                                       True,
                                       True,
                                       False,
                                       fTreeWall,
                                       nEntrancePos,
                                       nRndBias,
                                       nRndRun):
            raise MazeError('Could not create Unicursal Maze.')
        self._store_back_globals()

    def resize(self, width, height):
        '''
        Truncates or pads out this Maze to attain the given size.

        :param int width: Odd integer, 3 or greater
        :param int height: Odd integer, 3 or greater
        :rtype: None
        '''
        if width < 0:
            raise ValueError('negative width')
        if height < 0:
            raise ValueError('negative height')
        # if width % 2 != 1:
        #     raise ValueError('width must be odd')
        # if height % 2 != 1:
        #     raise ValueError('height must be odd')
        if not cpp_Resize(self._maze, width, height):
            raise MazeError('Could not resize the Maze.')

    @staticmethod
    def _handle_save_retval(rv):
        '''
        Helper method to handle return values from the Save* methods.

        :param int rv: the value returned from the Save* method.
        :rtype: None
        '''
        if rv == SAVE_NO_MAZE_ERROR:
            raise MazeError('Maze not properly constructed.')
        elif rv == SAVE_NO_FILENAME_GIVEN_ERROR:
            raise MazeError('No filename given.')
        elif rv == SAVE_FILE_OPEN_ERROR:
            raise MazeError('Could not open file.')
        elif rv == SAVE_UNKNOWN_CMD_ERROR:
            raise MazeError('Unknown save command.')
        elif rv == SAVE_SUCCESS:
            pass
        else:
            raise MazeError('Unknown return value from Maze save function.')

    def _store_back_globals(self):
        '''
        Helper function to retrieve global variable values and store them
        into this instance after creating a maze.
        '''
        self._xEntrance = ms.xEntrance
        self._yEntrance = ms.yEntrance
        self._xExit     = ms.xExit
        self._yExit     = ms.yExit

    def save_bitmap(self, filename, kvOn=COLOR_WHITE, kvOff=COLOR_BLACK):
        '''
        Saves this Maze object as a bitmap to the given path.

        :param str filename: The name of the file to write the bitmap
            to.
        :param int kvOn: The colour to draw wall pixels.  Defaults to
            white (COLOR_WHITE).
        :param int kvOff: The colour to draw passage pixels.  Defaults
            to black (COLOR_BLACK).
        :rtype: None
        '''
        retval = cpp_SaveBitmap(self._maze, filename, kvOn, kvOff)
        self._handle_save_retval(retval)

    def save_text(self, filename, fTextClip=True, fLineChar=False, fTextTab=False):
        '''
        Saves this Maze object formatted in ASCII text to the given path.

        :param str filename: the name of the file to write the ASCII
            representation to
        :param bool fTextClip: If this flag is set, lines in the file
            will never end with spaces (trailing space characters are
            dropped). defaults to True
        :param bool fLineChar: If this flag is set, maze walls are
            drawn using horizontal (-) and vertical (|) lines, and
            intersections (+).  If not, walls are drawn using hash
            characters (#). Defaults to False.
        :param bool fTextTab: Insert a tab between each
            character. Defaults to False.
        :rtype: None
        '''
        retval =  cpp_SaveText(self._maze, filename, fTextClip, fLineChar, fTextTab)
        self._handle_save_retval(retval)

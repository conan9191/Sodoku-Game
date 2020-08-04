/**
 * Sodoku
 */
Sudoku = function(size) {
	this.size = size||9;
};

Sudoku.prototype = {
	usedTime : 0,		// Clock
	gameState : 'init',	// State
	gameTimer : null,	// Timer
	layout : [],		// Layout
	answer : [],		// Answer
	answerPosition : [],// Index
	solving : [],		// Blank
	resetData : [],		// Reset
	editIndex: '',		// Id
	mask : null,		// Mask


	// Initiate
	init : function() {
		this.usedTime = 0;
		for (var i = 0; i < this.size; i++) {
			for (var j = 0; j < this.size; j++) {
				this.layout[i * this.size + j] = 0;
				this.solving[i * this.size + j] = 0;
				this.answerPosition[i * this.size + j] = 0;
				for (var h = 0; h < this.size; h++) {
					this.answer[i * this.size * this.size + j * this.size + h] = 0;
				}
			}
		}
	},
	// Takes the answer for the specified column and column
	getAnswer : function(row, col) {
		for (var i = 1; i <= this.size; i++) {
			this.answer[row * this.size * this.size + col * this.size + i - 1] = i;// Suppose I have all the solutions
		}
		// Get rid of what's already in there
		for (var i = 0; i < this.size; i++) {
			if (this.layout[i * this.size + col] != 0) {
				this.answer[row * this.size * this.size + col * this.size
						+ this.layout[i * this.size + col] - 1] = 0;// Remove the elements contained in the column
			}
			if (this.layout[row * this.size + i] != 0) {
				this.answer[row * this.size * this.size + col * this.size
						+ this.layout[row * this.size + i] - 1] = 0;// Removes elements contained in a row
			}
		}
		var subnum = Math.floor(Math.sqrt(this.size));
		var x = Math.floor(row / subnum);
		var y = Math.floor(col / subnum);
		for (var i = x * subnum; i < subnum + x * subnum; i++) {
			for (var j = y * subnum; j < subnum + y * subnum; j++) {
				if (this.layout[i * this.size + j] != 0)
					this.answer[row * this.size * this.size + col * this.size
							+ this.layout[i * this.size + j] - 1] = 0;// Go to the elements in the little box
			}
		}
		this.randomAnswer(row, col);
	},
	// Randomly sort the answers for the specified column and column
	randomAnswer : function(row, col) {
		// Change the order at random
		var list = [];
		for (var i = 0; i < this.size; i++)
			list.push(this.answer[row * this.size * this.size + col * this.size
					+ i]);
		var rdm = 0, idx = 0;
		while (list.length != 0) {
			rdm = Math.floor(Math.random() * list.length);
			this.answer[row * this.size * this.size + col * this.size + idx] = list[rdm];
			list.splice(rdm, 1);
			idx++;
		}
	},
	// Calculates the number of available solutions for the specified column and column
	getAnswerCount : function(row, col) {
		var count = 0;
		for (var i = 0; i < this.size; i++)
			if (this.answer[row * this.size * this.size + col * this.size + i] != 0)
				count++;
		return count;
	},
	// Returns the solution of the specified column and column at the specified position
	getAnswerNum : function(row, col, ansPos) {
		// Returns the solution to the specified position in the specified layout square
		var cnt = 0;
		for (var i = 0; i < this.size; i++) {
			// Finds the solution at the specified location and returns
			if (cnt == ansPos
					&& this.answer[row * this.size * this.size + col
							* this.size + i] != 0)
				return this.answer[row * this.size * this.size + col
						* this.size + i];
			if (this.answer[row * this.size * this.size + col * this.size + i] != 0)
				cnt++;// That's the solution. Adjust the counter
		}
		return 0;//If there is no problem with the logic, it should not happen
	},
	// Generate game scenarios
	generate : function() {
		this.init();
		var curRow = 0, curCol = 0;
		while (curRow != this.size) {
			if (this.answerPosition[curRow * this.size + curCol] == 0)
				this.getAnswer(curRow, curCol);// If this position has not been backtracked, you don't have to recalculate the solution space
			var ansCount = this.getAnswerCount(curRow, curCol);
			if (ansCount == this.answerPosition[curRow * this.size + curCol]
					&& curRow == 0 && curCol == 0)
				break;//All backtracking is complete
			if (ansCount == 0) {
				this.answerPosition[curRow * this.size + curCol] = 0;// There's no solution. It's going to be 0
				// alert("There's no solution. Return！");
				if (curCol > 0) {
					curCol--;
				} else if (curCol == 0) {
					curCol = 8;
					curRow--;
				}
				this.layout[curRow * this.size + curCol] = 0;
				continue;
			}
			//Run out of solutions
			else if (this.answerPosition[curRow * this.size + curCol] == ansCount) {
				// alert("Run out of solutions！");
				this.answerPosition[curRow * this.size + curCol] = 0;
				if (curCol > 0) {
					curCol--;
				} else if (curCol == 0) {
					curCol = 8;
					curRow--;
				}
				this.layout[curRow * this.size + curCol] = 0;
				continue;
			} else {
				// Returns the number of solutions in the finger frame
				this.layout[curRow * this.size + curCol] = this.getAnswerNum(
						curRow, curCol, this.answerPosition[curRow * this.size
								+ curCol]);
				// alert("Loc：(" + curRow + ", " + curCol + ")="
				// + layout[curRow][curCol]);
				this.answerPosition[curRow * this.size + curCol]++;
				if (curCol == 8) {
					curCol = 0;
					curRow++;
				} else if (curCol < 8) {
					curCol++;
				}
			}
		}
	},
	//The binding event
	gameEvent : function() {
		var self=this;
		//Button click event
		$("#btn input:button").click(function(eventObject){
			switch(eventObject.currentTarget.name){
				case "start":
					self.initLayout();
					break;
				case "pause":
					self.pause();
					break;
				case "showAnswer":
					self.showAnswer();
					break;
				case "reset":
					self.reset();
					break;
			}
		});
		//Click to edit the event
		$("#gameBoard").click(function(eventObj){
			var $target = $(eventObj.target);
			var posi = $target.position();
			var gameBoardPos = $(this).position();
			var selectBoardPos = {top:gameBoardPos.top+posi.top,left:gameBoardPos.left+posi.left};
			var $selectBoard = $("#selectBoard");
			if($target.hasClass('editable')){
				if(posi.top+$selectBoard.height()>$(this).height()){
					selectBoardPos.top = selectBoardPos.top-$selectBoard.height()+$target.height();
				}
				if(posi.left+$selectBoard.width()>$(this).width()){
					selectBoardPos.left = selectBoardPos.left-$selectBoard.width()+$target.width();
				}
				$selectBoard.css({'top':selectBoardPos.top,'left':selectBoardPos.left,'display':'block'});
				self.editIndex = eventObj.target.id;
			}
		});
		//Digital panel click event
		$('#selectBoard').click(function(eventObj){
			var $target = $(eventObj.target);
			var userNum = parseInt($target.text());
			self.tmpnum = parseInt($("#"+self.editIndex).text());
			$("#"+self.editIndex).text(userNum);
			self.solving[self.editIndex] = userNum;
			for(var i=0;i<self.size*self.size;i++)$("#"+i).removeClass('background0');
			self.check();
			$('#selectBoard').css({'display':'none'});
			var solveStr = self.solving.join();
			if(solveStr.indexOf('0')<0){self.checkAllAnswer();}//The last check to see if the game is finished	
		}).mouseleave(function(){
			$(this).css({'display':'none'});
		});;

	},
	// Initializes the game situation
	initLayout : function() {
		var checkedIndex = this.getLevel()||1;	// Difficulty level
		var layoutStr = "";//Layout
		var selectTable = "";//Choice blank
		this.gameState = "start";
		$('#btn input[name="pause"]').val('Pause');
		this.generate(this.size);
		$("#gameBoard").html("");
		$('#selectBoard').html("");
		for (var i = 0; i < this.size; i++) {
			for (var j = 0; j < this.size; j++) {
				var rdm;
				if(checkedIndex<4){
					rdm = Math.floor(Math.random() * 4+1);//12345  1/5 2/5 3/5 3/4
				}else{
					rdm = Math.floor(Math.random() * 4+2);
				}
				if( ((i<3||i>5) && (j<3||j>5)) || ((i>=3&&i<=5) && (j>=3&&j<=5)) ){
					background = "background1";
				}else{
					background = "background2";
				}
				if( checkedIndex < rdm){
					layoutStr += '<div class="block radius '+background+'" id="'+(i*this.size+j)+'" name="blank">'+this.layout[i*this.size+j]+'</div>'
					this.solving[i * this.size + j] = this.layout[i * this.size
							+ j];	
				}else{
					console.log("==");
					layoutStr += '<div class="block radius editable '+background+'" id="'+(i*this.size+j)+'" name="blank">'+""+'</div>'
				}
			}
		}
		$("#gameBoard").html(layoutStr);
		// Eliminate possible multiple solution cases
		var isUnique = this.checkUnique();
		if(isUnique){
			this.regenerate(isUnique);
		}
		this.resetData = this.solving.concat();
		//Number selection table initialization
		for(var i=1 ; i<10 ; i++){
			selectTable += '<div name="selectDiv" class="selectDiv font block color radius">'+ i +'</div>';
		}
		$('#selectBoard').html(selectTable);
		//Successful build timing starts
		var self = this;
		clearInterval(this.gameTimer);
		this.gameTimer = null;
		this.gameTimer = setInterval(function(){
			self.showTime()
		},1000);
	},
	// Check if the player's answer is correct
	checkAllAnswer : function() {
		var part =document.getElementById("tips");
		part.style.display="none";
		var flag = 0;
		for (var i = 0; i < this.size; i++) {
			for (var j = 0; j < this.size; j++) {
				if (this.solving[i * this.size + j] != this.layout[i
						* this.size + j]) {
					flag++;
					$('#'+(i*this.size+j)).css("color",'red');
					this.showTips("There is an error");
					part.style.display="block";
				}
			}
		}
		if (flag == 0 && this.gameState != 'init') {
			clearInterval(this.gameTimer);
			var mask2 = document.getElementById('mask2')
			mask2.style.display ='block'
			//part.style.display="block";
		}
	},
	// There is only one answer to the generated game situation
	checkUnique : function() {
		var res = [];
		for (var r1 = 0; r1 < this.size - 1; r1++) {
			for (var r2 = r1 + 1; r2 < this.size; r2++) {
				for (var c1 = 0; c1 < this.size - 1; c1++) {
					for (var c2 = c1 + 1; c2 < this.size; c2++) {
						if (this.layout[r1 * this.size + c1] == this.layout[r2
								* this.size + c2]
								&& this.layout[r1 * this.size + c2] == this.layout[r2
										* this.size + c1]) {
							res.push([r1, r2, c1, c2]);
						}
					}
				}
			}
		}
		return res;
	},
	regenerate:function(isUnique){
		for (i = 0; i < isUnique.length; i++) {
			var r1 = isUnique[i][0];
			var r2 = isUnique[i][1];
			var c1 = isUnique[i][2];
			var c2 = isUnique[i][3];
			// If all four of the extra solutions are empty
			if (this.solving[r1 * this.size + c1] == 0
					&& this.solving[r1 * this.size + c2] == 0
					&& this.solving[r2 * this.size + c1] == 0
					&& this.solving[r2 * this.size + c2] == 0) {
				// Four in the air, one at random
				var rdm = Math.floor(Math.random() * 4);
				var r = isUnique[i][Math.floor(rdm / 2)];
				var c = isUnique[i][rdm % 2 + 2];
				$('#'+(r * this.size + c)).text(this.layout[r * this.size + c]).removeClass('editable');
				this.solving[r * this.size + c] = this.layout[r * this.size + c];
			}
		}
		//console.log(this.solving+"\n"+this.layout+"\n"+this.answerPosition)
		},
	showAnswer:function(){
		this.reset(1);
		for(var i = 0; i<this.size; i++){
			for(var j = 0;j <this.size; j++){
				$('#'+(i * this.size + j)).text(this.layout[i * this.size + j]);
			}
		}
	},
	// As you type your answer, check for any conflicts
	check : function() {
		for(var _index =0;_index<this.size*this.size;_index++){
			if($("#"+_index).hasClass('editable') && this.solving[_index]){
				var row = parseInt(parseInt(_index)/9);
				var col = parseInt(parseInt(_index)%9);
				var tabX = parseInt(row/3);
				var tabY = parseInt(col/3);
				for (var i=0 ; i<9 ; i++){
					for (var j=0 ; j<9 ; j++){
						if(i==row || j==col || (parseInt(i/3)==tabX && parseInt(j/3)==tabY)){//Associated with the element being checked
							if(this.solving[i*9+j] == this.solving[parseInt(_index) ]&& parseInt(_index) != i*9+j){
								$("#"+(i*9+j)).addClass('background0');
								$("#"+parseInt(_index)).addClass('background0');
							}
						}
					}
				}
			}
		}
	},
	// Pause or continue
	pause : function() {
		// When continuing, restart the timer
		if (this.gameState == 'pause') {
			var self = this;
			this.gameTimer = setInterval(function(){
				self.showTime()
			},1000);
			$('#btn input[name="pause"]').val('Pause');
			this.gameState = 'continue';
		} else {// When paused, stop the clock
			clearInterval(this.gameTimer);
			$('#btn input[name="pause"]').val('Continue');
			this.gameState = 'pause';
		}
	},
	// Achieve the game difficulty level
	getLevel : function() {
		var level = $("input[name='cd-dropdown']").val();
		return level<0?1:level;
	},
	// Fill in the answer again
	reset : function(_showAnswer) {
		for(var i = 0; i<Math.pow(this.size,2);i++){
			if(this.resetData[i]){
				$("#"+i).text(this.resetData[i]).removeClass('background0');
			}else{
				$("#"+i).text('').removeClass('background0');
			}
		}
		this.gameState = "start";
		$('#btn input[name="pause"]').val('Pause');
		var self = this;
		clearInterval(this.gameTimer);
		if(!_showAnswer){
			this.gameTimer = null;
			this.usedTime = 0;
			this.gameTimer = setInterval(function(){
				self.showTime();
			},1000);
		}
	},
	// Converts the interval to a time string, such as 90 seconds, to: 00:01:30
	changeTimeToString : function(time) {
		var res = '';
		var h = Math.floor(time / 3600);
		if (h < 10) {
			h = '0' + h;
		}
		var m = time % 3600;
		m = Math.floor(m / 60);
		if (m < 10) {
			m = '0' + m;
		}
		var s = time % 60;
		if (s < 10) {
			s = '0' + s;
		}
		res = h + ':' + m + ':' + s;
		return res;
	},
	//Show time
	showTime : function(){
		this.usedTime++;
		$("#time").text(this.changeTimeToString(this.usedTime));
	},
	showTips : function(_msg){
		$("#tips").html(_msg).css({"opacity":1});
		setTimeout(function(){$('#tips').css({'opacity':0})},2000);
	}
};

jQuery(function($){
	//Difficulty selection drop-down list created
	$( '#cd-dropdown' ).dropdown();
	var sudoku = new Sudoku(9);
	sudoku.initLayout();
	sudoku.gameEvent()//Bind game panel events
});




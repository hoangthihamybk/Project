(function (window) {
    var Player = function Player($type, $playerObject) {
        this.type = $type;
        this.object = $playerObject;
    };

    /**
     * Get current of player time
     * @returns {number}
     */
    Player.prototype.getTime = function() {
        switch (this.type) {
            case 'html5':
                return this.object.currentTime();
                break;
            case 'flash':
                return this.object.getTime();
                break;
            default:
                return 0;
                break;
        }
    };

    Player.prototype.getClip = function() {
        var $clip = null;
        switch (this.type) {
            case 'html5':
                var $playlist = this.object.playlist(),
                    $index = this.object.playlist.currentItem();
                if ($index == -1) {
                    $index = 0;//Fix chÆ°a set clip
                }
                if (typeof $playlist[$index] == 'object') {
                    $clip = $playlist[$index].clip;
                }
                break;
            case 'flash':
                $clip = this.object.getClip();
                break;
        }
        return $clip;
    };

    Player.prototype.getClipIndex = function() {
        var $index = 0;
        switch (this.type) {
            case 'html5':
                $index = this.object.playlist.currentItem();
                if ($index == -1) {
                    $index = 0;
                }
                break;
            case 'flash':
                var $clip = this.object.getClip();
                $index = $clip ? $clip.index : 0;
                break;
        }
        return $index;
    };

    Player.prototype.getScoID = function() {
        var $scoID = 0;
        switch (this.type) {
            case 'html5':
                var $playlist = this.object.playlist(),
                    $index = this.object.playlist.currentItem();

                if (typeof $playlist[$index] == 'object') {
                    var $clip = $playlist[$index].clip;
                    $scoID = $clip.id;
                }
                break;
            case 'flash':
                var $clip = this.object.getClip();
                $scoID = getUrlParam('scoid', $clip.originalUrl);
                if($scoID == ''){
                    $scoID = 0;
                }
                break;
        }
        if (!$scoID) {
            $scoID = 0;
        }
        return $scoID;
    };

    Player.prototype.seek = function($offsetTime) {
        switch (this.type) {
            case 'html5':
                this.object.currentTime($offsetTime);
                break;
            case 'flash':
                this.object.seek($offsetTime);
                break;
        }
    };

    Player.prototype.play = function ($offsetTime) {
        switch (this.type) {
            case 'html5':
                if (typeof $offsetTime == 'number') {
                    this.object.currentTime($offsetTime);
                }
                this.object.play();
                break;
            case 'flash':
                this.object.play($offsetTime);
                break;
        }
    };

    Player.prototype.pause = function () {
        switch (this.type) {
            case 'html5':
                this.object.pause();
                break;
            case 'flash':
                this.object.pause();
                break;
        }
    };

    Player.prototype.onStart = function ($callback) {
        switch (this.type) {
            case 'html5':
                var self = this.object;
                this.object.on('play', function () {
                    var $playlist = self.playlist(),
                        $index = self.playlist.currentItem(),
                        $beforeEvent = $(self).data('beforeEvent');

                    switch ($beforeEvent) {
                        case 'pause':
                            //Resume
                            break;
                        default:
                            //Start
                            if (typeof $playlist[$index] == 'object') {
                                var $clip = $playlist[$index].clip;
                                $callback.apply(self, $clip);
                            }
                            break;
                    }
                });
                break;
            case 'flash':
                this.object.onStart($callback);
                break;
        }
    };

    window.Player = Player;
})(window);
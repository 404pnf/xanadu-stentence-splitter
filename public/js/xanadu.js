(function () {
  'use strict';
  $('#data').val('Anonymous is a group of anonymous online activists. They are popularly associated with various online and offline protests commonly relating to freedom of speech. They often protest against political corruption and censorship.They also use hacking to attack various popular websites such as PayPal and the United States\' Department of Justice homepage. Other common targets include organizations perceived to be limiting the freedom of speech. Anonymous is also often associated with image boards such as 4chan and protests such as the Occupy Movement.');
  $('#sentence').submit(function (e) {
    var data = $('#data').val(),
      prettyPrint = function (text) {
        return _.reduce(text, function (a, e) {
          return '<p>' + a + e + '</p>';
        }, '');
      };
    e.preventDefault();

    $.post('/sentence_text', {data: data})
      .done(function (d) {
        console.log(d);
        var r = prettyPrint(d);
        $('#sentence_text').html('<div>' + r + '</div>');
      });

    $.post('/sentence_token', {data: data})
      .done(function (d) {
        console.log(d)
        $('#sentence_token').html(prettyPrint(d));
      });

    $.post('/word_frequency', {data: data})
      .done(function (d) {
        console.log(d);
        $('#word_frequency').html(JSON.stringify(d, null, 4));
      });
  });
}());





# split paragraph to sentences.

Example results:

      Array[5]
      0: "Anonymous is a group of anonymous online activists."
      1: "They are popularly associated with various online and offline protests commonly relating to freedom of speech."
      2: "They often protest against political corruption and censorship.They also use hacking to attack various popular websites such as PayPal and the United States' Department of Justice homepage."
      3: "Other common targets include organizations perceived to be limiting the freedom of speech."
      4: "Anonymous is also often associated with image boards such as 4chan and protests such as the Occupy Movement."
      length: 5
      __proto__: Array[0]

Usage demo:

    $.post('/sentence_text', {data: data})
      .done(function (d) {
        // 返回数组，每个元素是单独的句子。
      });

# split paragraph to sentences.

Example results:

    [[Array[8], Array[16], Array[28], Array[13], Array[18]]0: Array[8]0: "Anonymous"1: "is"2: "a"3: "group"4: "of"5: "anonymous"6: "online"7: "activists."length: 8__proto__: Array[0]1: Array[16]2: Array[28]3: Array[13]4: Array[18]

Usage demo:

    $.post('/sentence_token', {data: data})
      .done(function (d) {
        // 返回数组。每个元素是一个数组，其中的元素是该局
      });

# word frequency


Example results:

    {
      "Anonymous": 2,
      "group": 1,
      "anonymous": 1,
      "online": 2
    }

Usage demo:

    $.post('/word_frequency', {data: data})
      .done(function (d) {
        // an json object contains word frequency

      });
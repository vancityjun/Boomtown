PGDMP         $                 x            boomtown    12.0    12.0     &           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            '           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            (           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            )           1262    16552    boomtown    DATABASE     �   CREATE DATABASE boomtown WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'English_United States.949' LC_CTYPE = 'English_United States.949';
    DROP DATABASE boomtown;
                postgres    false            �            1259    16577    items    TABLE     �   CREATE TABLE public.items (
    id integer NOT NULL,
    title text NOT NULL,
    description text NOT NULL,
    "imageUrl" text,
    "ownerId" integer,
    "borrowerId" integer
);
    DROP TABLE public.items;
       public         heap    postgres    false            �            1259    16575    items_id_seq    SEQUENCE     �   CREATE SEQUENCE public.items_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.items_id_seq;
       public          postgres    false    207            *           0    0    items_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.items_id_seq OWNED BY public.items.id;
          public          postgres    false    206            �            1259    16596    itemtags    TABLE     L   CREATE TABLE public.itemtags (
    "itemId" integer,
    "tagId" integer
);
    DROP TABLE public.itemtags;
       public         heap    postgres    false            �            1259    16555    tags    TABLE     O   CREATE TABLE public.tags (
    id integer NOT NULL,
    title text NOT NULL
);
    DROP TABLE public.tags;
       public         heap    postgres    false            �            1259    16553    tags_id_seq    SEQUENCE     �   CREATE SEQUENCE public.tags_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 "   DROP SEQUENCE public.tags_id_seq;
       public          postgres    false    203            +           0    0    tags_id_seq    SEQUENCE OWNED BY     ;   ALTER SEQUENCE public.tags_id_seq OWNED BY public.tags.id;
          public          postgres    false    202            �            1259    16566    users    TABLE     �   CREATE TABLE public.users (
    id integer NOT NULL,
    fullname text NOT NULL,
    email text NOT NULL,
    password text NOT NULL,
    bio text,
    avatar text
);
    DROP TABLE public.users;
       public         heap    postgres    false            �            1259    16564    users_id_seq    SEQUENCE     �   CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.users_id_seq;
       public          postgres    false    205            ,           0    0    users_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;
          public          postgres    false    204            �
           2604    16580    items id    DEFAULT     d   ALTER TABLE ONLY public.items ALTER COLUMN id SET DEFAULT nextval('public.items_id_seq'::regclass);
 7   ALTER TABLE public.items ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    206    207    207            �
           2604    16558    tags id    DEFAULT     b   ALTER TABLE ONLY public.tags ALTER COLUMN id SET DEFAULT nextval('public.tags_id_seq'::regclass);
 6   ALTER TABLE public.tags ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    203    202    203            �
           2604    16569    users id    DEFAULT     d   ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);
 7   ALTER TABLE public.users ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    205    204    205            "          0    16577    items 
   TABLE DATA           \   COPY public.items (id, title, description, "imageUrl", "ownerId", "borrowerId") FROM stdin;
    public          postgres    false    207   =        #          0    16596    itemtags 
   TABLE DATA           5   COPY public.itemtags ("itemId", "tagId") FROM stdin;
    public          postgres    false    208   �                  0    16555    tags 
   TABLE DATA           )   COPY public.tags (id, title) FROM stdin;
    public          postgres    false    203   !                  0    16566    users 
   TABLE DATA           K   COPY public.users (id, fullname, email, password, bio, avatar) FROM stdin;
    public          postgres    false    205   �!       -           0    0    items_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.items_id_seq', 54, true);
          public          postgres    false    206            .           0    0    tags_id_seq    SEQUENCE SET     9   SELECT pg_catalog.setval('public.tags_id_seq', 9, true);
          public          postgres    false    202            /           0    0    users_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.users_id_seq', 27, true);
          public          postgres    false    204            �
           2606    16585    items items_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.items
    ADD CONSTRAINT items_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.items DROP CONSTRAINT items_pkey;
       public            postgres    false    207            �
           2606    16563    tags tags_pkey 
   CONSTRAINT     L   ALTER TABLE ONLY public.tags
    ADD CONSTRAINT tags_pkey PRIMARY KEY (id);
 8   ALTER TABLE ONLY public.tags DROP CONSTRAINT tags_pkey;
       public            postgres    false    203            �
           2606    16574    users users_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.users DROP CONSTRAINT users_pkey;
       public            postgres    false    205            �
           2606    16591    items items_borrowerId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.items
    ADD CONSTRAINT "items_borrowerId_fkey" FOREIGN KEY ("borrowerId") REFERENCES public.users(id);
 G   ALTER TABLE ONLY public.items DROP CONSTRAINT "items_borrowerId_fkey";
       public          postgres    false    207    2712    205            �
           2606    16586    items items_ownerId_fkey    FK CONSTRAINT     {   ALTER TABLE ONLY public.items
    ADD CONSTRAINT "items_ownerId_fkey" FOREIGN KEY ("ownerId") REFERENCES public.users(id);
 D   ALTER TABLE ONLY public.items DROP CONSTRAINT "items_ownerId_fkey";
       public          postgres    false    207    2712    205            �
           2606    16599    itemtags itemtags_itemId_fkey    FK CONSTRAINT        ALTER TABLE ONLY public.itemtags
    ADD CONSTRAINT "itemtags_itemId_fkey" FOREIGN KEY ("itemId") REFERENCES public.items(id);
 I   ALTER TABLE ONLY public.itemtags DROP CONSTRAINT "itemtags_itemId_fkey";
       public          postgres    false    208    207    2714            �
           2606    16604    itemtags itemtags_tagId_fkey    FK CONSTRAINT     |   ALTER TABLE ONLY public.itemtags
    ADD CONSTRAINT "itemtags_tagId_fkey" FOREIGN KEY ("tagId") REFERENCES public.tags(id);
 H   ALTER TABLE ONLY public.itemtags DROP CONSTRAINT "itemtags_tagId_fkey";
       public          postgres    false    2710    203    208            "   |   x�u�A
�@EיS�	D��w���&�M��&
�ނ ���/��_N0]���`�1���ݒ�]���6>>y}�r;�c5t!S!W��jT����2�8h&~�MO�ظf�����oRJ_��?�      #   .   x�3��4�2�� �D�s��XƜ� ��(���� ��         w   x�%��
�0 �s��A��0t��L�^J\�Kf��{��m�Zwp�f4k�apZ��J^U8vp���)�0R���Z��Ϊ��c��A�k[H���J�Y�K����|l�a�)�          [  x�}��n�@���]�ƙv^PDQ�ָp�*2�<}kS�6M�������#`��i��#�i74L�,@�:��`R!�Q���X7T�w�Dh
�Oi|A�V~{���h_F7�
�ϩa�s�2=�_�����?;�̇��MӰ`�p��B��k�x�x��Jh.'�ے��&�ӌ1������͏���A<>�LS#���x�m>X
����27�S�f��aR�j�"�e����ٌΊ$L�Dz݀���e81����װ�"biV�4���!���Xe�<�y�g��X���WD��jƛ뱣�~ ��П�h����Kn��t\�9
4�x���R��> �n�~     